# Multi-Nodes developping environment

This article introduces users to such multi-node development environments. Multi-node development environments are introduced in three ways: one is how to set up a single node to join the BOTTOS main network, another is to build a test producer network by oneself, and the third is how to join the existing producer network as a synchronous node. The concepts will be introduced below separately.

# Approach 1: use a single node to join BOTTOS host network

For the mode of single-node startup to join BOTTOS host network, please refer to this document:
[How_does_a_new_node_connect_to_Bottos_Network.MD](./How_does_a_new_node_connect_to_Bottos_Network.MD)

# Approach 2: set up your own private producer network

To build your own producer network, you need to configure one creation node and several producer nodes, or you can configure some synchronization nodes, each node needs to provide some parameter information of the network to which it is connected. The following shows how to configure each node parameter.

Only one instance of BOTTOS process can be runned within each virtual machine used for build a producer network in this example (it is recommended that users configure the network by obeying this example).

## Prepare the Environment

Prepare one VM as the creation node, and another 19 to 29 VMS as the producer nodes (a minimum of 19 for the producer node, a maximum of 29 for the producer node), and install the GOLANG environment and the base version package respectively.

### Configure and Deploy your Genesis Node

#### Prepare for Configuration 1: config.toml

cd to your bottos release package directory:

1  make a new pair of public-private key

```
./bcli wallet generatekey
public_key: 046607760d95319d4dbe26751c15f75d9154dd564aaff8a5346207cda90fc1b7f6f62f0f7382e964b18a1f3f3b7c6b7b212c63959d1e0ab2b51a4f122b0089e9e4
private_key: 1b936c16e85cb2a7db8f6c15609ab1466f3e6ccdde0577bf0448b0fa387db460
```
After this command is executed, the public_key and private_key values obtained will be used to fill in the configuration parameters in the next step.

2 Open your config.toml and modify the red parts:

[Node]

DataDir = "./datadir"

[Rest]

RESTPort = 8689

RESTHost = "localhost"

[P2P]

P2PPort = 9868

P2PServAddr =  <font color=#DC143C face="黑体">"192.168.0.11"</font> - >Modify the IP to the user IP (you can query it with ifconfig command)
PeerList = <font color=#DC143C face="黑体">["Producer IP1:Port1"， Producer IP2:Port2, "Producer IP3:Port3"]</font> - > Fill in with <font  color=#DC143C face="黑体">All other producers except this node</font>'s IP and port, if you have more producer nodes, the ip and port should also be filled in here.

P2PAuthRequried = false

P2PAuthKeyList = []

MaxPeer = 60

[Delegate]

Solo = true

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
If you need to configure multiple nodes in a host environment (non-docker environment), it is not recommended to configure multiple BOTTOS processes in a VM environment. Otherwise, the config.toml port parameters need to be modified in each, also the BCLI command also needs to add address parameters, which can be cumbersome for users.

#### Prepare for Configuration 2：genesis.toml

It is only necessary to ensure that the contents of this file in all sections of the user's private network are completely consistent, and no modification is required (if any modification is needed, please also make modifications according to the corresponding format of this file content to ensure that all nodes are uniform and consistent).

#### Start Genesis Node

./bottos --delegate <font color=#DC143C face="黑体">bottos</font> --enable-wallet &

After the node is started, it will be found that the program starts synchronizing blocks later, indicating that the node is started successfully. Synchronization block printing is provided below for reference.

InsertBlock, number:1552, time:2018-12-18 10:06:18, delegate:<font color=#DC143C face="黑体">bottos</font>, trxn:0, hash:7664063509a4a813f2fa06a929f11a36ba66184e036dfe7c49937a28d5328050, prevHash:98f4567dbcd6dfd8c0bc7ce4f24ee96f2d3476691088e08475ae56bb62d6afd3, version:3.4.0
InsertBlock, number:1553, time:2018-12-18 10:06:21, delegate:<font color=#DC143C face="黑体">bottos</font>, trxn:0, hash:cbef8f392a17cfdf58587b263f22cb844e7dd534336fb2f3b99ca5d9276466d6, prevHash:7664063509a4a813f2fa06a929f11a36ba66184e036dfe7c49937a28d5328050, version:3.4.0
InsertBlock, number:1554, time:2018-12-18 10:06:27, delegate:<font color=#DC143C face="黑体">bottos</font>, trxn:0, hash:ea88602bf0ad960172357403a6626df0a4b19443b5fd665561ce82dcb4e95792, prevHash:cbef8f392a17cfdf58587b263f22cb844e7dd534336fb2f3b99ca5d9276466d6, version:3.4.0
InsertBlock, number:1555, time:2018-12-18 10:06:30, delegate:<font color=#DC143C face="黑体">bottos</font>, trxn:0, hash:97f630674cbc165b168196421b3817710047c886f64dc208f0f8fc380361425a, prevHash:ea88602bf0ad960172357403a6626df0a4b19443b5fd665561ce82dcb4e95792, version:3.4.0
InsertBlock, number:1556, time:2018-12-18 10:06:33, delegate:<font color=#DC143C face="黑体">bottos</font>, trxn:0, hash:ddf178d67791dc599495e3b4671b20054b725c3b707b81d32e57f4d0967196d9, prevHash:97f630674cbc165b168196421b3817710047c886f64dc208f0f8fc380361425a, version:3.4.0
InsertBlock, number:1557, time:2018-12-18 10:06:39, delegate:<font color=#DC143C face="黑体">bottos</font>, trxn:0, hash:ff6b472b91d578239b17f62c2332ce150b30e9a7a3a3056dac142774a412fa49

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
#### Create a wallet for the genesis node's account

After the creation node is started, you need to create a bottos account wallet for it first, otherwise the BCLI command of the non-query class will not have permission to execute.

Execute the following command at the creation node:

./bcli wallet create --account bottos

At this point, the command line will ask the user to enter the wallet password twice (Please input your password for your wallet:) at first. Please follow the prompts to define and enter your password, and remember the password.

Password rules: the length must be between 6 and 20, and must contain both upper and lower case Numbers.

The command line then asks the user to enter the private key corresponding to bottos account. Please go to config. Toml of this node to query the private key value corresponding to private_key and fill in the private key.

The newly created wallet will have 300 seconds to do some actions for the user (such as creating a producer, transferring money, executing a contract, etc.), and once the 300 seconds are up, the wallet will be locked automatically.

After the wallet is locked, the user will be informed that bottos wallet is locked after doing relevant operations. Please unlock the corresponding wallet.

Users can use the following command to unlock the wallet.

./bcli wallet unlock --account bottos

The user is asked to enter the password used to create the wallet before unlocking it.

The effective time of this command is still 300 seconds, and if you need to unlock for longer, you can take the optional parameter --timeout < keep the number of unlocked seconds, 0 is the permanent unlock >

For cases that are within the unlock prescription (or are permanently unlocked), the currently unlocked wallet will automatically be locked again (even if it is permanently unlocked) once the knowledge lock is performed for other non-bottos wallets or the creation of a new account wallet. That is to say, currently only one account can be unlocked under the wallet mechanism at the same time.

#### Create pair of public-private key on each production node

For security reasons, users are asked to create their own private and public key pairs on each different VM (this command does not need to start the BOTTOS process on the production node to execute) and to modify the corresponding public and private key pairs information in the respective node config.toml file.

 ./bcli wallet  generatekey 

（If security considerations are not taken into account, this command can also be executed at the creation node to batch make public and private keys for all production nodes, but is not recommended）

#### Create the initial producer at the creation node

The number of producers needed to be created depends on the number of producer nodes of the user. If 19 producer configurations are planned, 19 producer accounts need to be created on the creation node first.

This example defines 19 producer nodes and names them "delegatep1, ""delegatep2," "delegatep3, "... "Delegatep19 ", then execute the following command to create a batch of accounts at the creation node:

```
./bcli account create --account delegatep1 --pubkey <the public key value 1 corresponds to node1> --referrer bottos
./bcli account create --account delegatep2 --pubkey <the public key value 2 corresponds to node2> --referrer bottos
./bcli account create --account delegatep3 --pubkey <the public key value 3 corresponds to node3> --referrer bottos

                        ....
                        ....

./bcli account create --account delegatep19 --pubkey <the public key value 19 corresponds to node19> --referrer bottos
```

After the creation is completed, BTO needs to be transferred to each account to ensure that each account has the right to operate resources. Execute the following batch of commands on the founding node:

```
./bcli transfer --from bottos --to delegatep1 --amount 10
./bcli transfer --from bottos --to delegatep2 --amount 10
./bcli transfer --from bottos --to delegatep3 --amount 10
                        ...
                        ...
./bcli transfer --from bottos --to delegatep19 --amount 10
```

Once they are created, you need to set them to the producer role and execute the following command on the originating node:

```

./bcli genesis setdelegate --sender=bottos --account delegatep1 --signkey <the public key value 1 corresponds to node1>

./bcli genesis setdelegate --sender=bottos --account delegatep2 --signkey <the public key value 2 corresponds to node2>

./bcli genesis setdelegate --sender=bottos --account delegatep3 --signkey <the public key value 3 corresponds to node3>

                        ...
                        ...

./bcli genesis setdelegate --sender=bottos --account delegate19 --signkey <the public key value 19 corresponds to node19>
```
#### Configure the config.toml on each Node

Configure the config.toml on each producer node one by one (non-genesis node) :

[Node]

DataDir = "./datadir"

[Rest]

RESTPort = 8689

RESTHost = "localhost"

[P2P]

P2PPort = 9868

P2PServAddr =  <font color=#DC143C face="黑体">"192.168.0.12"</font> - >Modify the IP to the user IP (you can query it with ifconfig command)

PeerList = <font color=#DC143C face="黑体">["Genesis IP1: Port1","Producer IP1:Port1"， Producer IP2:Port2, "Producer IP3:Port3"]</font> - >  Fill in with <font  color=#DC143C face="黑体">All other producers except this node</font>'s IP and port(Genesis node also needs be configured here), if you have more producer nodes, the ip and port should also be filled in here.

P2PAuthRequried = false

P2PAuthKeyList = []

MaxPeer = 60

[Delegate]

Solo = <font color=#DC143C face="黑体">false</font> -->Modify to false

[Delegate.Signature]

Type = "key"

PrivateKey = <font color=#DC143C face="黑体">"XXX"</font> -> Fill in this node's private_key value that generated for this node(i.e. delegatep1's private_key) for this node here (quotes are also required)

PublicKey = <font color=#DC143C face="黑体">"YYY"</font> -> Fill in this node's public_key value that generated for this node(i.e. delegatep1's public_key) for this node here (quotes are also required)

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

#### Check the genesis.toml on each node

You must ensure that the contents of this file are consistent across all nodes (creation node, production node).

#### Start all Producer Nodes

After the originator node has created the producer, the user needs to start each producer on all the production section VMS and start the BOTTOS main process on each producer VM separately：

```
./bottos --delegate <Current producer node's name，like delegatep1 > --enable-wallet

```

After starting, observe the block output of each node, and when the program starts synchronizing blocks, the node starts successfully. Synchronization block printing is provided below for reference.


InsertBlock, number:1552, time:2018-12-18 10:06:18, delegate:<font color=#DC143C face="黑体">delegatep1</font>, trxn:0, hash:7664063509a4a813f2fa06a929f11a36ba66184e036dfe7c49937a28d5328050, prevHash:98f4567dbcd6dfd8c0bc7ce4f24ee96f2d3476691088e08475ae56bb62d6afd3, version:3.4.0
InsertBlock, number:1553, time:2018-12-18 10:06:21, delegate:<font color=#DC143C face="黑体">delegatep1</font>, trxn:0, hash:cbef8f392a17cfdf58587b263f22cb844e7dd534336fb2f3b99ca5d9276466d6, prevHash:7664063509a4a813f2fa06a929f11a36ba66184e036dfe7c49937a28d5328050, version:3.4.0
InsertBlock, number:1554, time:2018-12-18 10:06:27, delegate:<font color=#DC143C face="黑体">delegatep1</font>, trxn:0, hash:ea88602bf0ad960172357403a6626df0a4b19443b5fd665561ce82dcb4e95792, prevHash:cbef8f392a17cfdf58587b263f22cb844e7dd534336fb2f3b99ca5d9276466d6, version:3.4.0
InsertBlock, number:1555, time:2018-12-18 10:06:30, delegate:<font color=#DC143C face="黑体">delegatep1</font>, trxn:0, hash:97f630674cbc165b168196421b3817710047c886f64dc208f0f8fc380361425a, prevHash:ea88602bf0ad960172357403a6626df0a4b19443b5fd665561ce82dcb4e95792, version:3.4.0
InsertBlock, number:1556, time:2018-12-18 10:06:33, delegate:<font color=#DC143C face="黑体">delegatep1</font>, trxn:0, hash:ddf178d67791dc599495e3b4671b20054b725c3b707b81d32e57f4d0967196d9, prevHash:97f630674cbc165b168196421b3817710047c886f64dc208f0f8fc380361425a, version:3.4.0
InsertBlock, number:1557, time:2018-12-18 10:06:39, delegate:<font color=#DC143C face="黑体">delegatep1</font>, trxn:0, hash:ff6b472b91d578239b17f62c2332ce150b30e9a7a3a3056dac142774a412fa49


#### Genesis node hands over the block rights

After all producers are started to receive electricity, check the outgoing block printing of VM of all nodes to see whether the latest block height is close to and consistent;

When all are confirmed to be close and consistent, move the chunk rights over the genesis node and type the following command at the genesis node：

./bcli genesis blkprodtrans --sender bottos --actblknum 100

Notice: 100 is the block number that is effective for the handover of the block operation, which is a block number in the future, which is greater than the current block number.

After the block number of the handover (above, 100) is exceeded,  if you observe the outputting of all the producer nodes, you can find that the outlier has started to replace in turn, indicating that the outputting has been successfully delivered：

InsertBlock, number:1552, time:2018-12-18 10:06:18, delegate:<font color=#DC143C face="黑体">delegatep1</font>, trxn:0, hash:7664063509a4a813f2fa06a929f11a36ba66184e036dfe7c49937a28d5328050, prevHash:98f4567dbcd6dfd8c0bc7ce4f24ee96f2d3476691088e08475ae56bb62d6afd3, version:3.4.0

InsertBlock, number:1553, time:2018-12-18 10:06:21, delegate:<font color=#DC143C face="黑体">delegatep2</font>, trxn:0, hash:cbef8f392a17cfdf58587b263f22cb844e7dd534336fb2f3b99ca5d9276466d6, prevHash:7664063509a4a813f2fa06a929f11a36ba66184e036dfe7c49937a28d5328050, version:3.4.0

InsertBlock, number:1554, time:2018-12-18 10:06:27, delegate:<font color=#DC143C face="黑体">delegatep6</font>, trxn:0, hash:ea88602bf0ad960172357403a6626df0a4b19443b5fd665561ce82dcb4e95792, prevHash:cbef8f392a17cfdf58587b263f22cb844e7dd534336fb2f3b99ca5d9276466d6, version:3.4.0

InsertBlock, number:1555, time:2018-12-18 10:06:30, delegate:<font color=#DC143C face="黑体">delegatep4</font>, trxn:0, hash:97f630674cbc165b168196421b3817710047c886f64dc208f0f8fc380361425a, prevHash:ea88602bf0ad960172357403a6626df0a4b19443b5fd665561ce82dcb4e95792, version:3.4.0

InsertBlock, number:1556, time:2018-12-18 10:06:33, delegate:<font color=#DC143C face="黑体">delegatep5</font>, trxn:0, hash:ddf178d67791dc599495e3b4671b20054b725c3b707b81d32e57f4d0967196d9, prevHash:97f630674cbc165b168196421b3817710047c886f64dc208f0f8fc380361425a, version:3.4.0

InsertBlock, number:1557, time:2018-12-18 10:06:39, delegate:<font color=#DC143C face="黑体">delegatep7</font>, trxn:0, hash:ff6b472b91d578239b17f62c2332ce150b30e9a7a3a3056dac142774a412fa49

At this point, the establishment of its own network process is complete. Users can query more BOTTOS help documents for further testing.

#### Stop Nodes

To close the nodes, you need to go to each node to close bottos process. You can close it by kill operation.

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

#### Check LOG information

If you encounter problems in the process, you can check the datadir/log/bottos.log generated in each node version package directory to see if there is any new ERR log information generated.

# Approach 3： How to start the synchronization nodes

The synchronization node synchronizes only the latest blocks and does not produce blocks as producers. The following sections show how to start a synchronization node and join an existing network.

## Configure for config.toml

cd to your bottos release directory:

1 Open the config.toml file and modify the red parts

[Node]

DataDir = "./datadir"

[Rest]

RESTPort = 8689

RESTHost = "localhost"

[P2P]

P2PPort = 9868

P2PServAddr =  <font color=#DC143C face="黑体">"192.168.0.11"</font> - >Modify the IP to the user IP (you can query it with ifconfig command)

PeerList = <font color=#DC143C face="黑体">["Producer IP1:Port1"， Producer IP2:Port2, "Producer IP3:Port3"]</font> - >Fill in with <font  color=#DC143C face="黑体">All other producers except this node</font>'s IP and port, if you have more producer nodes, the ip and port should also be filled in here.

P2PAuthRequried = false

P2PAuthKeyList = []

MaxPeer = 60

[Delegate]

Solo = true

[Delegate.Signature]

Type = "key"

PrivateKey = "b799ef616830cd7b8599ae7958fbee56d4c8168ffd5421a16025a398b8a4be45"

PublicKey = "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f"

URL = ""

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

If you need to configure multiple nodes in a host environment (non-docker environment), it is not recommended to configure multiple BOTTOS processes in a VM environment. Otherwise, config.toml port parameters need to be modified. The BCLI command also needs to add address parameters, which can be cumbersome for users.

#### Start Synchronization Node

Start the BOTTOS main process on the synchronization node VM：

```
./bottos 
```

Check the print, observe the block, check whether the synchronized block and the network block are at the same block height.

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
root@JD-linglong3:~/code/bottos/bcli#
```
