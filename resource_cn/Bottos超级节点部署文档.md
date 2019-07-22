## 				Bottos 超级节点部署文档



## 1  Bottos 超级节点部署要求

要求概览

|                         硬件要求                          |   软件要求    | 质押要求 |
| :-------------------------------------------------------: | :-----------: | :------: |
| X86 架构服务器或虚拟环境，公网IP连接网络，具体配置见1.1.1 | Linux操作系统 | 49W+ BTO |

### 1.1  Bottos 超级节点硬件要求

Bottos节点能够稳定部署和运行在 X86 架构服务器环境及主流虚拟化环境。 

####      1.1.1 节点最低配置

主网节点最低配置：

| CPU     | Memory | Local Storage | Network |
| ------- | ------ | ------------- | ------- |
| 4 Core+ | 8 GB+  | 1 TB+         | 20 Mb   |

测试网节点最低配置：

| CPU     | Memory | Local Storage | Network |
| ------- | ------ | ------------- | ------- |
| 2 Core+ | 4 GB+  | 512 GB+       | 10 Mb   |

注：云服务推荐提供商- Azure (国际) with DDoS 防护，Alibaba Cloud with DDoS 防护，JDCloud with DDoS 防护。

以上为建议的最小配置，自行降低配置，可能影响节点正常出块，由节点自行负责。

后续随交易量变大，最低配置可能会提升。

云服务操作指南见本文最后章节。

####      1.1.2 网络要求

​        当前网络只支持公网IP连接，需满足如下要求：

- 到种子节点列表：mainnetservice1.bottos.org、mainnetservice2.bottos.org（具体见[区块浏览器](http://explorer.chainbottos.com/#/nodes/index)节点列表）的 ping 值不超过 250ms       

  使用SSH 工具登录服务器后执行命令：

  ```
  # ping mainnetservice1.bottos.org
  
    bottos@DS3-2:~$ ping mainnetservice1.bottos.org
    PING mainnetservice1.bottos.org (114.67.80.177) 56(84) bytes of data.
    64 bytes from 114.67.80.177: icmp_seq=1 ttl=48 time=4.20 ms
    64 bytes from 114.67.80.177: icmp_seq=2 ttl=48 time=4.17 ms
    64 bytes from 114.67.80.177: icmp_seq=3 ttl=48 time=4.35 ms
    64 bytes from 114.67.80.177: icmp_seq=4 ttl=48 time=4.26 ms
  
    --- mainnetservice1.bottos.org ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 3004ms
    rtt min/avg/max/mdev = 4.171/4.248/4.358/0.106 ms
  ```

  

- 节点外网带宽 >= 20 Mb

- 服务器启动后，在ECS 管理界面，需在网络侧和主机侧启用相关端口：

  | 端口 | 默认开启 | 说明                                                         |
  | ---- | -------- | ------------------------------------------------------------ |
  | 9868 | 是       | 节点间通讯端口，数据同步使用，必须开启                       |
  | 8689 | 是       | REST API服务访问端口，若节点需对外提供API 访问，则需开启，否则建议关闭 |
  | 6869 | 否       | 钱包服务端口，默认仅支持本机（127.0.0.1）访问，若生产节点出块采用钱包签名（非读取配置文件私钥），则必须启动；其他场景建议生产节点关闭 |

  

### 1.2  Bottos 超级节点软件要求

 Bottos 节点推荐使用 Linux操作系统，推荐 Ubuntu Server 16.04.5 LTS及以上版本。

Linux操作系统平台及版本要求 

| 发行版     | 版本    |
| ---------- | ------- |
| Ubuntu LTS | ≥ 16.04 |
| CentOS     | ≥ 7.4   |

### 1.3  Bottos 超级节点质押要求

用户必须质押49W+ BTO 才能将自己注册为生成者，成为生产者后具体是否能够参与出块，还需看全网节点投票排名是否在前29名，排名在30-49名可以获得备选节点收益。



## 2 Bottos 超级节点部署过程

### 2.1 Bottos 节点介绍

Bottos网络的节点主要分为两类：超级节点，服务节点。

1） 超级节点
超级节点包含全网全部区块数据，并在创世节点移交出块权利后负责共识出块。

2） 服务节点
接收交易入口，同步全网区块数据，对交易进行初步检验，然后转发交易。

注：

*a*. Bottos主网包含*49*个超级节点和若干服务节点。 

*b*. 本章节仅用作超级节点部署简洁指导，预了解更多细节，详见 ：[Bottos开发者文档](https://github.com/bottos-project/Documentation/blob/master/Bottos%E5%BC%80%E5%8F%91%E8%80%85%E6%96%87%E6%A1%A3.md)

### 2.2 Bottos 软件准备

节点运行所需文件下载地址：

<https://github.com/bottos-project/bottos/releases>

方式一：

可先将软件下载到本地，然后通过FTP 工具等方式将软件上传至服务器；

方式二：

以Chrome 浏览器，V3.7 版本为例，在软件 以.tar.gz 结尾的软件上右键->选择“复制链接地址”，通过如下方式直接下载到服务器上；

 登录服务器后执行如下操作：

```
1、创建运行目录
# mkdir -p /root/bottos_node

2、下载节点运行文件
# cd /root/bottos_node/
# wget https://github.com/bottos-project/bottos/releases/download/v3.7.0/bottos_mainnet_V3.7.tar.gz

3、解压文件
# tar zxvf bottos*node*.tar.gz 

4、进入解压后的文件目录
# cd /root/bottos_node/bottos/

5、检查是否有如下文件：
ubuntu@bottos:~/bottos_node/bottos# ls
bcli  bottos config.toml genesis.toml wallet walletlog.xml
ubuntu@bottos:~/bottos_node/update/bottos# md5sum bottos 
71f15a639bf4dac4f8e7172cc178c4fa  bottos
返回结果为：71f15a639bf4dac4f8e7172cc178c4fa 说明文件正确（每个版本的该值会不同），否则请重新下载
```

节点启动需要如下文件

| 文件          | 说明                                           |
| ------------- | ---------------------------------------------- |
| bcli          | bottos链交互工具                               |
| bottos        | bottos程序文件                                 |
| config.toml   | bottos配置文件(需修改，需线下与官方沟通，获取) |
| genesis.toml  | bottos启动文件(不需修改)                       |
| wallet        | 钱包程序运行文件                               |
| walletlog.xml | 钱包程序配置文件                               |

注：config-testnet.toml、genesis-testnet.toml是连接测试网(包括超级节点、服务节点)的配置文件， config.toml、genesis.toml是启动单节点的配置文件。 

####      2.2.1 安全防护（仅超级节点需要）

超级节点安全主要从以下方面防护：

| 检查项                 | 说明                                                       |
| ---------------------- | ---------------------------------------------------------- |
| 系统漏洞               | 对已知的系统漏洞打相应的补丁                               |
| 防火墙关闭不使用的端口 | 按照需求，仅开启需要的端口，具体防火墙操作见各云主机商指导 |
| 防火墙开启防DDOS 攻击  | 开启DDOS 防御功能，具体防火墙操作见各云主机商指导          |

#### 2.2.2 线下沟通获取白名单列表（仅超级节点需要）

​	预准备做超级节点用户，需线下与Bottos 官方沟通，获取最新的IP及p2p 白名单列表。

后续会实现自由加入或退出。

### 2.3 准备 Bottos 超级节点环境

####      2.3.1 下载运行程序

#### 2.3.2   准备节点启动配置文件

​      项目运行路径下（/root/bottos_node/bottos/）有两个配置文件config.toml 、genesis.toml，

genesis.toml：Bottos 链网络唯一标识配置文件，不需修改；

config.toml：节点相关配置，需如下修改：

1、修改 P2PServAddr 字段网络IP

```
[P2P]
P2PPort = 9868
P2PServAddr = "192.168.1.1"
PeerList = []
P2PAuthRequried = false
P2PAuthKeyList = []
MaxPeer = 200
```

修改为服务器的公网IP

```
[P2P]
P2PPort = 9868
P2PServAddr = "114.67.80.177"
PeerList = []
P2PAuthRequried = true
P2PAuthKeyList = []
MaxPeer = 200
```

备注：

​	**1）P2P的其他部分不需要修改；**

​	2）服务器公网IP 查询方法：

```
# curl icanhazip.com
114.67.80.177
```

2、修改生产者签名默认配置为公私钥的方式

PublicKey： 修改为 生产者提供的第二组（出块签名）公钥

```
[Delegate.Signature]
Type = "wallet"
PublicKey = "046aa27050c156314f3567be87c7e339277fdfe193fd8a6ec0e5abf85c8a37a0838f08af60d1c302f9c07447a0bb8a9fdf49a192b49d8b484984a533f314dc3a6a"
URL = "http://127.0.0.1:6869/v1/wallet/signhash"
```

#### 2.3.3 解锁钱包

执行2.3.4 “质押代币” 、2.3.5 “注册生产者“、2.3.6 ”给超级节点投票“  均需解锁钱包，默认解锁时长为5分钟，超时后请再次解锁。

```
1、（可选）如钱包不存在，需创建区块签名钱包：
# ./bcli wallet create --account delegatexx
Please input your password for your wallet:
Please input your password again for your wallet:
Please input your private key for your wallet:
{
	"wallet_name": "delegatexx.keystore"
}
Create wallet done. Now unlock the wallet within 300 seconds.
{
	"unlock": true
}

说明：
	private key：为超级节点账号在bottos链上注册的账号对应的私钥


2、解锁主账号钱包：
# ./bcli wallet unlock --timeout 300 --account delegatexx
Please input your password for your wallet:
{
	"unlock": true
}
```

#### 2.3.4  质押代币

​         再次说明，必须质押49W+ BTO 才能将自己注册为生成者，具体是否能够参与出块，需看全网节点投票排名是否在前29名，排名在30-49名可以获得备选节点收益。

​	质押代币支持两种方式：

​	方式一（推荐）：使用手机钱包，进入钱包-> 资产详情 BTO -> 质押 ->输入 质押BTO数 ->点击“质押” ->输入密码。

​	方式二：使用命令：	

```
# cd /root/bottos_node/bottos/
# ./bcli --servaddr mainnetservice1.bottos.org:8689 account stake --account delegatexx --amount 490000 --target vote

说明：
--account：超级节点账号名称
--amount：质押代币数量
--target：质押用作投票，不需修改
```

可通过[区块浏览器](http://explorer.chainbottos.com)  输入账号，查看是否质押成功。

#### 2.3.5  注册生产者（针对新加入超级节点）

​	**已经是生产者的节点不需要**执行此步骤。

 	新加入的超级节点，必须质押（操作见上一步）。

```
# cd /root/bottos_node/bottos/
# ./bcli --servaddr mainnetservice1.bottos.org:8689 delegate register --account delegatexx --signkey 040120b635de73be6a506445e603446a0332f62fa0bd3c6428e3c0ba3999fea7c0662655d0c921ae045b65248281f64393d19cb443e658b79fa2e65313b745cbca  --location Shanghai,China,Asia --description bottosfoundation

说明：
--account：超级节点账号名称
--signkey：出块签名使用的公钥，建议新生成一对，生成方法见：FAQ 3.1 章节，与 2.4.2 章节 使用的公钥一致，
--location：超级节点所在地理位置
--description: 超级节点相关的描述
```

#### 2.3.6  给超级节点投票

​	可以为自己投票也可以为他人投票。超级节点为自己投票也需要执行此步骤。

投票支持两种方式：

​	方式一（推荐）：使用手机钱包，进入钱包-> 资产详情 BTO ->投票 ->选择待投票的超级节点 ->点击“投票” ->输入密码。

​	方式二：使用命令：	

```
# cd /root/bottos_node/bottos/
# ./bcli --servaddr mainnetservice1.bottos.org:8689 delegate vote --voter delegatexx --delegate delegatexx

说明：
--voter：主动投票人，可与delegate 名称一致，也可不一致
--delegate：超级节点账号名称
```

可通过[区块浏览器](http://explorer.chainbottos.com)  输入账号，查看投票信息。

###     2.4  Bottos 超级节点启动

​	超级节点需同步到最新块号才可参与出块，同步到最新块有两种方式：

方式一：使用区块镜像快速启动节点（参考2.4.1），先将历史区块镜像数据复制到本地，然后启动bottos程序，整个过程约1-2小时（视网络带宽大小浮动）；

方式二：启动bottos程序（参考2.4.2），从0号块开始同步，同步速度约为60块/秒（具体视网络和机器配置浮动），当前Bottos 区块链块号480W +，若通过同步的方式追赶到最新块，需 72+小时，同时对网络可靠性要求较高；

#### 2.4.1 使用区块镜像，快速启动节点（推荐）

​	推荐使用镜像数据方式，快速启动节点，节约时间，并且稳定性高。

​	注：以下过程可能要2小时左右，复制数据时不能中断。

```
1、复制文件至 /home/bottos_node/bottos/datadir 路径
# cd /home/bottos_node/bottos/datadir

# scp bottos@114.67.230.163:/home/bottos/data*.tar.gz.* ./
输入密码：bottos

注意：
	1）数据传输中，界面不可关闭，要保证网络的稳定性；
	2）整体数据大小约为8G，4个文件，后续随出块数的增多，数据大小将持续增加。若网络中断，需重新复制；

2、记录启动程序命令：
# ps -ef |grep bottos

3、停止已运行的bottos 服务：
# ps -ef | grep 'bottos' | grep -v grep | cut -c 9-15 | xargs kill -SIGINT
可能无结果显示，属于正常

4、（若存在历史数据）删除 历史数据
# rm -r data

5、解压上传的文件
# cat data*.tar.gz.* | tar -zx

6、启动程序--同步骤2的命令(若存在)，或参考如下命令
# nohup ./bottos --delegate delegateNAMEXXX --delegate-signkey 046aa27050c156314f3567be87c7e339277fdfe193fd8a6ec0e5abf85c8a37a0838f08af60d1c302f9c07447a0bb8a9fdf49a192b49d8b484984a533f314dc3a6a --enable-wallet &

说明：
	--delegate：生产者账号名
	--delegate-signkey：出块签名使用的公钥，与 “注册生产者”章节 使用的公钥一致
	--enable-wallet：可选，启动钱包服务
	--disable-api：可选，不启动REST api服务
	--recover_at_blocknum:数据重构，数值为776350，不需要修改
7、（可选）如钱包不存在，需创建区块签名钱包：
# ./bcli wallet create --account delegatexx --type delegate
Please input your password for your wallet:
Please input your password again for your wallet:
Please input your private key for your wallet:
{
	"wallet_name": "delegatexx_sign.keystore"
}
Create wallet done. Now unlock the wallet within 300 seconds.
{
	"unlock": true
}

8、解锁区块签名钱包：
# ./bcli wallet unlock --type delegate --timeout 0 --account delegatexx
Please input your password for your wallet:
{
	"unlock": true
}
```

####     2.4.2 全新同步方式，启动节点

```
1、进入项目运行路径：
# cd /root/bottos_node/bottos/
2、停止已运行的bottos 服务：
# ps -ef | grep 'bottos' | grep -v grep | cut -c 9-15 | xargs kill -SIGINT
可能无结果显示，属于正常

3、检查是否有已经运行的
# ps -ef | grep 'bottos' | grep -v grep
若无返回结果，则继续执行步骤4，否则，重复执行步骤2

4、删除历史数据
# rm -rf nohup.out

5、启动超级节点
# nohup ./bottos --delegate delegatexx --delegate-signkey 046aa27050c156314f3567be87c7e339277fdfe193fd8a6ec0e5abf85c8a37a0838f08af60d1c302f9c07447a0bb8a9fdf49a192b49d8b484984a533f314dc3a6a --enable-wallet &

说明：
	--delegate：生产者账号名
	--delegate-signkey：出块签名使用的公钥，与 “注册生产者”章节 使用的公钥一致
	--enable-wallet：可选，启动钱包服务
	--disable-api：可选，不启动REST api服务
	--recover_at_blocknum:数据重构，数值为776350，不需要修改
6、（可选）如钱包不存在，需创建区块签名钱包：
# ./bcli wallet create --account delegatexx --type delegate
Please input your password for your wallet:
Please input your password again for your wallet:
Please input your private key for your wallet:
{
	"wallet_name": "delegatexx_sign.keystore"
}
Create wallet done. Now unlock the wallet within 300 seconds.
{
	"unlock": true
}

7、解锁区块签名钱包：
# ./bcli wallet unlock --type delegate --timeout 0 --account delegatexx
Please input your password for your wallet:
{
	"unlock": true
}
```

####     2.4.3 检查节点启动是否正常同步

#####        2.4.3.1 检查节点启动是否正常

​	执行如下命令，出现如下打印即为启动成功：（由于创世节点还未启动，日志打印为异常状态，如下字样)

```
# cd /root/bottos_node/bottos/
#  head datadir/log/bottos.log 
2019-01-24 20:02:29.619 [ERR] block.go:274 processBlockReq(): PROTOCOL get block:95, 1, num 480559
2019-01-24 20:02:29.619 [ERR] block.go:274 processBlockReq(): PROTOCOL get block:95, 1, num 480586
2019-01-24 20:02:29.623 [ERR] forkdb.go:125 Insert(): CHAIN start number 777475, head number 777476, hash c2b1e7dbb8b34b01ca8e8064b070f59034c6f79b394eefe8be061a3b2670aab1
2019-01-24 20:02:29.624 [ERR] blockchain.go:1074 updateDelegate(): CHAIN delegate bto-alibaba, update last confirmed block, old 777458, new 777476

2019-01-24 20:02:29.624 [ERR] chainactor.go:244 PreCommitBlockReq(): PreCommitBlock, errorcode:0, number:777476, time:2019-01-24 12:02:30, delegate:bto-alibaba, trxn:0, validatorn:
19, hash:c2b1e7dbb8b34b01ca8e8064b070f59034c6f79b394eefe8be061a3b2670aab1, prevHash:ec900816e073d1dfdd244150b74e151ea4cb0cc1c3cf4f908f34c3f2f7dad6a0
```

#####    2.4.3.2 检查节点同步是否正常

​	当创世节点启动后，执行如下命令，出现如下打印即为启动成功：（数据重构大约需要100分钟)

```
# cd /root/bottos_node/bottos/
# tail -f nohup.out
InsertBlock, number:1, time:2018-12-21 08:14:27, delegate:bottos, trxn:0, hash:8c159d2c1e677a1108f14ab82b205dda642f6ebab60cb26c0543849993b4eb6a, prevHash:caf2bae84f70412354211dd5028142eca6901b06b9a65dfbe9df065bcf56e291, version:3.4.0
InsertBlock, number:2, time:2018-12-21 08:14:30, delegate:bottos, trxn:0, hash:aebbe9d2d9608f0bb18b91689e0654a71a90b5b8a31290232048e8b3ed78f0e9, prevHash:8c159d2c1e677a1108f14ab82b205dda642f6ebab60cb26c0543849993b4eb6a, version:3.4.0
InsertBlock, number:3, time:2018-12-21 08:14:33, delegate:bottos, trxn:0, hash:0a8c0cda99a2cc9b345ae989066e97c7f53da51edcf205545117d98597b5ca22, prevHash:aebbe9d2d9608f0bb18b91689e0654a71a90b5b8a31290232048e8b3ed78f0e9, version:3.4.0
InsertBlock, number:4, time:2018-12-21 08:14:36, delegate:bottos, trxn:0, hash:5025f7c8ac8e25af4a4606f7c6890099dd028b0cb804bf2cd64368ce27c95b20, prevHash:0a8c0cda99a2cc9b345ae989066e97c7f53da51edcf205545117d98597b5ca22, version:3.4.0
InsertBlock, number:5, time:2018-12-21 08:14:39, delegate:bottos, trxn:0, hash:5ef2d46f192ac15eecb1fc3061acbf1813ea55c4d59b7a170e68184a3943961a, prevHash:5025f7c8ac8e25af4a4606f7c6890099dd028b0cb804bf2cd64368ce27c95b20, version:3.4.0
```

##### 2.4.3.3 检查节点是否出块

​         执行如下命令，出现如下信息即为已参与出块。

```
# tail -f nohup.out
PreCommitBlock, number:777803, time:2019-01-24 12:22:21, delegate:bottos-mainnetnode1, trxn:0, hash:6cd9d51a1419285ae1d66a8b2db82a8ce4887b99455b948b9028a78fe90705ee, prevHash:753038db02f2682964384100227327405655a645754b1695f824626cb7ba5333
CommitBlock, number:777803, time:2019-01-24 12:22:21, delegate:bottos-mainnetnode1, trxn:0, hash:6cd9d51a1419285ae1d66a8b2db82a8ce4887b99455b948b9028a78fe90705ee, prevHash:753038db02f2682964384100227327405655a645754b1695f824626cb7ba5333, version:1.0.0
PreCommitBlock, number:777804, time:2019-01-24 12:22:24, delegate:bottosbaymax, trxn:0, hash:e3b1a5a2faf2cfee14bc7323337279fa8a07b3b1e43aceef79d006e24d0d6c1c, prevHash:6cd9d51a1419285ae1d66a8b2db82a8ce4887b99455b948b9028a78fe90705ee
CommitBlock, number:777804, time:2019-01-24 12:22:24, delegate:bottosbaymax, trxn:0, hash:e3b1a5a2faf2cfee14bc7323337279fa8a07b3b1e43aceef79d006e24d0d6c1c, prevHash:6cd9d51a1419285ae1d66a8b2db82a8ce4887b99455b948b9028a78fe90705ee, version:1.0.0

说明：
number：为当前节点同步的最新块号，需与区块浏览器对比是否同步到最新块。同步到最新块后，才可以参与出块。
```

### 2.5 Bottos 服务节点启动

Bottos 服务节点启动需要如下先决条件：

1）完成Bottos节点安装环节。

2）准备节点启动配置文件。

在项目代码路径下（~/bottos-node/bottos/）有两个配置文件config-testnet.toml、genesis-testnet.toml。
genesis-testnet.toml是节点启动的配置文件，不需修改。config-testnet.toml需如下修改：

```
配置文件：config-testnet.toml
[P2P]
P2PServAddr
修改为本节点的公网IP
```

上述完成后，即可启动Bottos服务节点。
在项目代码路径下执行如下操作：

```
进入项目代码路径
cd ~/bottos-node/bottos/
启动服务节点
./bottos --config "./config-testnet.toml" --genesis "./genesis-testnet.toml" --
enable-mongodb --enable-wallet 
```


出现如下打印即为启动成功：（p2p建立连接，接入Bottos链，需要等待一会）

```
root@JD-7:~/bottos-node/bottos# ls
bcli bottos config-testnet.toml config.toml genesis-testnet.toml genesis.toml
root@JD-7:~/bottos-node/bottos# ./bottos --config "./config-testnet.toml" --genesis
"./genesis-testnet.toml" --enable-mongodb --enable-wallet
CommitBlock by p2p: lib: 1
InsertBlock: number:1, delegate:bottos, trxn:0, time=1539307731, hash:
d4fbaa620284e644bc0d4fca39c229e951cb56f8115f2357eccbd0aa67a257cd,
prevHash=98128aa21d634eda9cb0152314b06480d4c51b0bf18ea6d39f5189388e1bf4ee
CommitBlock by p2p: lib: 2
InsertBlock: number:2, delegate:bottos, trxn:0, time=1539307734, hash:
65a7a06485a8344acf1fb53356dd35d1fdc0d23640004f3d0b197dd393d3d7b1,
prevHash=d4fbaa620284e644bc0d4fca39c229e951cb56f8115f2357eccbd0aa67a257cd
CommitBlock by p2p: lib: 3
InsertBlock: number:3, delegate:bottos, trxn:0, time=1539307737, hash:
66fadeff77fde8074937fad39bbd5b1daa23e2eb1402e15c17ed2435acbe0983,
prevHash=65a7a06485a8344acf1fb53356dd35d1fdc0d23640004f3d0b197dd393d3d7b1
CommitBlock by p2p: lib: 4
InsertBlock: number:4, delegate:bottos, trxn:0, time=1539307740, hash:
ee0b954a26841a75678397c26972312cfb7b61a1deff0e84a70907ab8bc6c5b5,
prevHash=66fadeff77fde8074937fad39bbd5b1daa23e2eb1402e15c17ed2435acbe0983
CommitBlock by p2p: lib: 5
InsertBlock: number:5, delegate:bottos, trxn:0, time=1539307743, hash:
000422b20fb4e3294e2cb80788be6eadff2d4db073e5bd674ed592d476293a9b,
prevHash=ee0b954a26841a75678397c26972312cfb7b61a1deff0e84a70907ab8bc6c5b5
CommitBlock by p2p: lib: 6
InsertBlock: number:6, delegate:bottos, trxn:0, time=1539307746, hash:
73b9994744ca581611aba92b09a65fa4cbafa492ef69b75258f17d8e2737ced8,
prevHash=000422b20fb4e3294e2cb80788be6eadff2d4db073e5bd674ed592d476293a9b
CommitBlock by p2p: lib: 7
InsertBlock: number:7, delegate:bottos, trxn:0, time=1539307749, hash:
24afa04a57f334a0b9387164cdebd0b6a0e24ff637e0fe2ec82c8ddbc32ce561,
prevHash=73b9994744ca581611aba92b09a65fa4cbafa492ef69b75258f17d8e2737ced8
CommitBlock by p2p: lib: 8
InsertBlock: number:8, delegate:bottos, trxn:0, time=1539307752, hash:
b35d962eea91b0b3e63eacdd8ad040080d1975db550bccea17c0906fad944183,
prevHash=24afa04a57f334a0b9387164cdebd0b6a0e24ff637e0fe2ec82c8ddbc32ce561
CommitBlock by p2p: lib: 9
InsertBlock: number:9, delegate:bottos, trxn:0, time=1539307755, hash:
b038b018ad2f567dc07abfbe72792b38279f53d7ef711bbda56c6ab30d65bdac,
prevHash=b35d962eea91b0b3e63eacdd8ad040080d1975db550bccea17c0906fad944183
CommitBlock by p2p: lib: 10
InsertBlock: number:10, delegate:bottos, trxn:0, time=1539307758, hash:
6d1db2c479e0c9a6e7522be63cf02a2478ba41c6aab7add925beb90bd7eb79d3,
prevHash=b038b018ad2f567dc07abfbe72792b38279f53d7ef711bbda56c6ab30d65bdac
```

注：若长时间未成功，请确认项目代码路径下*datadir*是否删除。
服务节点启动后即可通过bottos链交互工具-BCLI，执行创建钱包、创建账户、转账、部署合约等操作。参见
Bottos单节点启动的相关介绍 



## 3 FAQ

### 3.1  如何生成公私钥对？

```
# cd /root/bottos_node/bottos/
# ./bcli wallet generatekey

public_key: 04e3f354f5b6131a9570e7b7e6d3acba644356d270b6676bb6333ecbd220e5d46c1f8df056af139cae5b6b587d881cec6055d10a3443c51644d609a0b7f1b47331
private_key: a2aefa5f0aed77868ebc22b748923bd2205be7b17cdf755b6924aa9292e4448c

说明：
public_key：公钥
private_key：私钥
以上为示例，如需要请自行生成。
```

### 3.2  累计超过两天未正常出块，如何重新注册生产者？

​	超级节点如果被选为出块节点，但累计两天未正常出块，会被加入黑名单，如想再次出块需重新加入到生产者列表，步骤如下：

1、解锁钱包，参考 2.3.3 解锁钱包 章节

2、将自己取消设置生产者

```
# cd /root/bottos_node/bottos/
# ./bcli delegate cancel --account delegatexx

说明：
--account：超级账号名称
```

3、参考 2.3.5 注册生产者 章节，重新注册生产者

### 3.3  手动提取出块奖励

1、解锁钱包，参考 2.3.3 解锁钱包 章节

2、提取出块奖励

```
# cd /root/bottos_node/bottos/
# ./bcli delegate claimreward --account delegatexx

说明：
--account：超级账号名称
```

3、（可选）如是生产节点，需重新解锁出块钱包，以便恢复出块

```
# ./bcli wallet unlock --timeout 0 --type delegate --account delegatexx
Please input your password for your wallet:
{
	"unlock": true
}

说明：
--timeout: 钱包解锁持续时间，0表示一直解锁
--account：超级账号名称
```

### 3.4  手动更新P2P白名单

​	出于安全考虑，当前版本P2P 白名单，需手动更新，操作指导如下

1、将新加入节点的公钥加入P2P白名单

```
# cd /root/bottos_node/bottos/
# sed -i '/0464ad758deb527035085a728c805ca4ff50ede206fa103c00468efe07a46725893ca0b9edc31240171b3cf4ef2fccaa951b09942516d2ccf060f30a7cfae728e9/i\"044ae420ee048c3d1621b9c064601f151944268c556da7bad8cd4b65b2cc35c9a5cd47a6d483807290264e9150f3751ab9169649b2c8a5bc4fc3ab71d198a8391e",\n"04d298e7dfe16a3477683f0d9167eb4fcd9708b9aa0ef35e0b5bd106addfda0f62180cc6b57ac8db6511d621f79e3873bc77472e91d8ea85dea0088c885673b5c2",\n"045d35251ffd52a34c68a91a617d72cc57fc0c3b552dedb0f2e2d9be02194cf67040315b7402e3978dc245279ac23cfdcf94ddf2fcc099de77715a096ee9fe928b",\n"0452170c742148f27239be46ad5e8264f9c59db634f360a6cd0ed54d1952a30becc6990a2a955fcaf119edc55305cfdba75a51ae87d17309da3efbe424f4f8228b",\n"0494a24e7bdf54a24eaacf371be6b0e1150acc39506e05ba5b197b80178fd595fb06285f3eb5f7f50522121560dd5c7569ebf7785365a15f45790671c964de7dec",\n"04ee847d738f01f1cfd426791bdedc379477b03548666fdfc2364d9afb57a44dd70e0bc5499b5b92cf257edee33e2fd3b4c02b7162b5020ad6113791ab6c63a1d0",\n"04b6862e0b7947411e5fa961736390cec51a371b594a1069641125cdaabd2e0859c9f3ce6248781761d1e4e4e03e13de1e1dd61eb947ef25bd27557f2f73752141",\n"04505ad1967c3db5e440cb7bf4d99083b11923e828bba5b1786532f6b691fa0ecfef95672f9ea58ea52cb07d9aaf07c6962c14318bedb6be4f2efe675b7539a607",\n"04377ac062c524d65fa637e5987aeafc159fe3f08bcee3dadbdd9ebec00ca1452a36ac5249f61e4a1902bd45009b77b776755516724a6b0b0a129f31f1fe6b86b3",\n"0439f78f504a331e2f1448260914fbc27009b181891063de25de923e2509ac33fba09e7244437ab7626437deb9ed872e045556cc2016f3ffe7471c0240b729f2df",\n"04071f8dfd7dcc37d08104416f373f9d7a985837a38ea580378b0e82f26b76c16e16ae859008db29cccdf26f3eeb8b04f03f239b3486486a81b73614705dc7403a",\n"04e2ce42fdac4593f68c690302c6d656969d6e7340ae84b8a704d115d3e54695c15f4d5cd2cb7aea98a9334758441b7da028d4468fefc999a7906541833e1121b4",' config.toml
```

2、重启bottos进程

参考 2.4.2 全新同步方式，启动节点

## 



## 4  推荐云服务商基础使用教程

####     Azure

1. 开通和使用微软云：
   https://www.azure.cn/zh-cn/pricing/1rmb-trial-full/?form-type=identityauth
2. 创建管理云服务器：
   https://www.azure.cn/zh-cn/home/features/virtual-machines/
3. 弹性公网IP的操作指南：
   https://docs.azure.cn/zh-cn/virtual-network/virtual-network-public-ip-address
4. 在Azure上的安全应用：
   https://market.azure.cn/zh-cn/marketplace/apps/category/security-identity



#### Alibaba Cloud

1. 开通和使用阿里云 ECS
   https://help.aliyun.com/document_detail/25429.html?spm=a2c4g.11174283.6.623.38be52feLfrI8o
2. 创建管理云盘
   https://help.aliyun.com/document_detail/25429.html?spm=a2c4g.11186623.6.623.31953029KJqpeg#h2-url-3
3. 弹性公网IP的操作指南
   https://help.aliyun.com/document_detail/65203.html?spm=a2c4g.11186623.6.549.59cd76eedPoTf8
4. 阿里云DDOS防护说明
   https://help.aliyun.com/document_detail/28464.html?spm=a2c4g.11186623.6.607.49185817eZB1qR



#### JDCloud

1. 创建管理云主机
   https://docs.jdcloud.com/cn/virtual-machines/create-instance
2. 创建管理云硬盘
   https://docs.jdcloud.com/cn/cloud-disk-service/create-cloud-disk
3. 弹性公网IP的操作
   https://docs.jdcloud.com/cn/elastic-ip/create-elastic-ip
4. JDCloud DDOS基础防护操作
   https://docs.jdcloud.com/cn/anti-ddos-basic/protection-threshold-set





*Bottos基金会对本文内容拥有最终解释权





