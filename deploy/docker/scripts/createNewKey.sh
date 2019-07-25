#!/bin/bash


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
		retryLimit=30
		sleepTime=1
		while (( retry <= retryLimit ))
		do
			if [ -n "$(curl -s http://127.0.0.1:6869/v1/wallet/list | grep '"msg":"success"')" ]
			then
				echo $(date +"%Y-%m-%dT%T")" wallet launched successfully!"
				break
			else
				echo $(date +"%Y-%m-%dT%T")" wait for wallet launched, retry:$((retry))"
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
		echo $(date +"%Y-%m-%dT%T")" already have existing wallet process:$pid"
	fi
}


function stopWallet()
{
	pid=$(ps -ef | grep wallet | sed '/grep/d' | awk -F ' ' '{print $2}')
	echo $(date +"%Y-%m-%dT%T")" kill wallet: $pid"
	kill -2 $pid
}


function makeKeyPair()
{
	keyPair=$(bcli wallet generatekey)
	# pubkey
	if [[ -n $(echo $keyPair | grep -o "public_key") ]]
	then
		public_key=$(echo $keyPair | awk '{print $2}')
	fi
	# privkey
	if [[ -n $(echo $keyPair | grep -o "private_key") ]]
	then
		private_key=$(echo $keyPair | awk '{print $4}')
	fi

	# save public_key and private_key for backup (for debug)
	echo "public_key:$public_key;private_key:$private_key"  > $TEMPDIR/backup_$public_key
}


function createWallet()
{
	nodetype=$1
	account=$2
	if [ -z "$3" ]
	then
		password=$WALLETPASSWD
	else
		password=$3
	fi
	privatekey=$4
	
	echo $(date +"%Y-%m-%dT%T")" start create wallet for account:$account type:$nodetype"
	retry=0
	retryLimit=6
	sleepTime=1
	while (( retry <= retryLimit ))
	do
		if [ "$nodetype" = "delegate" ]
		then
			data="{\"account_name\":\"$account\",\"passwd\":\"$password\",\"private_key\":\"$privatekey\",\"type\":\"delegate\"}"
		else
			data="{\"account_name\":\"$account\",\"passwd\":\"$password\",\"private_key\":\"$privatekey\"}"
		fi
		actionRes=$(curl -s -H "Content-Type:application/json" -X POST -d "$data" http://127.0.0.1:6869/v1/wallet/createwalletmanual)
		echo $(date +"%Y-%m-%dT%T")" $actionRes"
		if [ -n "$(echo $actionRes | grep '"msg":"success"')" ]
		then
			echo $(date +"%Y-%m-%dT%T")" create wallet for $account successfully"
			break
		else
			echo $(date +"%Y-%m-%dT%T")" wait for create wallet for $account, retry:$((retry))"
		fi
		(( retry++ ))
		if (( retry > retryLimit ))
		then
			echo $(date +"%Y-%m-%dT%T")" create wallet for $account failed, exit"
			exit 1
		fi
		sleep $sleepTime
	done
}


function savePublickey()
{
	publickey=$1
	targetfile=$2
	echo "$publickey" > $targetfile
}


function sharePublickey()
{
	nodetype=$1
	account=$2
	publickey=$3
	targetfile=$4
	if [ "$nodetype" = "delegate" ]
	then
		echo "account:$account,publickey:$publickey,loaded:false" > $targetfile
	fi
}


function help()
{
	echo "Usage: createNewkey.sh --save=true|false --type=node|genesis|delegate --account= --password="
}


#------------------------------ MAIN ------------------------------#

# parse input parameter
ARGS=`getopt -o h -l save:,type::,account::,password:: -n 'createNewkey.sh' -- "$@"`

if [[ $? != 0 || $@ = '' ]]; then
	help
	exit 1
fi

eval set -- "$ARGS"

while [ -n $1 ]
do
	case "$1" in
		--save) save=$2; shift 2;;
		--type) type=$2; shift 2;;
		--account) account=$2; shift 2;;
		--password) password=$2; shift 2;;
		--) shift; break;;
		-h) help; exit 1;;
		*) echo "unknown parameter:$1"; break;;
	esac
done


# start
if [ $save == false ]
then
	makeKeyPair
elif [ $save == true ]
then
	makeKeyPair	
	makeWalletOn "$LOCALHOST" "$WALLETPORT"
	createWallet "$type" "$account" "$password" "$private_key"
	stopWallet
	# save publickey to file, it's required in next step to launch the node
	savePublickey "$public_key" "$CONFIGDIR"publickey""	
	# share publickey to shareddir in delegate node,
	# in genesis node, these publickey files will be processed	
	sharePublickey "$type" "$account" "$public_key" "$SHAREDDIR"account_publickey_$account""
else
	help
fi


