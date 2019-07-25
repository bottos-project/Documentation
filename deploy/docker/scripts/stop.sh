#!/bin/bash


function stop()
{
	process=$1
	if [ $process = "all" ]
	then
		toKills=("bottos" "wallet" "initDelegate" "mongod")
		for toKill in ${toKills[@]}
		do
			myKill "$toKill" "2"
		done
	else
		myKill "$process" "2"
	fi
}


function myKill()
{
	toKill=$1
	signal=$2
	pid=$(ps -ef | grep $toKill | sed '/grep/d' | awk -F ' ' '{print $2}')
	if [ -n "$pid" ]
	then
		echo $(date +"%Y-%m-%dT%T")" kill:$toKill, pid:$pid"
		kill -$signal $pid
	fi
}


function help()
{
	echo "Usage: stop.sh --type=wallet|node|mongod|initDelegate|all"
}



#------------------------------ MAIN ------------------------------#

# parse input parameter
ARGS=`getopt -o h -l type: -n 'stop.sh' -- "$@"`

if [[ $? != 0 || $@ = ''  ]]; then
	help
	exit 1
fi

eval set -- "$ARGS"


while [ -n $1 ]
do
	case "$1" in
		--type)
			case "$2" in
				wallet) stop wallet;;
				node) stop bottos;;
				mongod) stop mongod;;
				initDelegate) stop initDelegate;;
				all) stop all;;
				*) help; break;;
			esac;
			shift 2 ;;
		--) shift; break;;
		-h) help; exit 1;;
		*) echo "unknown parameter:$1"; break;;
	esac
done


