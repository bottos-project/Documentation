#!/bin/bash


IMAGE="yaoya12345/bottos:v1.2"


function makePeerlist()
{
	delegateNum=$1
	currentDelegateIndex=$2
	peerlist=""
	if [ $currentDelegateIndex -eq 0 ]
	then
		for ((j=1;j<=delegateNum;j++))
		do
			peerlist+="delegatep$j:$p2pPort,"
		done
	else
		peerlist="genesis:$p2pPort,"
		for ((j=1;j<=delegateNum;j++))
		do
			# don't add itself into peerlist
			if [ $j -eq $currentDelegateIndex ]
			then
				continue
			fi
			peerlist+="delegatep$j:$p2pPort,"
		done
	fi
	# get rid of the tailing comma
	peerlist=$(echo $peerlist | sed 's/,$//')
}


# make genesis-delegatepX.yaml
function build()
{
	delegateNum=$1
	mongodb=$2
	current=$(cd "$(dirname "$0")";pwd)
	echo "current in $current"

	target=$current"/genesis-delegateX.yaml"
	apiVersion="v1"

	# expose ports
	restPort=8689
	p2pPort=9868
	walletPort=6869
	logPort=6870
	
	# mount path within container 
	sharedDirIn="/Bottos/sharedData"
	dataDirIn="/Bottos/datadir"
	configsDirIn="/Bottos/configs"
	logDirIn="/Bottos/log"
	mongodbDirIn="/Bottos/mongodb"
	keystoreDirIn="/root/bot"

	# mount path in node
	sharedDirOutSubPath="sharedData"
	dataDirOutSubPath="datadir"
	configsDirOutSubPath="configs"
	logDirOutSubPath="log"
	mongodbDirOutSubPath="mongodb"
	keystoreDirOutSubPath="keystoredir"

	# resources request and limit
	cpuRequest="90m"
	cpuLimit="90m"
	memoryRequest="320Mi"
	memoryLimit="320Mi"
	storageRequest="400Mi"
	storageLimit="400Mi"

	## build
	### part1, for genesis node
	makePeerlist $delegateNum 0
	touch $target
        echo "apiVersion: $apiVersion" > $target
	echo "kind: Service" >> $target
	echo "metadata:" >> $target
	echo "  name: genesis" >> $target
	echo "  labels:" >> $target
	echo "    app: bottos" >> $target
	echo "    role: genesis" >> $target
	echo "spec:" >> $target
	echo "  selector:" >> $target
	echo "    app: bottos" >> $target
	echo "    role: genesis" >> $target
	echo "  clusterIP: None" >> $target
	echo "  ports:" >> $target
	echo "  - name: rest" >> $target
	echo "    port: $restPort" >> $target
	echo "  - name: p2p" >> $target
	echo "    port: $p2pPort" >> $target
	echo "  - name: wallet" >> $target
	echo "    port: $walletPort" >> $target
	echo "  - name: log" >> $target
	echo "    port: $logPort" >> $target
	echo "---" >> $target
	echo "apiVersion: $apiVersion" >> $target
	echo "kind: Pod" >> $target
	echo "metadata:" >> $target
	echo "  name: genesis" >> $target
	echo "  labels:" >> $target
	echo "    app: bottos" >> $target
	echo "    role: genesis" >> $target
	echo "spec:" >> $target
	echo "  restartPolicy: OnFailure" >> $target
	echo "  containers:" >> $target
	echo "  - name: genesis" >> $target
	echo "    image: $IMAGE" >> $target
	echo "    imagePullPolicy: IfNotPresent" >> $target
	echo "    command: [\"/Bottos/scripts/entrypoint.sh\",\"--type=genesis\",\"--account=bottos\",\"--mongodb=$mongodb\",\"--delegateNum=$delegateNum\",\"--peerlist=$peerlist\"]" >> $target
	echo "    resources:" >> $target
	echo "      requests:" >> $target
	echo "        cpu: \"$cpuRequest\"" >> $target
	echo "        memory: \"$memoryRequest\"" >> $target
	echo "        ephemeral-storage: \"$storageRequest\"" >> $target
	echo "      limits:" >> $target
	echo "        cpu: \"$cpuLimit\"" >> $target
	echo "        memory: \"$memoryLimit\"" >> $target
	echo "        ephemeral-storage: \"$storageLimit\"" >> $target
	echo "    lifecycle:" >> $target
	echo "      preStop:" >> $target
	echo "        exec:" >> $target
	echo "          command: [\"/Bottos/scripts/stop.sh\",\"--type=all\"]" >> $target
	echo "    ports:" >> $target
	echo "    - name: rest" >> $target
	echo "      containerPort: $restPort" >> $target
	echo "    - name: p2p" >> $target
	echo "      containerPort: $p2pPort" >> $target
	echo "    - name: wallet" >> $target
	echo "      containerPort: $walletPort" >> $target
	echo "    - name: log" >> $target
	echo "      containerPort: $logPort" >> $target
	echo "    volumeMounts:" >> $target
	echo "    - name: my-data" >> $target
	echo "      mountPath: $sharedDirIn" >> $target
	echo "      subPath: $sharedDirOutSubPath" >> $target
	echo "    - name: my-data" >> $target
	echo "      mountPath: $dataDirIn" >> $target
	echo "      subPath: genesis/$dataDirOutSubPath" >> $target
	echo "    - name: my-data" >> $target
	echo "      mountPath: $configsDirIn" >> $target
	echo "      subPath: genesis/$configsDirOutSubPath" >> $target
	echo "    - name: my-data" >> $target
	echo "      mountPath: $logDirIn" >> $target
	echo "      subPath: genesis/$logDirOutSubPath" >> $target
	echo "    - name: my-data" >> $target
	echo "      mountPath: $mongodbDirIn" >> $target
	echo "      subPath: genesis/$mongodbDirOutSubPath" >> $target
	echo "    - name: my-data" >> $target
	echo "      mountPath: $keystoreDirIn" >> $target
	echo "      subPath: genesis/$keystoreDirOutSubPath" >> $target
	echo "  volumes:" >> $target
	echo "    - name: my-data" >> $target
	echo "      persistentVolumeClaim:" >> $target
	echo "        claimName: nfs-pvc" >> $target

	### part2, for other delegate nodes
	for (( i=1;i<=delegateNum;i++ ))
	do
		makePeerlist $delegateNum $i
		echo "---" >> $target
		echo "kind: Service" >> $target
		echo "apiVersion: $apiVersion" >> $target
		echo "metadata:" >> $target
		echo "  name: delegatep$i" >> $target
		echo "  labels:" >> $target
		echo "    app: bottos" >> $target
		echo "    role: delegatep$i" >> $target
		echo "spec:" >> $target
		echo "  selector:" >> $target
		echo "    app: bottos" >> $target
		echo "    role: delegatep$i" >> $target
		echo "  clusterIP: None" >> $target
		echo "  ports:" >> $target
		echo "  - name: rest" >> $target
		echo "    port: $restPort" >> $target
		echo "  - name: p2p" >> $target
		echo "    port: $p2pPort" >> $target
		echo "  - name: wallet" >> $target
		echo "    port: $walletPort" >> $target
		echo "  - name: log" >> $target
		echo "    port: $logPort" >> $target
		echo "---" >> $target
		echo "apiVersion: $apiVersion" >> $target
		echo "kind: Pod" >> $target
		echo "metadata:" >> $target
		echo "  name: delegatep$i" >> $target
		echo "  labels:" >> $target
		echo "    app: bottos" >> $target
		echo "    role: delegatep$i" >> $target
		echo "spec:" >> $target
		echo "  restartPolicy: OnFailure" >> $target
		echo "  containers:" >> $target
		echo "  - name: genesis" >> $target
		echo "    image: $IMAGE" >> $target
		echo "    imagePullPolicy: IfNotPresent" >> $target
		echo "    command: [\"/Bottos/scripts/entrypoint.sh\",\"--type=delegate\",\"--account=delegatep$i\",\"--mongodb=$mongodb\",\"--delegateNum=$delegateNum\",\"--peerlist=$peerlist\"]" >> $target
		echo "    resources:" >> $target
		echo "      requests:" >> $target
		echo "        cpu: \"$cpuRequest\"" >> $target
		echo "        memory: \"$memoryRequest\"" >> $target
		echo "        ephemeral-storage: \"$storageRequest\"" >> $target
		echo "      limits:" >> $target
		echo "        cpu: \"$cpuLimit\"" >> $target
		echo "        memory: \"$memoryLimit\"" >> $target
		echo "        ephemeral-storage: \"$storageLimit\"" >> $target
		echo "    lifecycle:" >> $target
		echo "      preStop:" >> $target
		echo "        exec:" >> $target
		echo "          command: [\"/Bottos/scripts/stop.sh\",\"--type=all\"]" >> $target
		echo "    ports:" >> $target
		echo "    - name: rest" >> $target
		echo "      containerPort: $restPort" >> $target
		echo "    - name: p2p" >> $target
		echo "      containerPort: $p2pPort" >> $target
		echo "    - name: wallet" >> $target
		echo "      containerPort: $walletPort" >> $target
		echo "    - name: log" >> $target
		echo "      containerPort: $logPort" >> $target
		echo "    volumeMounts:" >> $target
		echo "    - name: my-data" >> $target
		echo "      mountPath: $sharedDirIn" >> $target
		echo "      subPath: $sharedDirOutSubPath" >> $target
		echo "    - name: my-data" >> $target
		echo "      mountPath: $dataDirIn" >> $target
		echo "      subPath: delegatep$i/$dataDirOutSubPath" >> $target
		echo "    - name: my-data" >> $target
		echo "      mountPath: $configsDirIn" >> $target
		echo "      subPath: delegatep$i/$configsDirOutSubPath" >> $target
		echo "    - name: my-data" >> $target
		echo "      mountPath: $logDirIn" >> $target
		echo "      subPath: delegatep$i/$logDirOutSubPath" >> $target
		echo "    - name: my-data" >> $target
		echo "      mountPath: $mongodbDirIn" >> $target
		echo "      subPath: delegatep$i/$mongodbDirOutSubPath" >> $target
		echo "    - name: my-data" >> $target
		echo "      mountPath: $keystoreDirIn" >> $target
		echo "      subPath: delegatep$i/$keystoreDirOutSubPath" >> $target
		echo "  volumes:" >> $target
		echo "    - name: my-data" >> $target
		echo "      persistentVolumeClaim:" >> $target
		echo "        claimName: nfs-pvc" >> $target
	done
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
	echo -e "Usage: \n\tmakeK8sYaml.sh"
	echo -e "\t\t--delegateNum=\$num - the number of delegate node"
	echo -e "\t\t--mongodb=true|false - true means enable mongodb, false means disable mongodb"
}


#------------------------------ MAIN ------------------------------#
# parse input parameter
ARGS=`getopt -o h -l delegateNum:,mongodb:,help, -n 'makeK8sYaml.sh' -- "$@"`

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
		--) shift; break;;
		-h|--help) help; exit 1;;
		*) echo "unknown parameter:$1"; break;;
	esac
done


# check input parameters
isNumber "$delegateNum"
isBool "$mongodb"
# build genesis-delegatepX.yaml
build "$delegateNum" "$mongodb"


