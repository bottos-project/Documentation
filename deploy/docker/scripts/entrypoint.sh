#!/bin/bash


function startMongod()
{
	mongodb=$1
	if [ "$mongodb" = true ]
	then
		# must create the data and log dir firstly
		mkdir -p $MONGODIR"/data/db/"
		mkdir -p $MONGODIR"/log/"
		nohup mongod --dbpath $MONGODIR"/data/db" --logpath $MONGODIR"/log/mongodb.log" --logappend --port $MONGOPORT > $LOGDIR"nohup_mongodb.log" 2>&1 &
	fi

	sleep 3
}


function waitUntilNodeStarted()
{
	retry=0
	retryLimit=60
	sleepTime=1
	while (( retry <= retryLimit ))
	do	
		headBlockNum=$(curl -s http://127.0.0.1:8689/v1/block/height | awk -F ',' '{print $3}' | grep 'head_block_num' |awk -F ':' '{print $3}')
		echo $(date +"%Y-%m-%dT%T")" $retry:waiting for genesis node completely launch, headBlockNum:$headBlockNum"
		if (( headBlockNum > 1 ))
		then
			echo $(date +"%Y-%m-%dT%T")" node launched successfully!"
			break
		fi
		(( retry++ ))
		if (( retry > retryLimit ))
		then
			echo $(date +"%Y-%m-%dT%T")" Timeout for waiting for genesis node launch, exit!"
			exit 1
		fi
		sleep $sleepTime
	done
}


function waitUntilInitDelegateFinished()
{
	# wait for initDelegate.sh done
	retry=0
	retryLimit=300
	sleepTime=6
	while (( retry <= retryLimit ))
	do
		echo $(date +"%Y-%m-%dT%T")" $retry:waiting for initDelegate.sh done"
		processedFileCount=$(ls $shareddir | grep "^loaded.account_publickey" | wc -l)
		if [[ $processedFileCount -eq $delegateNum ]]
		then
			echo $(date +"%Y-%m-%dT%T")" init delegate nodes done, continue..."
			break
		fi
		(( retry++ ))
		if (( retry > retryLimit ))
		then
			echo $(date +"%Y-%m-%dT%T")" init not done, rawFile:$filecount, processedFile:$processedFileCount"
			exit 1
		fi
		sleep $sleepTime
	done
}


function help()
{
	echo "Usage: entrypoint.sh --type=genesis|delegate --account=\$account --mongodb=true|false --delegateNum=\$num --peerlist=\$host1:\$port1,\$host2:\$port2"
}


#------------------------------ MAIN ------------------------------#
# parse input parameter
ARGS=`getopt -o h -l type:,account:,mongodb:,delegateNum:,peerlist: -n 'entrypoint.sh' -- "$@"`


if [[ $? != 0 || $@ = '' ]]
then
	help
	exit 1
fi

eval set -- "$ARGS"

while [ -n $1 ]
do
	case "$1" in
		--type) type=$2; shift 2;;
		--account) account=$2; shift 2;;
		--mongodb) mongodb=$2; shift 2;;
		--peerlist) peerlist=$2; shift 2;;
		--delegateNum) delegateNum=$2; shift 2;;	
		--) shift; break;;
		-h) help; exit 1;;
		*) echo "unknown parameter:$1"; break;;
	esac
done

# handle kill signal to safety exit
trap "echo 'receive kill SIGINT';/Bottos/scripts/stop.sh --type=all;exit 0" 2
trap "echo 'receive kill SIGKILL';/Bottos/scripts/stop.sh --type=all;exit 0" 9
trap "echo 'receive kill SIGTERM';/Bottos/scripts/stop.sh --type=all;exit 0" 15

# set global environment variables
source /Bottos/scripts/setEnv.sh

config=$CONFIGDIR"config.toml"
genesis=$CONFIGDIR"genesis.toml"
shareddir=$SHAREDDIR
savedpublickey=$CONFIGDIR"publickey"

# start mongodb
startMongod "$mongodb"

# start node
if [ $type = "genesis" ]
then
	if [[ -s "$config" && -s "$genesis" ]]
	then
		start.sh --type=$type --account=$account --peerlist=$peerlist --mongodb=$mongodb
	else
		createNewKey.sh --save=true --type=$type --account=$account
		publickey=$(cat $savedpublickey)
		start.sh --type=$type --account=$account --publickey=$publickey --peerlist=$peerlist --mongodb=$mongodb
		waitUntilNodeStarted
		# if it's not a single node version
		if (( delegateNum > 0 ))
		then
			# launch a daemon process to init other delegate nodes
			nohup initDelegate.sh $delegateNum > $LOGDIR"nohup_initDelegate.log" 2>&1 &
			waitUntilInitDelegateFinished
			## wait for all delegate nodes to sync
			sleep 30

			# transfer the blockchain production right to other delegate nodes
			echo $(date +"%Y-%m-%dT%T")" tranfer block production right from genesis node to delegate nodes"
			## get the latest block height number
			latestHeight=$(curl -s http://127.0.0.1:8689/v1/block/height | grep 'head_block_num' | awk -F "," '{print $3}' | awk -F ':' '{print $3}')
			actblknum=$((latestHeight+50))
			echo $(date +"%Y-%m-%dT%T")" transfer the blockchain production right at $actblknum"
			blkprodtrans=$(bcli genesis blkprodtrans --sender bottos --actblknum $actblknum)
			echo $(date +"%Y-%m-%dT%T")" $blkprodtrans"
			trxhash=$(echo $blkprodtrans | grep TrxHash | awk '{print $2}')
			retry=0
			retryLimit=60
			sleepTime=1
			while (( retry <= retryLimit ))
			do
				echo $(date +"%Y-%m-%dT%T")" $retry:waiting for blkprodtrans committed"
				data="{\"trx_hash\":\"$trxhash\"}"
				if [ -n "$(curl -s -H "Content-Type:application/json" -X POST -d "$data" http://127.0.0.1:8689/v1/transaction/status | grep -w 'committed')" ]
				then
					echo $(date +"%Y-%m-%dT%T")" blkprodtrans committed:$trxhash"
					break
				fi
				(( retry++ ))
				if (( retry > retryLimit ))
				then
					echo $(date +"%Y-%m-%dT%T")" Timeout for waiting for blkprodtrans committed"
					exit 1
				fi
				sleep $sleepTime
			done
		fi
	fi


elif [ $type = "delegate" ]
then
	if [[ -s "$config" && -s "$genesis" ]]
	then
		start.sh --type=$type --account=$account --peerlist=$peerlist --mongodb=$mongodb
	else
		createNewKey.sh --save=true --type=$type --account=$account
		publickey=$(cat $savedpublickey)
		# wait until genesis node initialization done
		retry=0
		retryLimit=300
		sleepTime=6
		while (( retry <= retryLimit ))
		do
			echo $(date +"%Y-%m-%dT%T")" $retry:waiting for genesis node initialize this delegate node: account:$account,publickey:$publickey ..."
			if [ -s "$shareddir"loaded.account_publickey_$account"" ]
			then
				echo $(date +"%Y-%m-%dT%T")" initialize this delegate node done, continue..."
				break
			fi
			(( retry++ ))
			if (( retry > retryLimit ))
			then
				echo $(date +"%Y-%m-%dT%T")" Timeout for waiting for genesis node do initialization, exit!"
				exit 1
			fi
			sleep $sleepTime
		done
		if [[ -s $shareddir"genesis.toml" ]]
		then
			genesistime=$(cat $shareddir"genesis.toml" | grep "GenesisTime" | sed /grep/d | awk '{print $3}' | tr -d [\"]) 
			genesiskey=$(cat $shareddir"genesis.toml" | grep "GenesisKey" | sed /grep/d | awk '{print $3}' | tr -d [\"])
			start.sh --type=$type --account=$account --publickey=$publickey \
				--genesistime=$genesistime --genesiskey=$genesiskey --peerlist=$peerlist --mongodb=$mongodb
		else
			echo $(date +"%Y-%m-%dT%T")" can NOT found a valid genesis file in $shareddir, exit!"
			exit 1
		fi
	fi
fi

# keep container on
while true
do
	sleep 3
done

