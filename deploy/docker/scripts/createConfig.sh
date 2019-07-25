#!/bin/bash


# parse input parameter
ARGS=`getopt -o o -l peerlist:,solo:,publickey:,mongourl:,walletdir:,datadir:,p2pservaddr:,wallethost:,walletport: -n 'createConfig.sh' -- "$@"`

if [[ $? != 0 || $@ = '' ]]; then
	echo "error occured in createConfig.sh..."
	exit 1
fi

eval set -- "$ARGS"

while [ -n $1 ]
do
	case "$1" in
		--peerlist) peerlist=$2; shift 2;;
		--solo) solo=$2; shift 2;;
		--publickey) publickey=$2; shift 2;;
		--mongourl) mongourl=$2; shift 2;;
		--walletdir) walletdir=$2; shift 2;;
		--datadir) datadir=$2; shift 2;;
		--p2pservaddr) p2pservaddr=$2; shift 2;;
		--wallethost) wallethost=$2; shift 2;;
		--walletport) walletport=$2; shift 2;;
		--) shift; break;;
		*) echo "unknown option: $1"; break;;
	esac
done


cat << EOF > $CONFIGDIR"config.toml"
# Configuration for Bottos Node

[Node]
DataDir = "$DATADIR"

[Rest]
RESTPort = 8689
RESTHost = "0.0.0.0"

[P2P]
P2PPort = 9868
P2PServAddr = "$p2pservaddr"
PeerList = $peerlist
P2PAuthRequried = false
P2PAuthKeyList = []
MaxPeer = 60

[Delegate]
Solo = $solo

[Delegate.Signature]
Type = "wallet"
PublicKey = "$publickey"
URL = "http://$wallethost:$walletport/v1/wallet/signhash"

[Plugin]
[Plugin.MongoDB]
URL = "$mongourl"

[Plugin.Wallet]
WalletDir = "$walletdir"
WalletRESTPort = $walletport
WalletRESTHost = "$wallethost"

[Plugin.Log]
LogRESTPort = 6870
LogRESTHost = "localhost"

EOF

