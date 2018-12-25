# How does a New Node add into Bottos Network

This article shows users how to configure and start a node to join the primary network. There are two kinds of nodes to join the main network: producer node and synchronous node. The following sections show users how to join the main network as a producer or synchronous node.

## Install Node Environment

### Operating System

UBUNTU16.04 LTS (or higher) is recommended

### Node Environment Installation

Enter the following command to install the tool and bottos to specify the release package:

```
apt-get update && apt-get install -y wget vim
wget https://github.com/bottos-project/bottos/releases/download/tag_bottos3.4/bottos_ubuntu_v3.4.tar.gz
```

Note：
Please focus on "https://github.com/bottos-project/bottos/releases", timely access to the latest version of the package.

Unzip the downloaded version package:

(after unzipping, the folder bottos_v3.4 will be generated in the current directory)

```    
tar zvxf bottos_ubuntu_v3.4.tar.gz
```

Version package file description
   
    bottos         Node master program
    bcli           Node supporting tools, details can be found in the bcli user description document on the                official website
    config.toml   The node configuration file is described in detail in the next section
    genesis.toml  This file is used to uniquely identify an identified chain
    Other 2 toml files  The files are prepared for the node to connect to the test network, which the user does not need to care about.

### Prepare for Configuration 1: config.toml

To join the BOTTOS host, the node needs to be configured to provide some parameter information to connect to the host. The following shows how to configure the parameters.

cd to the bottos release package directory:

1  Produces a pair of public and private keys
 
```
./bcli wallet generatekey
public_key: 046607760d95319d4dbe26751c15f75d9154dd564aaff8a5346207cda90fc1b7f6f62f0f7382e964b18a1f3f3b7c6b7b212c63959d1e0ab2b51a4f122b0089e9e4
private_key: 1b936c16e85cb2a7db8f6c15609ab1466f3e6ccdde0577bf0448b0fa387db460
```

After this command is executed, the public_key and private_key values obtained will be used to fill in the configuration parameters in the next step.

2 Open the config.toml file and modify the red part

[Node]

DataDir = "./datadir"

[Rest]

RESTPort = 8689

RESTHost = "localhost"

[P2P]

P2PPort = 9868

P2PServAddr =  <font color=#DC143C face="黑体">"192.168.0.11"</font> - >Modify the IP to the user IP (you can query it with ifconfig command)

PeerList = <font color=#DC143C face="黑体">["Producer IP1：Port1"， Producer IP2：Port2, "Producer IP3：Port3"]</font> - > Modify this information according to the IP and port number of the main network published on the official website. If the user has more producer nodes, the corresponding supplementary IP and port number should be included in this item.

P2PAuthRequried = false

P2PAuthKeyList = []

MaxPeer = 60

[Delegate]

Solo = <font color=#DC143C face="黑体">false</font> - > Modify to false

[Delegate.Signature]

Type = "key"

PrivateKey = <font color=#DC143C face="黑体">"XXX"</font> -> Fill in the private_key value generated in step 1 here (quotes are also required)


PublicKey = <font color=#DC143C face="黑体">"YYY"</font> -> Fill in the public_key value generated in step 1 here (quotes are also required)


URL = <font color=#DC143C face="黑体">""</font> ->Get rid of the content inside the quotes

[Plugin]

[Plugin.MongoDB]

URL = "mongodb://bottos:bottos@127.0.0.1:27017/bottos"

[Plugin.Wallet]

WalletDir = ""

WalletRESTPort = 6869

WalletRESTHost = "localhost"

[Plugin.Log]

LogRESTPort = 6870

LogRESTHost = "localhost"

Note：

If you need to configure multiple nodes in a host environment (non-docker environment), it is not recommended to configure multiple BOTTOS processes in a VM environment. Otherwise, config. Toml port parameters need to be modified.

### Prepare for Configuration 2：genesis.toml

Following on genesis.Toml content published on the main network of the official website, copy and cover all contents of genesis.toml file(in order to to ensure the identity of this node chain is consistent with that of BOTTOS main network chain)

### Start the Node

If a producer node is started, replace the producer account name (which must be applied in the community) with the following scarlet letter.

./bottos --delegate <font color=#DC143C face="黑体">delegate_name</font> --enable-wallet &

If you are not starting a producer node (that is, only synchronous node startup), start as follows.

./bottos --enable-wallet &


After the node is started, it will be found that the program starts synchronizing blocks later, indicating that the node is started successfully. Synchronization block printing is provided below for reference.

```
InsertBlock, number:1552, time:2018-12-18 10:06:18, delegate:delegatep5, trxn:0, hash:7664063509a4a813f2fa06a929f11a36ba66184e036dfe7c49937a28d5328050, prevHash:98f4567dbcd6dfd8c0bc7ce4f24ee96f2d3476691088e08475ae56bb62d6afd3, version:3.4.0
InsertBlock, number:1553, time:2018-12-18 10:06:21, delegate:delegatep9, trxn:0, hash:cbef8f392a17cfdf58587b263f22cb844e7dd534336fb2f3b99ca5d9276466d6, prevHash:7664063509a4a813f2fa06a929f11a36ba66184e036dfe7c49937a28d5328050, version:3.4.0
InsertBlock, number:1554, time:2018-12-18 10:06:27, delegate:delegatep15, trxn:0, hash:ea88602bf0ad960172357403a6626df0a4b19443b5fd665561ce82dcb4e95792, prevHash:cbef8f392a17cfdf58587b263f22cb844e7dd534336fb2f3b99ca5d9276466d6, version:3.4.0
InsertBlock, number:1555, time:2018-12-18 10:06:30, delegate:delegatep19, trxn:0, hash:97f630674cbc165b168196421b3817710047c886f64dc208f0f8fc380361425a, prevHash:ea88602bf0ad960172357403a6626df0a4b19443b5fd665561ce82dcb4e95792, version:3.4.0
InsertBlock, number:1556, time:2018-12-18 10:06:33, delegate:delegatep4, trxn:0, hash:ddf178d67791dc599495e3b4671b20054b725c3b707b81d32e57f4d0967196d9, prevHash:97f630674cbc165b168196421b3817710047c886f64dc208f0f8fc380361425a, version:3.4.0
InsertBlock, number:1557, time:2018-12-18 10:06:39, delegate:delegatep2, trxn:0, hash:ff6b472b91d578239b17f62c2332ce150b30e9a7a3a3056dac142774a412fa49
```

You can also use./bcli getblkheader to see the latest block information, as long as the block number (head_block_num) grows, it means that node startup and block synchronization are already well under way.

```
root@JD-linglong3:~/code/bottos/bcli# ./bcli getblkheader

==Chain Info==

{
    "head_block_version": 197632,
    "head_block_num": 21177,
    "head_block_hash": "e4efa47a284183e1bc7278dc92f32f6d41d1c4edf7331010422d4a76920b1b57",
    "head_block_time": 1545191697,
    "head_block_delegate": "bottos",
    "cursor_label": 2450201431,
    "last_consensus_block_num": 21177,
    "chain_id": "4b97b92d2c78bcffe95ebd3067565c73a2931b39d5eb7234b11816dcec54761a"
}
root@JD-linglong3:~/code/bottos/bcli# ./bcli getblkheader

==Chain Info==

{
    "head_block_version": 197632,
    "head_block_num": 21180,
    "head_block_hash": "06030bc418d1f18afcc989418f15db2221145e1b0b435ef61e6c4917f2de9202",
    "head_block_time": 1545191706,
    "head_block_delegate": "bottos",
    "cursor_label": 4074672642,
    "last_consensus_block_num": 21180,
    "chain_id": "4b97b92d2c78bcffe95ebd3067565c73a2931b39d5eb7234b11816dcec54761a"
}
root@JD-linglong3:~/code/bottos/bcli# 
```

### Stop Nodes

Kill the node with kill operation.

```
root@JD-linglong3:~/code/bottos/bcli# ps -ef|grep bottos
root      8091  9773  0 12:00 pts/22   00:00:00 grep --color=auto bottos
root     24652 18486  0 Dec18 pts/26   00:08:33 ./bottos --delegate=bottos --enable-wallet
root@JD-linglong3:~/code/bottos/bcli# 
root@JD-linglong3:~/code/bottos/bcli# 
root@JD-linglong3:~/code/bottos/bcli# kill -9 24652
root@JD-linglong3:~/code/bottos/bcli# ps -ef|grep bottos
root      8093  9773  0 12:00 pts/22   00:00:00 grep --color=auto bottos
root@JD-linglong3:~/code/bottos/bcli# 
```

### Check LOG information

For process problems, check the datadir/log/bottos.log generated in the version package directory to see if any new ERR log information is generated.