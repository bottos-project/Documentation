#/bin/bash


# vars
LOCALHOST="127.0.0.1"
RESTPORT="8689"
P2PPORT="9868"
LOGRESTPORT=6870
WALLETPORT="6869"
WALLETPASSWD="Bottos2019"
MONGOURL="mongodb://127.0.0.1:27017/bottos"
MONGOPORT=27017

# dirs
HOMEDIR="/Bottos"
BINDIR=$HOMEDIR"/bin/"
CONFIGDIR=$HOMEDIR"/configs/"
SHAREDDIR=$HOMEDIR"/sharedData/"
TEMPDIR=$HOMEDIR"/temp/"
SCRIPTSDIR=$HOMEDIR"/scripts/"
DATADIR=$HOMEDIR"/datadir/"
WALLETDIR=$HOMEDIR"/walletdir/"
LOGDIR=$HOMEDIR"/log/"
MONGODIR="$HOMEDIR/mongodb/"
KEYSTOREDIR="/root/bot/"


# create dirs
mkdir -p $BINDIR \
	$CONFIGDIR \
	$SHAREDDIR \
	$TEMPDIR \
	$SCRIPTSDIR \
	$DATADIR \
	$LOGDIR \
	$MONGODIR \
	$WALLETDIR

# update PATH
if [ -z "$(echo $PATH | grep $BINDIR)" ]
then
	export PATH=$PATH:$BINDIR
fi

if [ -z "$(echo $PATH | grep $CONFIGDIR)" ]
then
	export PATH=$PATH:$CONFIGDIR
fi

if [ -z "$(echo $PATH | grep $SHAREDDIR)" ]
then
	export PATH=$PATH:$SHAREDDIR
fi

if [ -z "$(echo $PATH | grep $TEMPDIR)" ]
then
	export PATH=$PATH:$TEMPDIR
fi

if [ -z "$(echo $PATH | grep $SCRIPTSDIR)" ]
then
	export PATH=$PATH:$SCRIPTSDIR
fi

if [ -z "$(echo $PATH | grep $WALLETDIR)" ]
then
	export PATH=$PATH:$WALLETDIR
fi


# update global vars
export LOCALHOST=$LOCALHOST
export RESTPORT=$RESTPORT
export P2PPORT=$P2PPORT
export LOGRESTPORT=$LOGRESTPORT
export WALLETPORT=$WALLETPORT
export WALLETPASSWD=$WALLETPASSWD
export MONGOURL=$MONGOURL
export BINDIR=$BINDIR
export CONFIGDIR=$CONFIGDIR
export SHAREDDIR=$SHAREDDIR
export TEMPDIR=$TEMPDIR
export SCRIPTSDIR=$SCRIPTSDIR
export DATADIR=$DATADIR
export WALLETDIR=$WALLETDIR
export LOGDIR=$LOGDIR
export KEYSTOREDIR=$KEYSTOREDIR
export MONGODIR=$MONGODIR


