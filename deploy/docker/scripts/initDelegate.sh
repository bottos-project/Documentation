#!/bin/bash


delegateNum=$1

function unlockWallet()
{
	echo $(date +"%Y-%m-%dT%T")" start unlock wallet for bottos"
	retry=0
	retryLimit=6
	sleepTime=1
	while (( retry <= retryLimit ))
	do
		data="{\"account_name\":\"bottos\",\"passwd\":\"$WALLETPASSWD\"}"
		unlock=$(curl -s -H "Content-Type:application/json" -X POST -d "$data" http://127.0.0.1:6869/v1/wallet/unlockaccount)
		echo $(date +"%Y-%m-%dT%T")" $unlock"
		if [ -n "$(echo $unlock | grep '"msg":"success"')" ]
		then
			echo $(date +"%Y-%m-%dT%T")" unlock bottos successfully"
			break
		else
			echo $(date +"%Y-%m-%dT%T")" wait for unlock bottos, retry:$((retry))"
		fi
		(( retry++ ))
		if (( retry > retryLimit ))
		then
			echo $(date +"%Y-%m-%dT%T")" unlock bottos failed, exit"
			exit 1
		fi
		sleep $sleepTime
	done
}


shareddir=$SHAREDDIR

while true
do
	fileCount=$(ls $shareddir | grep "^account_publickey_" | wc -l)
	if (( fileCount == delegateNum ))
	then
		echo $(date +"%Y-%m-%dT%T")" find $fileCount files, expect $delegateNum files, continue..."
		break
	else
		echo $(date +"%Y-%m-%dT%T")" find $fileCount files, expect $delegateNum files, waiting..."
		sleep 0.5
	fi
done

for filename in $(ls -1 $shareddir | grep "^account_publickey")
do
	file=$shareddir$filename
	loaded=$(cat $file | awk -F ',' '{print $3}' | grep "loaded" | awk -F ':' '{print $2}')
	if [ $loaded = "false" ]
	then
		account=$(cat $file | awk -F ',' '{print $1}' | grep "account" | awk -F ':' '{print $2}')
		publickey=$(cat $file | awk -F ',' '{print $2}' | grep "publickey" | awk -F ':' '{print $2}')
		echo $(date +"%Y-%m-%dT%T")" initializing account:$account publickey:$publickey"
		
		unlockWallet
		# create $account
		echo $(date +"%Y-%m-%dT%T")" creating account $account by bottos"
		actionRes=$(bcli account create --account "$account" --pubkey "$publickey" --referrer "bottos")
		echo $(date +"%Y-%m-%dT%T")" $actionRes"
		trx=$(echo $actionRes | grep TrxHash | awk '{print $2}')
		## wait until trx committed
                retry=0
		retryLimit=120
		sleepTime=0.5
                while (( retry <= retryLimit ))
                do
                        echo $(date +"%Y-%m-%dT%T")" $retry:waiting for $trx to be committed"
                        data="{\"trx_hash\":\"$trx\"}"
                        if [ -n "$(curl -s -H "Content-Type:application/json" -X POST -d "$data" http://127.0.0.1:8689/v1/transaction/status | grep -w 'committed')" ]
                        then
                                echo $(date +"%Y-%m-%dT%T")" $trx has been committed"
                                break
                        fi
                        (( retry++ ))
                        if (( retry > retryLimit ))
                        then
                                echo $(date +"%Y-%m-%dT%T")" Timeout for waiting for $trx to be committed"
                                exit 1
                        fi
                        sleep $sleepTime
                done

		unlockWallet
		# transfer BTO from bottos to $account
		amount=10
		echo $(date +"%Y-%m-%dT%T")" transfer $amount BTO from bottos to $account"
		actionRes=$(bcli transfer --from "bottos" --to "$account" --amount "$amount")
		echo $(date +"%Y-%m-%dT%T")" $actionRes"
                trx=$(echo $actionRes | grep TrxHash | awk '{print $2}')
		## wait until trx committed
                retry=0
		retryLimit=120
		sleepTime=0.5
                while (( retry <= retryLimit ))
                do
                        echo $(date +"%Y-%m-%dT%T")" $retry:waiting for $trx to be committed"
                        data="{\"trx_hash\":\"$trx\"}"
                        if [ -n "$(curl -s -H "Content-Type:application/json" -X POST -d "$data" http://127.0.0.1:8689/v1/transaction/status | grep -w 'committed')" ]
                        then
                                echo $(date +"%Y-%m-%dT%T")" $trx has been committed"
                                break
                        fi
                        (( retry++ ))
                        if (( retry > retryLimit ))
                        then
                                echo $(date +"%Y-%m-%dT%T")" Timeout for waiting for $trx to be committed"
                                exit 1
                        fi
                        sleep $sleepTime
                done

		unlockWallet
		# set $account to delegate
		echo $(date +"%Y-%m-%dT%T")" set $account to delegate"
		actionRes=$(bcli genesis setdelegate --sender "bottos" --account "$account" --signkey "$publickey")
		echo $(date +"%Y-%m-%dT%T")" $actionRes"
                trx=$(echo $actionRes | grep TrxHash | awk '{print $2}')
		## wait until trx committed
                retry=0
		retryLimit=120
		sleepTime=0.5
                while (( retry <= retryLimit ))
                do
                        echo $(date +"%Y-%m-%dT%T")" $retry:waiting for $trx to be committed"
                        data="{\"trx_hash\":\"$trx\"}"
                        if [ -n "$(curl -s -H "Content-Type:application/json" -X POST -d "$data" http://127.0.0.1:8689/v1/transaction/status | grep -w 'committed')" ]
                        then
                                echo $(date +"%Y-%m-%dT%T")" $trx has been committed"
                                break
                        fi
                        (( retry++ ))
                        if (( retry > retryLimit ))
                        then
                                echo $(date +"%Y-%m-%dT%T")" Timeout for waiting for $trx to be committed"
                                exit 1
                        fi
                        sleep $sleepTime
                done

		unlockWallet
		# set transit vote
		voteAmount=5
		echo $(date +"%Y-%m-%dT%T")" set $voteAmount transit vote for $account"
		actionRes=$(bcli genesis settransitvote --sender "bottos" --account "$account" --vote "$voteAmount")
		echo $(date +"%Y-%m-%dT%T")" $actionRes"
                trx=$(echo $actionRes | grep TrxHash | awk '{print $2}')
		## wait until trx committed
                retry=0
		retryLimit=120
		sleepTime=0.5
                while (( retry <= retryLimit ))
                do
                        echo $(date +"%Y-%m-%dT%T")" $retry:waiting for $trx to be committed"
                        data="{\"trx_hash\":\"$trx\"}"
                        if [ -n "$(curl -s -H "Content-Type:application/json" -X POST -d "$data" http://127.0.0.1:8689/v1/transaction/status | grep -w 'committed')" ]
                        then
                                echo $(date +"%Y-%m-%dT%T")" $trx has been committed"
                                break
                        fi
                        (( retry++ ))
                        if (( retry > retryLimit ))
                        then
                                echo $(date +"%Y-%m-%dT%T")" Timeout for waiting for $trx to be committed"
                                exit 1
                        fi
                        sleep $sleepTime
                done

		# mark according to result
                echo "account:$account,publickey:$publickey,loaded:true" > $shareddir"account_publickey_$account"
                cp "$shareddir"account_publickey_$account"" "$shareddir"loaded.account_publickey_$account""
		unlockWallet
	fi
done

processedFileCount=$(ls $shareddir | grep "^loaded.account_publickey_" | wc -l)
if [[ $processedFileCount -eq $delegateNum ]]
then
	echo $(date +"%Y-%m-%dT%T")" $processedFileCount files init done!"
else
	echo "get $processedFileCount processed file, expect $delegateNum, exit!"
	exit 1
fi


