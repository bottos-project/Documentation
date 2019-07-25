#!/bin/bash


function startNode()
{
	# input parameters
	nodetype=$1
	account=$2
	publickey=$3
	genesistime=$4
	genesiskey=$5
	mongourl=$6
	mongodb=$7
	peerlist=$8

	config=$CONFIGDIR"config.toml"
	genesis=$CONFIGDIR"genesis.toml"
	shareddir=$SHAREDDIR

	wallethost=$LOCALHOST
	walletport=$WALLETPORT
	walletpassword=$WALLETPASSWD

	# check if there exists a valid keystore file for $account
	checkKeystore "$nodetype" "$account"
	# start a wallet process if not exist
	makeWalletOn "$wallethost" "$walletport"

	# check the existing config files
	if [ -s "$config" -a -s "$genesis" ]
	then
		echo $(date +"%Y-%m-%dT%T")" found existing config and genesis file"
		readPublickeyFromConfig "$config"
		# check if PeerList in config.toml needs to be update
		ifNeedUpdatePeerlist "$peerlist" "$config"
	else
		echo $(date +"%Y-%m-%dT%T")" NOT found existing config and genesis file, generate new"
		# get parameters
		makePeerList "$peerlist"
		makeSolo "$nodetype"
		makeMongourl "$mongourl"
		makeWalletdir
		makeDatadir
		makeP2pservaddr
		# create config.toml
		createConfig.sh --peerlist "$peerlist" --solo "$solo" --wallethost "$wallethost" \
			--walletport "$walletport" --publickey "$publickey" \
			--mongourl "$mongourl" --walletdir "$walletdir" --datadir "$datadir" \
			--p2pservaddr "$p2pservaddr"
		# create genesis.toml
		createGenesis "$nodetype" "$publickey" "$genesistime" "$genesiskey"
	fi
	# share genesis.toml from genesis node to other node
	shareGenesis "$nodetype" "$genesis" "$shareddir"
	# start node
	# need to unlock wallet firstly
	unlockWallet "$nodetype" "$account" "$walletpassword"
	startBottos "$nodetype" "$config" "$genesis" "$account" "$publickey" "$mongodb"
}


function checkKeystore()
{
	nodetype=$1
	account=$2
	keystoredir=$KEYSTOREDIR
	if [ $nodetype = "delegate" ]
	then
		keystore=$keystoredir$account"_sign.keystore"
	else
		keystore=$keystoredir$account".keystore"
	fi

	retry=0
	retryLimit=30
	sleepTime=1
	while (( retry <= retryLimit ))
	do
		if [ -s "$keystore" ]
		then
			echo $(date +"%Y-%m-%dT%T")" $keystore generated successfully!"
			break
		fi

		if (( retry > retryLimit ))
		then
			echo $(date +"%Y-%m-%dT%T")" $keystore generated failed, exit!"
			exit 1
		fi
		sleep $sleepTime
	done
}


function makeWalletOn()
{
	host=$1
	port=$2
	pid=$(ps -ef | grep 'wallet' | sed '/grep/d' | awk -F ' ' '{print $2}') 
	if [ -z "$pid" ]
	then
		echo $(date +"%Y-%m-%dT%T")" starting new wallet"
		cd $BINDIR && nohup ./wallet --wallet-servaddr $host --port $port > $LOGDIR"nohup_wallet.log" 2>&1 &
		# wait until wallet completed launched
		retry=0
		retryLimit=10
		sleepTime=6
		while (( retry <= retryLimit ))
		do
			if [ -n "$(ps -ef | grep "./wallet --wallet-servaddr")" ]
			then
				echo $(date +"%Y-%m-%dT%T")" wallet launched successfully!"
				break
			fi
			(( retry++ ))
			if (( retry > retryLimit ))
			then
				echo $(date +"%Y-%m-%dT%T")" wallet launched failed!"
				exit 1
			fi
			sleep $sleepTime
		done
	else
		echo $(date +"%Y-%m-%dT%T")" already have existing wallet process pid:$pid"
	fi
}


function readPublickeyFromConfig()
{
	config=$1
	publickey=$(cat $config | grep "^PublicKey" | awk -F '=' '{print $2}' | tr -d ' "')
}


function ifNeedUpdatePeerlist()
{
	peerliststr=$1
	config=$2

	makePeerList $peerliststr
	peerlist_current=$(cat $config | grep "^PeerList" | awk -F '=' '{print $2}'i | tr -d " ")

	if [ "$peerlist" != "$peerlist_current" ]
	then
		echo $(date +"%Y-%m-%dT%T")" update peerlist in config.toml!"
		sed -i "s/^PeerList.*/PeerList = $peerlist/g" $config
	else
		echo $(date +"%Y-%m-%dT%T")" no need to update peerlist in config.toml"
	fi
}


function makePeerList()
{
        peerliststr=$1
        if [[ -z "$peerliststr" ]]
        then
                peerlist='[]'
        elif [[ $peerliststr =~ ^.+:.+(,.*)?$ ]]
        then
                # eg: host1:port1,host2:port2,host3:port3 -> (host1:port1 host2:port2 host3:port3)
                peers=(${peerliststr//\,/ })
                peerlist='['
                for peer in "${peers[@]}"
                do
                        peerlist+="\"$peer\","
                done
                peerlist+=']'
        else
                echo $(date +"%Y-%m-%dT%T")" given peerlist:$2 is incorrect"
                exit
        fi
}


function makeSolo()
{
	nodetype=$1
	if [ $nodetype = "genesis" ]
	then
		solo=true
	elif [[ $nodetype = "node" || $nodetype = "delegate" ]]
	then
		solo=false
	fi
}


function makeMongourl()
{
	if [ -z "$1" ]
	then
		mongourl=$MONGOURL
	else
		mongourl=$1
	fi
}


function makeWalletdir()
{
	walletdir=$WALLETDIR
}


function makeDatadir()
{
	datadir=$DATADIR
}


function makeP2pservaddr()
{
	p2pservaddr_eth0=$(ifconfig eth0 | grep -w inet | awk '{print $2}')
	if [ -n "$p2pservaddr_eth0" ]
	then
		p2pservaddr=$p2pservaddr_eth0
		return 0
	fi

	p2pservaddr_ens33=$(ifconfig ens33 | grep -w inet | awk '{print $2}')
	if [ -n "$p2pservaddr_ens33" ]
	then
		p2pservaddr=$p2pservaddr_ens33
		return 0
	fi

	echo "can NOT find a valid network interface!"
	exit 1
}


function createGenesis()
{
	nodetype=$1
	publickey=$2
	genesistime=$3
	genesiskey=$4
	if [ $nodetype = "genesis" ]
	then
		makeGenesisTime
		createGenesis.sh --genesisTime $time --genesisKey $publickey
	elif [[ $nodetype = "node" || $nodetype = "delegate" ]]
	then
		createGenesis.sh --genesisTime $genesistime --genesisKey $genesiskey
	fi
}


function makeGenesisTime()
{
	# take care of the format, "XXXX-XX-XXT12:00:00"
	time=$(date -d "- 7 day" "+%Y-%m-%dT12:00:00")
}


function shareGenesis()
{
	genesis=$2
	shareddir=$3
	if [ $nodetype = "genesis" ]
	then
		echo $(date +"%Y-%m-%dT%T")" share genesis to $shareddir"
		cp $genesis $shareddir
	fi
}


function unlockWallet()
{
	nodetype=$1
	account=$2
	password=$3

	echo $(date +"%Y-%m-%dT%T")" start unlock wallet for $account"
	retry=0
	retryLimit=6
	sleepTime=1
	while (( retry <= retryLimit ))
	do
		if [ "$nodetype" = "delegate" ]
		then
			data="{\"account_name\":\"$account\",\"passwd\":\"$password\",\"type\":\"delegate\"}"
		else
			data="{\"account_name\":\"$account\",\"passwd\":\"$password\"}"
		fi
		unlock=$(curl -s -H "Content-Type:application/json" -X POST -d "$data" http://127.0.0.1:6869/v1/wallet/unlockaccount)
		echo $(date +"%Y-%m-%dT%T")" $unlock"
		                if [ $(echo $unlock | grep '"msg":"success"') ]
                then
                        echo $(date +"%Y-%m-%dT%T")" unlock $account successfully"
                        break
                else
                        echo $(date +"%Y-%m-%dT%T")" wait for unlock $account, retry:$((retry))"
                fi
                (( retry++ ))
                if (( retry > retryLimit ))
                then
                        echo $(date +"%Y-%m-%dT%T")" unlock $account failed, exit"
                        exit 1
                fi
                sleep $sleepTime
        done
}


function startBottos()
{
	nodetype=$1
	config=$2
	genesis=$3
	delegateaccount=$4
	signkey=$5
	mongodb=$6
	echo $(date +"%Y-%m-%dT%T")" start node"
	if [ $nodetype = "genesis" ]
	then
		if [ "$mongodb" = "true" ]
		then
			nohup bottos --delegate "$account" \
				--config "$config" \
				--genesis "$genesis" \
			        --enable-mongodb > $LOGDIR"nohup_bottos.log" 2>&1 &
		else
			nohup bottos --delegate "$account" \
				--config "$config" \
				--genesis "$genesis" > $LOGDIR"nohup_bottos.log" 2>&1 &
		fi
	elif [ $nodetype = "delegate" ]
	then
		if [ "$mongodb" = "true" ]
		then
			nohup bottos --delegate "$account" \
				--delegate-signkey "$signkey" \
				--config "$config" \
				--genesis "$genesis" \
				--enable-mongodb > $LOGDIR"nohup_bottos.log" 2>&1 &
		else
			 nohup bottos --delegate "$account" \
				--delegate-signkey "$signkey" \
				--config "$config" \
				--genesis "$genesis" > $LOGDIR"nohup_bottos.log" 2>&1 &
		fi
	elif [ $nodetype = "node" ]
	then
		if [ "$mongodb" = "true" ]
		then
			nohup bottos --config "$config" \
				--genesis "$genesis" \
				--enable-mongodb > $LOGDIR"nohup_bottos.log" 2>&1 &
		else
			nohup bottos --config "$config" \
				--genesis "$genesis" > $LOGDIR"nohup_bottos.log" 2>&1 &
		fi
	fi
}


function help()
{
	echo "Usage:"
	echo "       start.sh --type=genesis --account= --publickey= --peerlist=host1:port1 --mongodb=true|false,..."
	echo "       start.sh --type=node|delegate --genesistime= --genesiskey= --account= --publickey= --peerlist=host1:port1 --mongodb=true|false,..."
}


#------------------------------ MAIN ------------------------------#

# parse input parameter
ARGS=`getopt -o h -l type:,account:,publickey::,peerlist::,genesistime::,genesiskey::,mongourl::,mongodb: -n 'start.sh' -- "$@"`

if [[ $? != 0 || $@ = '' ]]; then
	help
	exit 1
fi

eval set -- "$ARGS"

while [ -n $1 ]
do
	case "$1" in
		--type) type=$2; shift 2;;
		--account) account=$2; shift 2;;
		--publickey) publickey=$2; shift 2;;
		--peerlist) peerlist=$2; shift 2;;
		--genesistime) genesistime=$2; shift 2;;
		--genesiskey) genesiskey=$2; shift 2;;
		--mongourl) mongourl=$2; shift 2;;
		--mongodb) mongodb=$2; shift 2;;
		--) shift; break;;
		-h) help; exit 1;;
		*) echo "unknown parameter:$1"; break;;
	esac
done


# start
case "$type" in
	node) startNode node "$account" "$publickey" "$genesistime" "$genesiskey" "$mongourl" "$mongodb" "$peerlist";;
	delegate) startNode delegate "$account" "$publickey" "$genesistime" "$genesiskey" "$mongourl" "$mongodb" "$peerlist";;
	genesis) startNode genesis "$account" "$publickey" "" "" "$mongourl" "$mongodb" "$peerlist";;
	*) echo "incorrect type:$type"; exit 1;;
esac


