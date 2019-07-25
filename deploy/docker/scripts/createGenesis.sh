#!/bin/bash


# parse input parameter
ARGS=`getopt -o o -l genesisTime:,genesisKey: -n 'createGenesis.sh' -- "$@"`

if [[ $? != 0 || $@ = '' ]]; then
	echo "error occured in createGenesis.sh..."
	exit 1
fi

eval set -- "$ARGS"

while [ -n $1 ]
do
	case "$1" in
		--genesisTime) genesisTime=$2; shift 2;;
		--genesisKey) genesisPubkey=$2; shift 2;;
		--) shift; break;;
		*) echo "unknown option: $1"; break;;
	esac
done

cat << EOF > $CONFIGDIR"genesis.toml"
# Initial configuration for the Genesis Node

GenesisTime = "$genesisTime"
GenesisKey = "$genesisPubkey"

EOF

