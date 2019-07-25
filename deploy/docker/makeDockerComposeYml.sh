#!/bin/bash


#image="yaoya12345/bottos:v1.0"


function makePeerlist()
{
	delegateNum=$1
	currentDelegateIndex=$2
	peerlist=""
	if [ $currentDelegateIndex -eq 0 ]
	then
		for ((j=1;j<=delegateNum;j++))
		do
			peerlist+="$baseDelegateName$j:$p2pportIn,"			
		done
	else
		peerlist="genesis:$p2pportIn,"
		for ((j=1;j<=delegateNum;j++))
		do
			# don't add itself into peerlist
			if [ $j -eq $currentDelegateIndex ]
			then
				continue
			fi
			peerlist+="$baseDelegateName$j:$p2pportIn,"
		done
	fi
	# get rid of the tailing comma
	peerlist=$(echo $peerlist | sed 's/,$//')
}

# make docker-compose.yml
function build()
{
	delegateNum=$1
	mongodb=$2
	image=$3
	## set global vars
	current=$(cd "$(dirname "$0")";pwd)
	echo "current in $current"
	target=$current"/docker-compose.yml"
	privateNetwork="bottos_private"
	baseDelegateName="delegatep"
	stopSignal="SIGINT"

	volumeIn1="/Bottos/sharedData"
	volumeOutBase=$current"/Bottos_data"
	volumeOut1=$volumeOutBase"/shared_data"
	volumeIn2="/Bottos/datadir"
	volumeIn3="/Bottos/configs"
	volumeIn4="/Bottos/log"
	volumeIn5="/Bottos/mongodb"
	volumeIn6="/root/bot"

	restportIn=8689
	restportOut=18689
	p2pportIn=9868
	p2pportOut=19868
	walletrestportIn=6869
	walletrestportOut=16869
	logrestportIn=6870
	logrestportOut=16870

	## build
	### part1
	makePeerlist $delegateNum 0
	touch $target
	echo "version: '3'" > $target
	echo "services:" >> $target
	echo -e "  genesis:" >> $target
	echo -e "    image: $image" >> $target
	echo -e "    container_name: genesis" >> $target
	echo -e "    restart: \"on-failure\"" >> $target
	echo -e "    stop_signal: $stopSignal" >> $target
	echo -e "    ports:" >> $target
	echo -e "      - $((restportOut)):$restportIn" >> $target
	echo -e "      - $((p2pportOut)):$p2pportIn" >> $target
	echo -e "      - $((walletrestportOut)):$walletrestportIn" >> $target
	echo -e "      - $((logrestportOut)):$logrestportIn" >> $target
	echo -e "    networks:" >> $target
	echo -e "      - $privateNetwork" >> $target
	echo -e "    volumes:" >> $target
	echo -e "      - \"$volumeOut1:$volumeIn1\"" >> $target
	echo -e "      - \"$volumeOutBase/genesis/datadir:$volumeIn2\"" >> $target
	echo -e "      - \"$volumeOutBase/genesis/configs:$volumeIn3\"" >> $target
	echo -e "      - \"$volumeOutBase/genesis/log:$volumeIn4\"" >> $target
	echo -e "      - \"$volumeOutBase/genesis/mongodb:$volumeIn5\"" >> $target
	echo -e "      - \"$volumeOutBase/genesis/keystores:$volumeIn6\"" >> $target
	echo -e "    command: /Bottos/scripts/entrypoint.sh --type=genesis --account=bottos --mongodb=$mongodb --delegateNum=$delegateNum --peerlist=$peerlist" >> $target

	### part2
	for ((i=1;i<=delegateNum;i++))
	do
		makePeerlist $delegateNum $i
		echo -e "  $baseDelegateName$i:" >> $target
		echo -e "    image: $image" >> $target
		echo -e "    container_name: $baseDelegateName$i" >> $target
		echo -e "    restart: \"on-failure\"" >> $target
		echo -e "    stop_signal: $stopSignal" >> $target
		echo -e "    ports:" >> $target
		echo -e "      - $((restportOut+10*i)):$restportIn" >> $target
		echo -e "      - $((p2pportOut+10*i)):$p2pportIn" >> $target
		echo -e "      - $((walletrestportOut+10*i)):$walletrestportIn" >> $target
		echo -e "      - $((logrestportOut+10*i)):$logrestportIn" >> $target
		echo -e "    networks:" >> $target
		echo -e "      - $privateNetwork" >> $target
		echo -e "    volumes:" >> $target
		echo -e "      - \"$volumeOut1:$volumeIn1\"" >> $target
		echo -e "      - \"$volumeOutBase/$baseDelegateName$i/datadir:$volumeIn2\"" >> $target
		echo -e "      - \"$volumeOutBase/$baseDelegateName$i/configs:$volumeIn3\"" >> $target
		echo -e "      - \"$volumeOutBase/$baseDelegateName$i/log:$volumeIn4\"" >> $target
		echo -e "      - \"$volumeOutBase/$baseDelegateName$i/mongodb:$volumeIn5\"" >> $target
		echo -e "      - \"$volumeOutBase/$baseDelegateName$i/keystores:$volumeIn6\"" >> $target
		echo -e "    command: /Bottos/scripts/entrypoint.sh --type=delegate --account=$baseDelegateName$i --mongodb=$mongodb --delegateNum=$delegateNum --peerlist=$peerlist" >> $target
	done

	# part3
	echo "networks:" >> $target
	echo -e "  $privateNetwork:" >>$target
	echo "build done!"
}


# check if the input arg is a number
function isNumber()
{
	input=$1
	if [ -z "$input" ]
	then
		help
		exit 1
	elif $(echo $input | grep -q '[^0-9]')
	then
		echo "incorrect input:$input, please give a number!"
		exit 1
	fi
}


function isBool()
{
	input=$1
	if [ -z "$input" ]
	then
		help
		exit 1
	elif ! $(echo $input | grep -qEw 'true|false')
	then
		echo "incorrect input:$input, please give a bool!"
		exit 1
	fi
}

function help()
{
        echo -e "Usage: \n\tmakeDockerComposeYml.sh"
       	echo -e "\t\t--delegateNum=\$DELEGATE_NODE_NUM - the number of delegate node"
        echo -e "\t\t--mongodb=true|false - true means enable mongodb, false means disable mongodb"
	echo -e "\t\t--image=\$IMAGE_NAME - name of the image to be used"
}


#------------------------------ MAIN ------------------------------#
# parse input parameter
ARGS=`getopt -o h -l delegateNum:,mongodb:,image:,help, -n 'createDockerComposeYml.sh' -- "$@"`

if [[ $? != 0 || $@ = '' ]]
then
	help
	exit 1
fi

eval set -- "$ARGS"

while [ -n $1 ]
do
	case "$1" in
		--delegateNum) delegateNum=$2; shift 2;;
		--mongodb) mongodb=$2; shift 2;;
		--image) image=$2; shift 2;;
		--) shift; break;;
		-h|--help) help; exit 1;;
		*) echo "unknown parameter:$1"; break;;
	esac
done


# check input parameters
isNumber "$delegateNum"
isBool "$mongodb"
# build docker-compose.yml
build "$delegateNum" "$mongodb" "$image"

