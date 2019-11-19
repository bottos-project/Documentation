

## 1 Bottos简介

### 1.1. 项目介绍

Bottos 是聚焦于人工智能领域的基础设施，既有依据数据特性而专门设计的底层公链，又有服务于整个人工智能及其衍生产业的数据流转平台。通过数据挖矿和智能合约实现数据、模型、算力、存储多层级共享服务的基于共识的、可扩展的、易于开发的和可协同的一站式应用平台。

Bottos 可以被应用于大数据、人工智能，智能硬件、机器人、物联网，VR/AR 等领域。 简单来说，Bottos 不仅是人工智能公链，而且兼有数据和模型流转服务，实现基于数据喂养形成的人工智能及其衍生产业的价值流转，最终形成分布式 AI 新生态。

Bottos 基础公有链以服务人工智能产业而设计，其性能优势集中体现在数 据流转，以及算力、存储共享等方面，具有极强的产业属性。其原创技术特性包 括智能货币设计、抽签式 dPOS 算法和引入 AI 算法的分布式存储等，在数据隐私保护、超大数据存储等方面具有领先的竞争优势。

Bottos 基础服务链旨在打造去中心化的数据流转平台，解决人工智能训练数 据获取难的痛点，吸引人工智能及其衍生产业积极入驻平台。通过数据和模型确权，鼓励用户分享，加快交易流转。通过智能合约生命周期管理帮助 AI 及其衍 生产业消除信任成本、提高效率。

Bottos 应用开发层主要以 DApps 为主，其中分为三类:人工智能类、人工智能衍生类、区块链技术服务类。区块链技术类诸如闪电网络、Oralce、侧链、 跨链等，以完善 Bottos 生态为主，随着区块链技术的迭代而不断新增;人工智能类 DApps 以单纯软件为代表，以数据喂养后模型迭代升级为特点; 人工智能衍生类 DApps 包括以软硬结合为代表的智能硬件、物联网、机器人等，通过硬件对新的数据进行收集，是 AI 数据的来源渠道。这些 DApps 彼此之间构成数据的需求闭环，最终可形成全球规模的数据集合池，同时 DApps 的智能模块之间也存在需求，通过区块链技术形成需求映射，最终也会形成庞大的模块集合池。](./resource_cn/项目介绍.md)

### 1.2. 系统架构

Bottos 是聚焦于人工智能领域的基础设施，既有依据数据特性而专门设计的底层公链，又有服务于整个人工智能及其衍生产业的数据流转平台。Bottos 的数据流转是基于区块链技术的全球最大数据集合池，解决人工智能(AI)行业优 质数据获取难的痛点，独创智能数据入股合约，用数据挖矿方式实现个人数据财富共享，在个人数据和 AI 模型之间建立价值联系。

因此，在Bottos系统设计时采用了分层架构的方式，便于系统的动态扩展和灵活部署。总体分为三层，如下：

核心层： Chainbase层，提供区块链基础的链服务，构建信任公链基础结构，实现区块链基本功能；

服务层： 基于Chainbase 提供基于铂链开发的基础服务，例如提供分布式身份服务、分布式存储、合约以及Token管理服务等，实现快速的Dapp开发；

应用层： 基于Bottos开发的各种应用集合。

本文目前主要介绍如何使用Core Layer即区块链基础服务，提供相应开发接口和使用案例，提供钱包基本接口和方式。

Bottos系统的总体技术框架如下图所示：

![](./common/BottosArchitecture.png)

### 1.3. 网络结构

#### 1.3.1 网络整体

Bottos网络中的典型角色有三种：
- 终端用户
- 终端用户接入服务的提供者
- 超级节点（区块生产者）

&nbsp;

这三类角色将Bottos网络分成了三层，如下图所示。分别是
- 终端用户所在的接入层，这些终端用户有可能形成的终端网络
- 接入服务的提供者节点之间形成的服务层
- 超级节点之间组成的生产者网络

&nbsp;
&nbsp;
![](./common/net_hierarchy.png)


&nbsp;
&nbsp;
#### 1.3.2 超级节点网络

超级节点承担全网所有Transaction的执行和记录，是全网络稳定的基础，因此铂链在超级节点网络设计采用了全连接方式组网。如下图所示（以10个超级节点的全连接为例。实际的超级节点个数为49个，其中每轮选中29个出块，另外20个节点备选）

![](./common/fullmesh.png)

&nbsp;
&nbsp;

#### 1.3.3 其它节点与超级节点的连接图

除超级节点外的其它类型节点，是组织松散的网络，类似下图中的mesh结构的连接方式

![](./common/mesh.png)
&nbsp;

#### 1.3.4 节点简介

Bottos节点分为基础服务节点、应用型节点、轻型节点、超轻型节点，各节点间彼此制衡和互补，形成动态平衡的节点自洽系统。

- **基础服务节点**
```
基础服务节点提供整个Bottos区块链系统的基础服务，除了支持区块链核心的交易共识、合约部署、区块生产等核心功能外，同时支持Bottos服务层提供的主体功能，如统一身份系统、存储管理服务、信用服务、Token管理以及合约管理等主要功能，为整体Bottos网络提供最主要的生产服务。
```

- **应用型节点**
```
应用型节点主要为生态系统中不同的DApps部署进行服务，应用型节点可以是自己部署，也可以部署在基础节点。（未来部署基础节点的逻辑App应用可以收取一定的部署门槛费用）。
```

- **轻型节点**
```
轻型节点主要作为Bottos的数据验证节点，不提供服务层相应的功能，仅进行区块数据同步等功能，可以支持Bottos核心层基本服务。
```

- **超轻型节点**
```
超轻型节点主要处理区块相关头验证，同步关键HASH数据等。
```

## 2 Bottos单节点部署

### 2.1 docker

详见 3.1 一键docker容器部署，在使用makeDockerComposeYml.sh 构建 docker-compose.yml时，将delegateNum参数设为1，即为单节点部署。

### 2.2 VM 

#### 2.2.1 下载运行程序

**准备Bottos Chain可执行程序**

------

##### 2.2.1.1 下载已发布版本（推荐）

> [Bottos Chain发布的Release版本](https://github.com/bottos-project/bottos/releases)  的路径为  https://github.com/bottos-project/bottos/releases

##### 2.2.1.2 下载源码并编译版本

**准备编译环境**

1. Golang语言环境安装

> [Golang语言环境安装](https://github.com/bottos-project/Documentation/blob/master/resource_cn/Golang%E8%AF%AD%E8%A8%80%E7%8E%AF%E5%A2%83%E5%AE%89%E8%A3%85.md)

2. MinGW程序安装(Windows ONLY)

> 相应程序可以在 [MinGW官网地址](http://www.mingw.org/ )下载，要求不低于MinGW 8.1.0版本。

**下载源码**

> [Bottos Chain源码](https://github.com/bottos-project/bottos)  的路径为  https://github.com/bottos-project/bottos

**编译源码**

Linux环境编译(Ubuntu/MacOS)

- 编译bottos链可执行文件。
```
    user:bottos user$ make bottos
    build/vmlib.sh
    build/bottos.sh
    go build
    Done building.
    Run "./bottos --help" for help.
```
- 编译bcli人机命令可执行文件。
```
    user:bottos user$ make bcli
    build/bcli.sh go install
    Done building.
    Run "build/bin/bcli" to launch command line tool.
```
- 编译wallet钱包可执行文件。
```
    user:bottos user$ make wallet
    build/wallet.sh go install
    Done building.
    Run "build/bin/wallet" to launch wallet.
```
- 一次编译所有可执行文件，可以执行make all或者使用makeall.sh脚本。
```
    user:bottos user$ make all
    build/vmlib.sh
    build/bottos.sh
    go build
    Done building.
    Run "./bottos --help" for help.
    build/bcli.sh go install
    Done building.
    Run "build/bin/bcli" to launch command line tool.
    build/wallet.sh go install
    Done building.
    Run "build/bin/wallet" to launch wallet.
```

Windows环境编译


执行源码根目录下的 makeall.sh 脚本，将会在当前目录生成 bottos 可执行文件，以及在build/bin目录下生成人机命令bcli和钱包wallet可执行程序，如下图：

![](./common/windows_compile.png)

#### 2.2.2   准备节点启动配置文件

**单节点开发环境**

单节点作为独立节点运行和部署，主要用于开发者验证和简单测试自己的业务功能。下文将为用户介绍如何部署一个单节点环境。

**修改配置文件 config.toml**

进入版本包文件夹后:

1  产生一对公私钥

```
./bcli wallet generatekey
public_key: 046607760d95319d4dbe26751c15f75d9154dd564aaff8a5346207cda90fc1b7f6f62f0f7382e964b18a1f3f3b7c6b7b212c63959d1e0ab2b51a4f122b0089e9e4
private_key: 1b936c16e85cb2a7db8f6c15609ab1466f3e6ccdde0577bf0448b0fa387db460
```

此命令执行后，得到的public_key和private_key值将被使用于下一步填写配置参数。

2 打开config.toml文件，修改红色部分

[Node]

DataDir = "./datadir"

[Rest]

RESTPort = 8689

RESTHost = "localhost"

[P2P]

P2PPort = 9868

P2PServAddr =  "192.168.1.1"

PeerList = []

P2PAuthRequried = false

P2PAuthKeyList = []

MaxPeer = 60

[Delegate]

Solo = true

[Delegate.Signature]

Type = "key"

PrivateKey = <font color=#DC143C face="黑体">"XXX"</font> -> 把第1步生成的private_key值对应填写到此处（引号也需要）

PublicKey = <font color=#DC143C face="黑体">"YYY"</font> -> 把第1步生成的public_key值对应填写到此处（引号也需要）

URL = <font color=#DC143C face="黑体">""</font> ->去掉引号内的内容

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

**启动节点**

单节点启动，直接按以下命令行启动。

./bottos --delegate bottos --enable-wallet &

节点启动后，过一会会发现程序打印bottos开始生产出块，则说明节点启动成功。同步块打印如下提供参考。

InsertBlock, number:1552, time:2018-12-18 10:06:18, delegate:<font color=#DC143C face="黑体">bottos</font>, trxn:0, hash:7664063509a4a813f2fa06a929f11a36ba66184e036dfe7c49937a28d5328050, prevHash:98f4567dbcd6dfd8c0bc7ce4f24ee96f2d3476691088e08475ae56bb62d6afd3, version:3.4.0
InsertBlock, number:1553, time:2018-12-18 10:06:21, delegate:<font color=#DC143C face="黑体">bottos</font>, trxn:0, hash:cbef8f392a17cfdf58587b263f22cb844e7dd534336fb2f3b99ca5d9276466d6, prevHash:7664063509a4a813f2fa06a929f11a36ba66184e036dfe7c49937a28d5328050, version:3.4.0
InsertBlock, number:1554, time:2018-12-18 10:06:27, delegate:<font color=#DC143C face="黑体">bottos</font>, trxn:0, hash:ea88602bf0ad960172357403a6626df0a4b19443b5fd665561ce82dcb4e95792, prevHash:cbef8f392a17cfdf58587b263f22cb844e7dd534336fb2f3b99ca5d9276466d6, version:3.4.0
InsertBlock, number:1555, time:2018-12-18 10:06:30, delegate:<font color=#DC143C face="黑体">bottos</font>, trxn:0, hash:97f630674cbc165b168196421b3817710047c886f64dc208f0f8fc380361425a, prevHash:ea88602bf0ad960172357403a6626df0a4b19443b5fd665561ce82dcb4e95792, version:3.4.0
InsertBlock, number:1556, time:2018-12-18 10:06:33, delegate:<font color=#DC143C face="黑体">bottos</font>, trxn:0, hash:ddf178d67791dc599495e3b4671b20054b725c3b707b81d32e57f4d0967196d9, prevHash:97f630674cbc165b168196421b3817710047c886f64dc208f0f8fc380361425a, version:3.4.0
InsertBlock, number:1557, time:2018-12-18 10:06:39, delegate:<font color=#DC143C face="黑体">bottos</font>, trxn:0, hash:ff6b472b91d578239b17f62c2332ce150b30e9a7a3a3056dac142774a412fa49

也可使用 ./bcli getblkheader查看最新块信息，只要块号(head_block_num)增长，说明节点启动和块同步已经开始顺利进行。
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

**关闭节点**

关闭节点，采用kill方式关闭即可。

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

**LOG信息的查看**

对于过程遇到问题的，可以查看版本包目录下产生的datadir/log/bottos.log，查看是否有新的ERR LOG信息产生。

## 3 快速多节点部署

### 3.1 一键docker容器部署 

#### 3.1.1 从 Docker Hub 拉取部署镜像

**在使用以下命令进行部署之前，请确保您在Linux系统上已正确安装docker。**

创建部署目录，在该目录下执行

```shell
docker pull yaoya12345/bottos:v1.2
```

成功进行拉取应该到如下打印

```
v1.0: Pulling from yaoya12345/bottos
6abc03819f3e: Pull complete 
05731e63f211: Pull complete 
0bd67c50d6be: Pull complete 
60f006920332: Pull complete 
3c4715f274c4: Pull complete 
67fd3e8b357b: Pull complete 
febf2caf84b0: Pull complete 
Digest: sha256:d68cdaa4f78bfa1c24dc3d642577252f0ab34851ebc0b5badc18cc6d644c1020
Status: Downloaded newer image for yaoya12345/bottos:v1.0
```

拉取完成后，查看是否存在本镜像，使用命令

```
docker images
```

如果出现如下打印，表示已成功拉取

```
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
yaoya12345/bottos       v1.0                14daca277442        22 hours ago        396MB
```

#### 3.1.2 从Github下载脚本文件

从[Github](https://github.com/bottos-project/Documentation/tree/master/deploy/docker)下载脚本文件 makeDockerComposeYml.sh，并将下载的文件放到部署目录下。

在部署目录下使用 makeDockerComposeYml.sh 构建 docker-compose.yml

```
./makeDockerComposeYml.sh --delegateNum=$DELEGATE_NODE_NUM --mongodb=true|false --image=$IMAGE_NAME
```

**上述命令参数解释：**

delegateNum 表示出块节点个数，一般为29

mongodb 值一般为 true 或 false，表示是否开启mongodb

image 参数指定使用的镜像名，本例里为 yaoya12345/bottos

构建成功将显示如下打印

```
current in ${yourdeploypath}
build done!
```

#### 3.1.3 创建并启动容器

**启动过程需要足够的内存和硬盘空间，如果您是在虚拟机环境下运行，请确保您的虚拟机有至少4G内存空间，以及docker配置的存储路径拥有30G硬盘空间。**

在部署目录下，使用如下命令创建并启动容器

```
docker-compose up -d
```

随后出现如下打印，表示正在创建并启动

```
Creating network "dockerbottos_bottos_private" with the default driver
Creating genesis     ... done
Creating delegatep14 ... done
Creating delegatep20 ... done
Creating delegatep13 ... done
Creating delegatep9  ... done
Creating delegatep11 ... done
Creating delegatep29 ... done
Creating delegatep28 ... done
Creating delegatep8  ... done
Creating delegatep27 ... done
Creating delegatep15 ... done
Creating delegatep25 ... done
Creating delegatep19 ... done
Creating delegatep5  ... done
Creating delegatep3  ... done
Creating delegatep16 ... done
Creating delegatep2  ... done
Creating delegatep4  ... done
Creating delegatep26 ... done
Creating delegatep24 ... done
Creating delegatep22 ... done
Creating delegatep1  ... done
Creating delegatep23 ... done
Creating delegatep18 ... done
Creating delegatep12 ... done
Creating delegatep21 ... done
Creating delegatep7  ... done
Creating delegatep10 ... done
Creating delegatep17 ... done
Creating delegatep6  ... done
```

需要等待30个节点（包含genesis节点）全都打印出 done

查看所有节点是否正常启动

```
docker-compose ps
```

```
delegatep1    /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16879->6869/tcp, 0.0.0.0:16880->6870/tcp, 0.0.0.0:18699->8689/tcp, 0.0.0.0:19878->9868/tcp
delegatep10   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16969->6869/tcp, 0.0.0.0:16970->6870/tcp, 0.0.0.0:18789->8689/tcp, 0.0.0.0:19968->9868/tcp
delegatep11   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16979->6869/tcp, 0.0.0.0:16980->6870/tcp, 0.0.0.0:18799->8689/tcp, 0.0.0.0:19978->9868/tcp
delegatep12   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16989->6869/tcp, 0.0.0.0:16990->6870/tcp, 0.0.0.0:18809->8689/tcp, 0.0.0.0:19988->9868/tcp
delegatep13   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16999->6869/tcp, 0.0.0.0:17000->6870/tcp, 0.0.0.0:18819->8689/tcp, 0.0.0.0:19998->9868/tcp
delegatep14   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17009->6869/tcp, 0.0.0.0:17010->6870/tcp, 0.0.0.0:18829->8689/tcp, 0.0.0.0:20008->9868/tcp
delegatep15   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17019->6869/tcp, 0.0.0.0:17020->6870/tcp, 0.0.0.0:18839->8689/tcp, 0.0.0.0:20018->9868/tcp
delegatep16   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17029->6869/tcp, 0.0.0.0:17030->6870/tcp, 0.0.0.0:18849->8689/tcp, 0.0.0.0:20028->9868/tcp
delegatep17   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17039->6869/tcp, 0.0.0.0:17040->6870/tcp, 0.0.0.0:18859->8689/tcp, 0.0.0.0:20038->9868/tcp
delegatep18   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17049->6869/tcp, 0.0.0.0:17050->6870/tcp, 0.0.0.0:18869->8689/tcp, 0.0.0.0:20048->9868/tcp
delegatep19   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17059->6869/tcp, 0.0.0.0:17060->6870/tcp, 0.0.0.0:18879->8689/tcp, 0.0.0.0:20058->9868/tcp
delegatep2    /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16889->6869/tcp, 0.0.0.0:16890->6870/tcp, 0.0.0.0:18709->8689/tcp, 0.0.0.0:19888->9868/tcp
delegatep20   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17069->6869/tcp, 0.0.0.0:17070->6870/tcp, 0.0.0.0:18889->8689/tcp, 0.0.0.0:20068->9868/tcp
delegatep21   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17079->6869/tcp, 0.0.0.0:17080->6870/tcp, 0.0.0.0:18899->8689/tcp, 0.0.0.0:20078->9868/tcp
delegatep22   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17089->6869/tcp, 0.0.0.0:17090->6870/tcp, 0.0.0.0:18909->8689/tcp, 0.0.0.0:20088->9868/tcp
delegatep23   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17099->6869/tcp, 0.0.0.0:17100->6870/tcp, 0.0.0.0:18919->8689/tcp, 0.0.0.0:20098->9868/tcp
delegatep24   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17109->6869/tcp, 0.0.0.0:17110->6870/tcp, 0.0.0.0:18929->8689/tcp, 0.0.0.0:20108->9868/tcp
delegatep25   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17119->6869/tcp, 0.0.0.0:17120->6870/tcp, 0.0.0.0:18939->8689/tcp, 0.0.0.0:20118->9868/tcp
delegatep26   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17129->6869/tcp, 0.0.0.0:17130->6870/tcp, 0.0.0.0:18949->8689/tcp, 0.0.0.0:20128->9868/tcp
delegatep27   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17139->6869/tcp, 0.0.0.0:17140->6870/tcp, 0.0.0.0:18959->8689/tcp, 0.0.0.0:20138->9868/tcp
delegatep28   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17149->6869/tcp, 0.0.0.0:17150->6870/tcp, 0.0.0.0:18969->8689/tcp, 0.0.0.0:20148->9868/tcp
delegatep29   /Bottos/scripts/entrypoint ...   Up      0.0.0.0:17159->6869/tcp, 0.0.0.0:17160->6870/tcp, 0.0.0.0:18979->8689/tcp, 0.0.0.0:20158->9868/tcp
delegatep3    /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16899->6869/tcp, 0.0.0.0:16900->6870/tcp, 0.0.0.0:18719->8689/tcp, 0.0.0.0:19898->9868/tcp
delegatep4    /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16909->6869/tcp, 0.0.0.0:16910->6870/tcp, 0.0.0.0:18729->8689/tcp, 0.0.0.0:19908->9868/tcp
delegatep5    /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16919->6869/tcp, 0.0.0.0:16920->6870/tcp, 0.0.0.0:18739->8689/tcp, 0.0.0.0:19918->9868/tcp
delegatep6    /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16929->6869/tcp, 0.0.0.0:16930->6870/tcp, 0.0.0.0:18749->8689/tcp, 0.0.0.0:19928->9868/tcp
delegatep7    /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16939->6869/tcp, 0.0.0.0:16940->6870/tcp, 0.0.0.0:18759->8689/tcp, 0.0.0.0:19938->9868/tcp
delegatep8    /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16949->6869/tcp, 0.0.0.0:16950->6870/tcp, 0.0.0.0:18769->8689/tcp, 0.0.0.0:19948->9868/tcp
delegatep9    /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16959->6869/tcp, 0.0.0.0:16960->6870/tcp, 0.0.0.0:18779->8689/tcp, 0.0.0.0:19958->9868/tcp
genesis       /Bottos/scripts/entrypoint ...   Up      0.0.0.0:16869->6869/tcp, 0.0.0.0:16870->6870/tcp, 0.0.0.0:18689->8689/tcp, 0.0.0.0:19868->9868/tcp
```

全都显示为up，表示已正常启动。需要等待genesis节点初始化其他所有生产节点（大约3-5分钟），初始化完成之后，genesis会移交出块权力，之后生产节点开始轮流出块，启动完成。

可使用如下命令查看节点日志，例如查看创世节点日志

```
docker-compose logs genesis
```

```
Attaching to genesis
genesis        | 2019-07-05T08:22:56 starting new wallet
genesis        | 2019-07-05T08:22:56 wait for wallet launched, retry:0
genesis        | 2019-07-05T08:22:57 wallet launched successfully!
genesis        | 2019-07-05T08:22:57 start create wallet for account:bottos type:genesis
genesis        | 2019-07-05T08:22:58 {"errcode":0,"msg":"success","result":{"wallet_name":"bottos.keystore"}}
genesis        | 2019-07-05T08:22:58 create wallet for bottos successfully
genesis        | 2019-07-05T08:22:58 kill wallet: 53
genesis        | /Bottos/scripts/createNewKey.sh: line 5:    53 Terminated              nohup ./wallet --wallet-servaddr $host --port $port > $LOGDIR"nohup_wallet.log" 2>&1
genesis        | 2019-07-05T08:22:58 /root/bot/bottos.keystore generated successfully!
genesis        | 2019-07-05T08:22:58 starting new wallet
genesis        | 2019-07-05T08:22:58 wallet launched successfully!
genesis        | 2019-07-05T08:22:58 NOT found existing config and genesis file, generate new
genesis        | 2019-07-05T08:22:58 share genesis to /Bottos/sharedData/
genesis        | 2019-07-05T08:22:58 start unlock wallet for bottos
genesis        | 2019-07-05T08:22:59 {"errcode":0,"msg":"success","result":{"unlock":true}}
genesis        | 2019-07-05T08:22:59 unlock bottos successfully
genesis        | 2019-07-05T08:22:59 start node
genesis        | 2019-07-05T08:22:59 0:waiting for genesis node completely launch, headBlockNum:
genesis        | 2019-07-05T08:23:00 1:waiting for genesis node completely launch, headBlockNum:1
genesis        | 2019-07-05T08:23:01 2:waiting for genesis node completely launch, headBlockNum:1
genesis        | 2019-07-05T08:23:02 3:waiting for genesis node completely launch, headBlockNum:1
genesis        | 2019-07-05T08:23:03 4:waiting for genesis node completely launch, headBlockNum:2
genesis        | 2019-07-05T08:23:03 node launched successfully!

```



启动后，在部署目录下会生成Bottos_data文件夹，保存每个节点的配置文件，日志等文件。

随意选择一个节点，查看其日志文件判断是否正常出块，本例选择出块节点22

```
cd Bottos_data/delegatep22/log
cat nohup_bottos.log
```

出现如下打印，可发现出块节点已正常出块，部署启动成功

```
PreCommitBlock, number:312, time:2019-07-05 08:38:51, delegate:delegatep22, trxn:0, hash:ab8cf6370b82f01a5770f4beee04baebebec16bd1d991f4a452d015083663b28, prevHash:de91948b1b4afc3441b0a7f85af4211171252081e72bbb887caa33dbda4637ce
CommitBlock, number:312, time:2019-07-05 08:38:51, delegate:delegatep22, trxn:0, hash:ab8cf6370b82f01a5770f4beee04baebebec16bd1d991f4a452d015083663b28, prevHash:de91948b1b4afc3441b0a7f85af4211171252081e72bbb887caa33dbda4637ce, version:1.0.0
PreCommitBlock, number:313, time:2019-07-05 08:38:54, delegate:delegatep8, trxn:0, hash:d1cb1cedd504a2031b64deb8fb1b93c08f80c2c64dbfbb1903f95f05bf48e50e, prevHash:ab8cf6370b82f01a5770f4beee04baebebec16bd1d991f4a452d015083663b28
CommitBlock, number:313, time:2019-07-05 08:38:54, delegate:delegatep8, trxn:0, hash:d1cb1cedd504a2031b64deb8fb1b93c08f80c2c64dbfbb1903f95f05bf48e50e, prevHash:ab8cf6370b82f01a5770f4beee04baebebec16bd1d991f4a452d015083663b28, version:1.0.0
PreCommitBlock, number:314, time:2019-07-05 08:38:57, delegate:delegatep11, trxn:0, hash:53a6a79c4bdc924690d5b66c3dcbc7a59b84d4622975608d470294eee7cff652, prevHash:d1cb1cedd504a2031b64deb8fb1b93c08f80c2c64dbfbb1903f95f05bf48e50e
CommitBlock, number:314, time:2019-07-05 08:38:57, delegate:delegatep11, trxn:0, hash:53a6a79c4bdc924690d5b66c3dcbc7a59b84d4622975608d470294eee7cff652, prevHash:d1cb1cedd504a2031b64deb8fb1b93c08f80c2c64dbfbb1903f95f05bf48e50e, version:1.0.0
PreCommitBlock, number:315, time:2019-07-05 08:39:00, delegate:delegatep13, trxn:0, hash:a96de6b48104e60531c3f60d62fa8262ec967435add0af7811b75df630277847, prevHash:53a6a79c4bdc924690d5b66c3dcbc7a59b84d4622975608d470294eee7cff652
CommitBlock, number:315, time:2019-07-05 08:39:00, delegate:delegatep13, trxn:0, hash:a96de6b48104e60531c3f60d62fa8262ec967435add0af7811b75df630277847, prevHash:53a6a79c4bdc924690d5b66c3dcbc7a59b84d4622975608d470294eee7cff652, version:1.0.0
PreCommitBlock, number:316, time:2019-07-05 08:39:06, delegate:delegatep14, trxn:0, hash:b2ccdc424d3254e3215e3f50d9f3d4f083c28ff7324dc360de28258330fdcf4a, prevHash:a96de6b48104e60531c3f60d62fa8262ec967435add0af7811b75df630277847
CommitBlock, number:316, time:2019-07-05 08:39:06, delegate:delegatep14, trxn:0, hash:b2ccdc424d3254e3215e3f50d9f3d4f083c28ff7324dc360de28258330fdcf4a, prevHash:a96de6b48104e60531c3f60d62fa8262ec967435add0af7811b75df630277847, version:1.0.0
PreCommitBlock, number:317, time:2019-07-05 08:39:09, delegate:delegatep10, trxn:0, hash:9367270c4394d6c1d393528fe0534edce480ce3f5a070156afa3ba568a7de32c, prevHash:b2ccdc424d3254e3215e3f50d9f3d4f083c28ff7324dc360de28258330fdcf4a
CommitBlock, number:317, time:2019-07-05 08:39:09, delegate:delegatep10, trxn:0, hash:9367270c4394d6c1d393528fe0534edce480ce3f5a070156afa3ba568a7de32c, prevHash:b2ccdc424d3254e3215e3f50d9f3d4f083c28ff7324dc360de28258330fdcf4a, version:1.0.0
PreCommitBlock, number:318, time:2019-07-05 08:39:12, delegate:delegatep5, trxn:0, hash:521631edff1a26aeb21effdc9cb61882f027da5cfaedf7c6339a3340c4b142de, prevHash:9367270c4394d6c1d393528fe0534edce480ce3f5a070156afa3ba568a7de32c
CommitBlock, number:318, time:2019-07-05 08:39:12, delegate:delegatep5, trxn:0, hash:521631edff1a26aeb21effdc9cb61882f027da5cfaedf7c6339a3340c4b142de, prevHash:9367270c4394d6c1d393528fe0534edce480ce3f5a070156afa3ba568a7de32c, version:1.0.0
PreCommitBlock, number:319, time:2019-07-05 08:39:15, delegate:delegatep4, trxn:0, hash:da5774f1bded5fdc1f9c2ce90a346b001dca4b226a61c3b14b83dfba1b556ed0, prevHash:521631edff1a26aeb21effdc9cb61882f027da5cfaedf7c6339a3340c4b142de
CommitBlock, number:319, time:2019-07-05 08:39:15, delegate:delegatep4, trxn:0, hash:da5774f1bded5fdc1f9c2ce90a346b001dca4b226a61c3b14b83dfba1b556ed0, prevHash:521631edff1a26aeb21effdc9cb61882f027da5cfaedf7c6339a3340c4b142de, version:1.0.0
PreCommitBlock, number:320, time:2019-07-05 08:39:18, delegate:delegatep13, trxn:0, hash:c2d8be688cef912f05ef439a8539032791467cadab57f916aa18f568f14ceb3b, prevHash:da5774f1bded5fdc1f9c2ce90a346b001dca4b226a61c3b14b83dfba1b556ed0
CommitBlock, number:320, time:2019-07-05 08:39:18, delegate:delegatep13, trxn:0, hash:c2d8be688cef912f05ef439a8539032791467cadab57f916aa18f568f14ceb3b, prevHash:da5774f1bded5fdc1f9c2ce90a346b001dca4b226a61c3b14b83dfba1b556ed0, version:1.0.0
PreCommitBlock, number:321, time:2019-07-05 08:39:21, delegate:delegatep26, trxn:0, hash:43bec52d4e1479be85b6bd58bed92470b2aecd158abd94a87ac3adcddb936701, prevHash:c2d8be688cef912f05ef439a8539032791467cadab57f916aa18f568f14ceb3b
CommitBlock, number:321, time:2019-07-05 08:39:21, delegate:delegatep26, trxn:0, hash:43bec52d4e1479be85b6bd58bed92470b2aecd158abd94a87ac3adcddb936701, prevHash:c2d8be688cef912f05ef439a8539032791467cadab57f916aa18f568f14ceb3b, version:1.0.0
PreCommitBlock, number:322, time:2019-07-05 08:39:24, delegate:delegatep16, trxn:0, hash:b3c8b9b3cd4bd7806af2c45ba77a9a3f60ccf208d7be93b7b8b2182e5b813f0a, prevHash:43bec52d4e1479be85b6bd58bed92470b2aecd158abd94a87ac3adcddb936701
CommitBlock, number:322, time:2019-07-05 08:39:24, delegate:delegatep16, trxn:0, hash:b3c8b9b3cd4bd7806af2c45ba77a9a3f60ccf208d7be93b7b8b2182e5b813f0a, prevHash:43bec52d4e1479be85b6bd58bed92470b2aecd158abd94a87ac3adcddb936701, version:1.0.0
PreCommitBlock, number:323, time:2019-07-05 08:39:27, delegate:delegatep8, trxn:0, hash:820dae1481e193078a86bfe110f3750dceee0f400d74424ac93bc598bb550e38, prevHash:b3c8b9b3cd4bd7806af2c45ba77a9a3f60ccf208d7be93b7b8b2182e5b813f0a
CommitBlock, number:323, time:2019-07-05 08:39:27, delegate:delegatep8, trxn:0, hash:820dae1481e193078a86bfe110f3750dceee0f400d74424ac93bc598bb550e38, prevHash:b3c8b9b3cd4bd7806af2c45ba77a9a3f60ccf208d7be93b7b8b2182e5b813f0a, version:1.0.0
PreCommitBlock, number:324, time:2019-07-05 08:39:30, delegate:delegatep17, trxn:0, hash:1eca2eb82af0b54c8c0d4f9ec3d687e7c90bbc3b9a843a84928906d70c09d298, prevHash:820dae1481e193078a86bfe110f3750dceee0f400d74424ac93bc598bb550e38

```

管理容器基本指令

```
# 初始化
$ docker-compose up -d

# 停止
$ docker-compose stop

# 继续执行
$ docker-compose start

# 终止
$ docker-compose down
```

#### 

### 3.2 一键多VM部署

暂无

### 3.3 一键Kubernate部署

- 测试环境

  - 宿主机：
    - 操作系统：win10
    - 处理器：Intel Core i5-7200U CPU @ 2.50GHz 2.71GHz
    - 系统类型：64位操作系统，基于X64的处理器
    - 内存：16G
  - 虚拟机：
    - 虚拟工具：VMWare Workstation 15 Pro
    - 操作系统：Ubuntu 18.04.1
    - server01：
      - 处理器：2
      - 内存：4GB
      - 硬盘：25G
    - server02：
      - 处理器：2
      - 内存：5.8G
      - 硬盘：20G
    - server03：
      - 处理器：1
      - 内存：3.0G
      - 硬盘：20G

- kubernetes集群的搭建

  - 详见教程：https://blog.csdn.net/yaoya_2015/article/details/95461747

  - nfs服务器搭建好之后，需要更改./kubernetes/nfs-pv.yaml中的相关ip

    ```
    $ vim ./kubernetes/nfs-pv.yaml
    
      ...
      ...
      nfs:
        path: ...
        server: $YOUR_NFS_HOST_IP
    ```

- 启动

  ```
  # 1. 进入 ./kubernetes
  $ cd ./kubernetes
  
  # 2. 创建pv
  $ kubectl create -f ./nfs-pv.yaml
  
  # 3. 创建pvc
  $ kubectl create -f ./nfs-pvc.yaml
  
  # 4. 生成genesis-delegateX.yaml文件
  $ ./makeK8sYaml.sh --delegateNum=29 --mongodb=true --image=yaoya12345/bottos:v1.2
  
  # 5. 启动节点
  $ kubectl create -f ./genesis-delegateX.yaml
  ```

- 管理集群基本指令

  ```
  # 获取集群系统pod信息
  $ kubectl -n kube-system get pods
  
  # 查看集群信息
  $ kubectl cluster-info
  
  # 获取节点信息
  $ kubectl get nodes
  
  # 获取pod信息
  $ kubectl get pods
  
  # 获取service信息
  $ kubectl get svc
  
  # 查看pod运行log
  $ kubectl logs $POD_NAME
  ```

- 现在的策略：

  - k8s自动调度pod到相应的服务器上
  - 所有数据会持久化在nfs服务器上的 `/home/bottos/k8s/save_data/` 下

### 3.4 一键部署DApp

#### cpp智能合约自动部署工具

1. 必要信息写入配置文件
* 配置文件位置

    `
    $HOME/github.com/bottos-project/deploy/cpp_contract_deploy/config/deploy.config
    `

* 配置文件中选项说明

    * walletport=6869 # 钱包服务所用的端口
    * nodeurl=118.184.212.181:8689 # 节点服务的路径
    * account=irvingyao2019 # 部署用的账户
    * privkey=b2325c91a8b301635cbf80d5dbf11d50fe295ef1c885dbff41e7ebb159991bef # 部署用的账户对应的私钥
    * passwd=Bottos2019 # 部署用的账户对应本地钱包的密码
    * contractdir=/home/irving/irvingyao/bottos_contract/cpp/contract-tool-cpp/testDbSaveAndRead # 你的合约目录
    * cppfile=dbSaveRead.cpp # 合约目录下cpp文件的名字
    * hppfile=dbSaveRead.hpp # 合约目录下hpp文件的名字
    * contractname=testirving # 部署到链上的合约的名字


2. 执行部署脚本
* 部署脚本位置

    `
    $HOME/github.com/bottos-project/deploy/cpp_contract_deploy/tool/deploy.sh
    `

* 直接执行
    `
    cd ./contract-tool-cpp/too/ && ./deploy.sh
    `

## 4 DAPP开发手册 

### 4.1 下载并引入`sdk`库文件

下载并引入`bottos-sdk-js.min.js`库文件

`bottos-sdk-js.min.js`下载地址:https://github.com/bottos-project/bottos-sdk-js

### 4.2 创建基本的项目结构

```
/项目目录
    - index.html
    - index.js
    - bottos-sdk-js.min.js
```

- index.html

index.html中引入`index.js`和`bottos-sdk-js.min.js`，代码如下

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=375px, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Bottos Demo</title>
    <script src="./bottos-sdk-js.min.js"></script>
    <script src="./index.js"></script>
</head>
<body>
    <div style="margin-top:50px">
        <button style="width:100px;height:30px;background-color:coral" onClick="createAccount()">创建账户</button>
        <button style="width:100px;height:30px;background-color:coral" onClick="pushTransaction()">发布联系人</button>
        <button style="width:100px;height:30px;background-color:bisque" onClick="getTransaction()" >获取联系人</button>
    </div>


    <div style="margin-top:100px">
        <p>创建账户执行结果</p>
        <div id="createAccount" style="min-height:150px;background-color:#ccc">

        </div>
    
        <p>发布联系人执行结果</p>
        <div id="pushTransaction" style="min-height:150px;background-color:#ccc">
    
        </div>
    
        <p>获取联系人执行结果</p>
        <div id="getTransaction" style="min-height:150px;background-color:#ccc">
    
        </div>
    </div>
    
</body>
</html>


```

- index.js

`index.js`中实现智能合约在链上的写入与读取操作,代码如下

```
var BottosWalletSDK = window.BottosWalletSDK
const config = {
    baseUrl:'http://192.168.52.130:8689/v1',
    version:1
}
var SDK = new BottosWalletSDK(config)
var Tool = SDK.Tool
var Wallet = SDK.Wallet
var Contract = SDK.Contract
var Api = SDK.Api

let account = 'testaccount'
let password = 'testpassword'
let keystore = null

// 创建账户
function createAccount(){
    console.log("createAccount")
    let params = {account:account,password:password}
    Wallet.createAccount(params)
        .then(response=>{
            keystore = response
            document.getElementById('createAccount').innerHTML = JSON.stringify(response)
        }).catch(error=>{
            console.log({error})
            document.getElementById('createAccount').innerHTML = JSON.stringify(error)
            
        })
}

// 调用合约
function callContract(requestParam){
    let params = {
        method:'reguser',
        contract:'john',
        sender:account,
        param:{
            userName:'john',
            userInfo:JSON.stringify({phone:'110120',age:18})
        }
    }

    if(keystore == null){
        alert('请先创建账户')
        return
    }
    let privateKey = Wallet.recover(password,keystore)
    let privateKeyStr = Tool.buf2hex(privateKey)

    Contract.callContract(params,privateKeyStr)
        .then(response=>{
            console.log({response})
            document.getElementById('pushTransaction').innerHTML = JSON.stringify(response)
        }).catch(error=>{
            console.log({error})
            document.getElementById('pushTransaction').innerHTML = JSON.stringify(error)
        })
}

// 发布联系人
function pushTransaction(){
    console.log("pushTransaction")
    callContract()
}

// 读取联系人
function getTransaction(){
    console.log("getTransaction")
    // callContract()
    let url =  config.baseUrl + '/common/query'
    let params = {
        contract:'john',
        object:'userreginfo',
        key:'john'

    }

    fetch(url,{
        method:'POST',
        body:JSON.stringify(params)
    }).then(function(response){return response.json()})   
    .then(function(response){
        document.getElementById('getTransaction').innerHTML = JSON.stringify(response)
    }).catch(function(error){
        document.getElementById('getTransaction').innerHTML = JSON.stringify(error)
    })
}
```

### 4.3 验证合约执行结果

- 首先创建一个账户

点击`创建账户`,如果返回如下结构，说明账户创建成功，该返回值为用户的`keystore`文件，需要安全保存

```
{"account":"testaccount","crypto":{"cipher":"aes-128-ctr","ciphertext":"4cd010eba51ff45d9a752f38d64a4def7697a142570253cc381afa2b04288e68","cipherparams":{"iv":"46b469bb1c87751852857114b928e6ad"},"mac":"04051cce0379362c28d8027a19c8b79f03621602c2eff68d8b793f94ae6f58fb","kdf":"scrypt","kdfparams":{"dklen":32,"n":1024,"r":1,"p":8,"salt":"cf9dbed2413764c640018b9fccb6629ed38dad72b333c7d12e89994523ec7857"}},"id":"48a923c2-1c40-46aa-b0c1-8f24d8e1bc81","version":3}
```

- 执行写入合约

点击`发布联系人`按钮，如果返回如下结果，说明写入合约执行成功

```
{"errcode":0,"msg":"trx receive succ","result":{"trx":{"version":1,"cursor_num":286,"cursor_label":423110953,"lifetime":1537498176,"sender":"testaccount","contract":"john","method":"reguser","param":"dc0002da00046a6f686eda001b7b2270686f6e65223a22313130313230222c22616765223a31387d","sig_alg":1,"signature":"4149cb35eab48415082081aee0ab3766b7a6730b1a2213c96638540227a8616f17cdf773ba90e3c515183c3fc5631fa53b65dcf93eed320d53ec78a672738675"},"trx_hash":"eb79dc2d8a8461451ea55257fcbaa5897a9b9732e7cc3b0c8a8322ab4909789b"}}
```

- 执行读取合约

点击`读取联系人`按钮，如果返回如下结果，说明读取合约执行成功

```
{"errcode":0,"msg":"success","result":{"contract":"john","object":"userreginfo","key":"john","value":"dc0001da001b7b2270686f6e65223a22313130313230222c22616765223a31387d"}}
```

至此，我们一个简单而又完整的DApp就已经开发完成，如果想要开发一个更加强大的DApp可以查看详细的接口文档

## 5 开发工具链

### 5.1 插件钱包

### 5.2 移动端钱包接口 

### 5.3 RPC API接口 
#### 5.3.1 区块相关

**获取区块高度信息**

**接口功能**

> 接口说明： 获取区块高度信息
>
> **接口地址**
>
> URL:  /v1/block/height
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> GET
>
> **请求参数：**
>
> | 参数 | 必选 | 类型 | 默认值 | 说明 |
> | ---- | ---- | ---- | ------ | ---- |
> | 无   |      |      |        |      |

**响应字段：**

| 参数                     | 类型       | 说明                                     |
| ------------------------ | ---------- | ---------------------------------------- |
| errcode                  | uint32     | 错误码，0-相应成功，其他见错误码章节     |
| msg                      | string     | 响应描述                                 |
| result                   | jsonObject | 响应结果                                 |
| head_block_num           | uint64     | 块号                                     |
| head_block_hash          | string     | 前一块哈希值                             |
| head_block_time          | uint64     | 块生成时间                               |
| head_block_delegate      | string     | 块生产者                                 |
| cursor_label             | uint32     | 块标识                                   |
| last_consensus_block_num | uint64     | 不可逆块号                               |
| chain_id                 | string     | 链ID，同一链的所有节点的Chain_id必须相同 |
| head_block_version       | uint64     | 链版本号                                 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/block/height>

- 请求：



```
  无
```

- 响应：



```
  HTTP/1.1 200 OK
  {
    "errcode": 0,
    "msg": "success",
    "result": {
        "head_block_num": 1487,
        "head_block_hash": "5a808e8562636d424f2daac463aa901ff758af95d223b6ccd113ac2368d6ffb1",
        "head_block_time": 1548324339,
        "head_block_delegate": "bottos",
        "cursor_label": 1758920625,
        "last_consensus_block_num": 1487,
        "chain_id": "4b97b92d2c78bcffe95ebd3067565c73a2931b39d5eb7234b11816dcec54761a",
        "head_block_version": 65536
    }
}
```



**获取区块信息**

**接口功能**

> 接口说明： 获取区块信息
>
> **接口地址**

> URL:  /v1/block/detail
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST
>
> **请求参数：**
>
> | 参数       | 必选  | 类型   | 默认值 | 说明     |
> | ---------- | ----- | ------ | ------ | -------- |
> | block_num  | FALSE | uint64 | 空     | 块号     |
> | block_hash | FALSE | string | 空     | 块哈希值 |

备注：block_num、block_hash 必须二选一，若都缺省，默认查询到的是 0 号块的信息。

**响应字段：**

| 参数               | 类型       | 说明                                                         |
| ------------------ | ---------- | ------------------------------------------------------------ |
| errcode            | uint32     | 错误码，0-相应成功，其他见错误码章节                         |
| msg                | string     | 响应描述                                                     |
| result             | jsonObject | 响应结果                                                     |
| block_num          | uint64     | 块号                                                         |
| prev_block_hash    | string     | 前一块哈希值                                                 |
| block_hash         | string     | 当前块哈希值                                                 |
| cursor_block_label | uint32     | 当前块标识                                                   |
| block_time         | uint64     | 块生成时间                                                   |
| trx_merkle_root    | string     | 默克尔根值，该块打包的所有交易的根哈希值                     |
| delegate           | string     | 生产者名称                                                   |
| delegate_sign      | string     | 生产者签名                                                   |
| ResourceReceipt    | jsonObject | 交易消耗资源情况                                             |
| account_name       | string     | 账户名称                                                     |
| space_token_cost   | uint64     | 交易所消耗的空间资源                                         |
| time_token_cost    | uint64     | 交易所消耗的时间资源                                         |
| trxs               | jsonArray  | 当前区块所打包的交易列表，具体见“查询交易信息”章节的响应字段，另加TrxHash |
| TrxHash            | string     | 交易HASH 值                                                  |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/block/detail>

- 请求：

  

  ```
  {
  	"block_num": 32,
  	"block_hash": "eeca4c8ee8410cf256d27e5e676f6ce395ebdffade431b52775bb20aa60b8929"
  }
  ```

- 响应：



```
  HTTP/1.1 200 OK
  
  {
        "errcode": 0,
        "msg": "success",
        "result": {
            "block_version": 65536,
            "prev_block_hash": "9bd0e41e6f4b3464f0240d3655e25bdc2bbefbda4e346d3971ab3ca7fd072c40",
            "block_num": 32,
            "block_hash": "eeca4c8ee8410cf256d27e5e676f6ce395ebdffade431b52775bb20aa60b8929",
            "cursor_block_label": 2785773865,
            "block_time": 1548319974,
            "trx_merkle_root": "0000000000000000000000000000000000000000000000000000000000000000",
            "delegate": "bottos",
            "delegate_sign": "9bf5f2f4cdce4bd9edc22a1856975d47877afb02b8cfaa335b11f9f3706e6fb7266679e20837154a54395ede7df34ff1f3aa805b613a8175e30efce32c21afb7",
            "trxs": null
        }
   }
```

#### 5.3.2 交易相关

**获取签名哈希-param已序列化**

**接口功能**

> 接口说明： 获取签名哈希
>
> **接口地址**
>
> URL:  /v1/transaction/getHashForSign
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型   | 默认值 | 说明                                            |
| -------- | ---- | ------ | ------ | ----------------------------------------------- |
| sender   | TRUE | string | 无     | 发送交易的账号名称                              |
| contract | TRUE | string | 无     | 合约名                                          |
| method   | TRUE | string | 无     | 合约方法名                                      |
| param    | TRUE | string | 无     | 业务结构数据，经bpl序列化后，转为十六进制字符串 |



**响应字段：**

| 参数       | 类型       | 说明                                                         |
| ---------- | ---------- | ------------------------------------------------------------ |
| errcode    | uint32     | 错误码，0-相应成功，其他见错误码章节                         |
| msg        | string     | 响应描述                                                     |
| result     | jsonObject | 响应结果                                                     |
| version    | uint32     | 链版本号                                                     |
| cursor_num | uint64     | 最新区块号，调用获取区块头获得                               |
| cursor_lab | uint32     | 最新区块标签，调用获取区块头获得                             |
| lifetime   | uint64     | 交易过期时间，调用获取区块头，加一定的延时                   |
| sender     | string     | 发送者                                                       |
| contract   | string     | 合约名称                                                     |
| method     | string     | 合约方法                                                     |
| param      | jsonObject | 业务参数                                                     |
| sig_alg    | uint32     | 签名算法                                                     |
| signature  | string     | 签名值，为保持结构完整，保留改字段，可调用 《钱包REST接口》中的 对HASH签名 接口获得该值 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/transaction/getHashForSign

- 请求：

  

  ```
  {
  	"sender": "bottos",
  	"contract": "bottos",
  	"method": "newaccount",
  	"param": "dc0002da000a626f74746f7374657374da008230343931363362623834633739393438316131633630616331323265393431663566306233653639346435326439626530613862316561343730666361636266323564623439306330336334376564356465393862653735623435376333383730386465376539653935653461306263653634356539633033353861386435393638"
  }
  ```

- 响应：

  

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "trx": {
              "version": 65536,
              "cursor_num": 942,
              "cursor_label": 431961988,
              "lifetime": 1558424134,
              "sender": "bottos",
              "contract": "bottos",
              "method": "newaccount",
              "param": "dc0002da000a626f74746f7374657374da008230343931363362623834633739393438316131633630616331323265393431663566306233653639346435326439626530613862316561343730666361636266323564623439306330336334376564356465393862653735623435376333383730386465376539653935653461306263653634356539633033353861386435393638",
              "sig_alg": 1,
              "signature": ""
          },
          "hash_for_sign": "ce3052ae25425b75d59670507481811f0310ee1348dea32723c6315d075539fd"
      }
  }
  ```

**获取签名哈希**

**接口功能**

> 接口说明： 获取签名哈希
>
> **接口地址**
>
> URL:  /v1/transaction/getHashForSign2
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型       | 默认值 | 说明                                                    |
| -------- | ---- | ---------- | ------ | ------------------------------------------------------- |
| sender   | TRUE | string     | 无     | 发送交易的账号名称                                      |
| contract | TRUE | string     | 无     | 合约名                                                  |
| method   | TRUE | string     | 无     | 合约方法名                                              |
| param    | TRUE | jsonObject | 无     | 业务结构数据，字段名称需与ABI文件中的fields结构字段相同 |



**响应字段：**

| 参数         | 类型       | 说明                                                         |
| ------------ | ---------- | ------------------------------------------------------------ |
| errcode      | uint32     | 错误码，0-相应成功，其他见错误码章节                         |
| msg          | string     | 响应描述                                                     |
| result       | jsonObject | 响应结果                                                     |
| version      | uint32     | 链版本号                                                     |
| cursor_num   | uint64     | 最新区块号，调用获取区块头获得                               |
| cursor_label | uint32     | 最新区块标签，调用获取区块头获得                             |
| lifetime     | uint64     | 交易过期时间，调用获取区块头，加一定的延时                   |
| sender       | string     | 发送者                                                       |
| contract     | string     | 合约名称                                                     |
| method       | string     | 合约方法                                                     |
| param        | jsonObject | 业务参数                                                     |
| sig_alg      | uint32     | 签名算法                                                     |
| signature    | string     | 签名值，为保持结构完整，保留改字段，可调用 《钱包REST接口》中的 对HASH签名 接口获得该值 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/transaction/getHashForSign2

- 请求：

  

  ```
  {
  	"sender": "bottos",
  	"contract": "bottos",
  	"method": "newaccount",
  	"param": {
  		"name": "bottostest13",
  		"pubkey": "0492876e897e53de5d6767c41ba11217163baadc063ecbca38d4a3717d6c7f139c6e2d747dc6542d38c3d12dab495e3fad778852395ad247c76e63121864597f62"
  	}
  }
  ```

- 响应：

  

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "trx": {
              "version": 65536,
              "cursor_num": 267,
              "cursor_label": 3781540239,
              "lifetime": 1558603054,
              "sender": "bottos",
              "contract": "bottos",
              "method": "newaccount",
              "param": "dc0002da000c626f74746f73746573743133da008230343932383736653839376535336465356436373637633431626131313231373136336261616463303633656362636133386434613337313764366337663133396336653264373437646336353432643338633364313264616234393565336661643737383835323339356164323437633736653633313231383634353937663632",
              "sig_alg": 1,
              "signature": ""
          },
          "hash_for_sign": "38153ccf7559dca16ec4b513716004c78be468e39a4bcd0ca46d49f6f0868174"
      }
  }
  ```



**发送交易信息**

**接口功能**

> 接口说明： 发送交易信息
>
> **接口地址**
>
> URL:  /v1/transaction/send
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明                                                      |
| ------------ | ---- | ------ | ------ | --------------------------------------------------------- |
| version      | TRUE | uint32 | 无     | 最新区块号，调用获取区块头的version字段                   |
| cursor_num   | TRUE | uint64 | 无     | 最新区块号，调用获取区块头获得                            |
| cursor_label | TRUE | uint32 | 无     | 最新区块标识，调用获取区块头获得                          |
| lifetime     | TRUE | uint64 | 无     | 交易过期时间，调用获取区块头，加一定的延时，推荐延时100秒 |
| sender       | TRUE | string | 无     | 发送者                                                    |
| contract     | TRUE | string | 无     | 合约名称                                                  |
| method       | TRUE | string | 无     | 合约方法                                                  |
| param        | TRUE | string | 无     | 业务参数，十六进制字符串                                  |
| sig_alg      | TRUE | uint32 | 1      | 签名算法                                                  |
| signature    | TRUE | string | 无     | 签名值                                                    |

**响应字段：**

| 参数         | 类型       | 说明                                       |
| ------------ | ---------- | ------------------------------------------ |
| errcode      | uint32     | 错误码，0-相应成功，其他见错误码章节       |
| msg          | string     | 响应描述                                   |
| result       | jsonObject | 响应结果                                   |
| trx_hash     | string     | 交易哈希值                                 |
| trx          | jsonObject | 交易详情                                   |
| version      | uint32     | 链版本号                                   |
| cursor_num   | uint64     | 最新区块号，调用获取区块头获得             |
| cursor_label | uint32     | 最新区块标签，调用获取区块头获得           |
| lifetime     | uint64     | 交易过期时间，调用获取区块头，加一定的延时 |
| sender       | string     | 发送者                                     |
| contract     | string     | 合约名称                                   |
| method       | string     | 合约方法                                   |
| param        | string     | 业务参数，十六进制字符串                   |
| sig_alg      | uint32     | 签名算法                                   |
| signature    | string     | 签名值                                     |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/transaction/send>

- 请求：

  

  ```
  {
  	"version": 1,
  	"cursor_num": 719,
  	"cursor_label": 2997806499,
  	"lifetime": 1534143531,
  	"sender": "bottos",
  	"contract": "bottos",
  	"method": "newaccount",
  	"param": "dc0002da0009757365727465737431da008230346430373538383030353634383861393864613365643234623766613265633061623864383464343764623534366333663138316137363462613366613165383237396637363434303963343164653031623030383065623161616565623935303966373932333535323061373565333432343432393134346234336331303462",
  	"sig_alg": 1,
  	"signature": "f0069bc363a55dc22207c75d15cc75524bf4950159130c6bf385f6f1ca877177362ad5ab51108e7f396043e3aee7058f1ca6a40fd6c79a8483e439d2e2bccf2c"
  }
  
  ```

- 响应：

  

  ```
  HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "trx receive succ",
      "result": {
          "trx": {
              "version": 1,
              "cursor_num": 719,
              "cursor_label": 2997806499,
              "lifetime": 1534143531,
              "sender": "delta",
              "contract": "bottos",
              "method": "newaccount",
              "param": "dc0002da0009757365727465737431da008230346430373538383030353634383861393864613365643234623766613265633061623864383464343764623534366333663138316137363462613366613165383237396637363434303963343164653031623030383065623161616565623935303966373932333535323061373565333432343432393134346234336331303462",
              "sig_alg": 1,
              "signature": "f0069bc363a55dc22207c75d15cc75524bf4950159130c6bf385f6f1ca877177362ad5ab51108e7f396043e3aee7058f1ca6a40fd6c79a8483e439d2e2bccf2c"
          },
          "trx_hash": "1815f4d4dfb52b88fb445efc255a5be6275fc3ad694f802c01c40644f09b651f"
      }
  }
  
  ```

**查询交易信息**

**接口功能**

> 接口说明： 查询交易信息
>
> **接口地址**
>
> URL:  /v1/transaction/get
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型   | 默认值 | 说明       |
| -------- | ---- | ------ | ------ | ---------- |
| trx_hash | TRUE | string | 无     | 交易哈希值 |

响应字段：**

| 参数         | 类型       | 说明                                       |
| ------------ | ---------- | ------------------------------------------ |
| errcode      | uint32     | 错误码，0-相应成功，其他见错误码章节       |
| msg          | string     | 响应描述                                   |
| result       | jsonObject | 响应结果                                   |
| trx_hash     | string     | 交易哈希值                                 |
| trx          | jsonObject | 交易详情                                   |
| version      | uint32     | 链版本号                                   |
| cursor_num   | uint64     | 最新区块号，调用获取区块头获得             |
| cursor_label | uint32     | 最新区块标签，调用获取区块头获得           |
| lifetime     | uint64     | 交易过期时间，调用获取区块头，加一定的延时 |
| sender       | string     | 发送者                                     |
| contract     | string     | 合约名称                                   |
| method       | string     | 合约方法                                   |
| param        | jsonObject | 业务参数                                   |
| sig_alg      | uint32     | 签名算法                                   |
| signature    | string     | 签名值                                     |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/transaction/get>

- 请求：

  

  ```
  {
  	"trx_hash": "85f9d2fbe1d3c0a217e10932899b6f73b24fafe59a006406ed65d7e4a39a7416"
  }
  
  ```

- 响应：

  

  ```
  HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "version": 1,
          "cursor_num": 31,
          "cursor_label": 2749714050,
          "lifetime": 1537259224,
          "sender": "bottos",
          "contract": "bottos",
          "method": "newaccount",
          "param": {
              "name": "testtest",
              "pubkey": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f"
          },
          "sig_alg": 1,
          "signature": "c85fd25af493cbb6a79870ce0fc602acc892664ca17e2c646aff0332ca6db7787beeb7e5d8553de8e4b83bdf7b227762fedf9e3674888893f18bf31f0b05d622"
      }
  }
  
  ```

**查询交易状态**

**接口功能**

> 接口说明： 查询交易状态
>
> **接口地址**
>
> URL:  /v1/transaction/status
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型   | 默认值 | 说明       |
| -------- | ---- | ------ | ------ | ---------- |
| trx_hash | TRUE | string | 无     | 交易哈希值 |

**响应字段：**

| 参数    | 类型       | 说明                                                         |
| ------- | ---------- | ------------------------------------------------------------ |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节                         |
| msg     | string     | 响应描述                                                     |
| result  | jsonObject | 响应结果                                                     |
| status  | string     | 查询交易状态结果，<br />”sending“：交易已提交，在缓存池中处理；<br/>”pending“：交易已提交，但未处理；<br />”packed“：交易已打包；<br />”not found“：交易执行失败；<br />”irreversible committed“：交易已成功生效，并不可逆转；<br />“committed but reversible”：交易已生效，但可逆转 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/transaction/status

- 请求：



```
  {
  	"trx_hash": "8a403642ea7b51595d1a1454b43b83ba62420629581c3d2f0d2143342aa89c9f"
  }

```

- 响应：



```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "status": "irreversible committed"
      }
  }

```

#### 5.3.3 账户相关

**查询账户基本信息**

**接口功能**

> 接口说明： 查询账户基本信息
>
> **接口地址**
>
> URL:  /v1/account/brief
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | 无     | 账户名称 |

**响应字段：**

| 参数         | 类型       | 说明                                 |
| ------------ | ---------- | ------------------------------------ |
| errcode      | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg          | string     | 响应描述                             |
| result       | jsonObject | 响应结果                             |
| account_name | string     | 账号名称                             |
| pubkey       | string     | 公钥                                 |
| balance      | string     | 账号可支配的BTO数量                  |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/account/brief>

- 请求：

  

  ```
  {
  	"account_name":"bottos"
  }
  
  ```

- 响应：



```
   HTTP/1.1 200 OK
   {
        "errcode": 0,
        "msg": "success",
        "result": {
            "account_name": "bottos",
            "pubkey": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
            "balance": "93329890000000000"
        }
    }

```



**查询账户详情**

**接口功能**

> 接口说明： 查询账户详情
>
> **接口地址**
>
> URL:  /v1/account/info
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | 无     | 账户名称 |

**响应字段：**

| 参数                   | 类型       | 说明                                  |
| ---------------------- | ---------- | ------------------------------------- |
| errcode                | uint32     | 错误码，0-相应成功，其他见错误码章节  |
| msg                    | string     | 响应描述                              |
| result                 | jsonObject | 响应结果                              |
| account_name           | string     | 账号名称                              |
| pubkey                 | string     | 公钥                                  |
| balance                | string     | 账号可支配的BTO数量                   |
| staked_balance         | string     | 质押投票的BTO数量                     |
| staked_space_balance   | string     | 质押SPACE的BTO数量（交易需消耗SPACE） |
| staked_time_balance    | string     | 质押TIME的BTO数量（交易需消耗TIME）   |
| unStaking_balance      | string     | 正解质押的BTO数量                     |
| unStaking_timestamp    | uint64     | 解质押的时间（ Unix时间戳 ）          |
| authority              | jsonObject | 授权列表，若该账号非多签账号，不为空  |
| author_account         | string     | 授权账号                              |
| weight                 | uint32     | 权重                                  |
| resource               | jsonObject | 账号资源情况                          |
| free_available_space   | uint64     | 免费额度内，可使用的SPACE数量         |
| free_used_space        | uint64     | 免费额度内，已使用的SPACE数量         |
| stake_available_space  | uint64     | 质押范围内，可使用的SPACE数量         |
| stake_used_space       | uint64     | 质押范围内，已使用的SPACE数量         |
| free_available_time    | uint64     | 免费额度内，可使用的TIME数量          |
| free_used_time         | uint64     | 免费额度内，已使用的TIME数量          |
| stake_available_time   | uint64     | 质押范围内，可使用的TIME数量          |
| stake_used_time        | uint64     | 质押范围内，已使用的TIME数量          |
| unClaimed_block_reward | string     | 出块奖励数                            |
| unClaimed_vote_reward  | string     | 投票奖励数                            |
| deploy_contract_list   | string     | 该账号部署的合约列表                  |
| vote                   | jsonObject | 投票信息                              |
| delegate               | string     | 被投票生产者                          |
| votes                  | string     | 投票数量                              |

备注：balance、staked_balance、staked_space_balance、staked_time_balance、unStaking_balance 三者之和为改账户总的Token值 。

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/account/info>

- 请求：

  

  ```
  {
  	"account_name":"bottostest"
  }
  
  ```

- 响应：



```
   HTTP/1.1 200 OK
   {
	"errcode": 0,
	"msg": "success",
	"result": {
		"account_name": "bottostest",
		"pubkey": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
		"balance": "90000000000",
		"staked_balance": "0",
		"staked_space_balance": "0",
		"staked_time_balance": "0",
		"unStaking_balance": "0",
		"unStaking_timestamp": 0,
		authority: [{
			"author_account": "bobabcdefg",
			"weight": 1
		},
		{
			"author_account": "bobabcdefg1",
			"weight": 1
		}],
		"resource": {
			"free_available_space": 800,
			"free_used_space": 0,
			"stake_available_space": 279521403,
			"stake_used_space": 0,
			"free_available_time": 400,
			"free_used_time": 0,
			"stake_available_time": 141206920,
			"stake_used_time": 0
		},
		"unClaimed_block_reward": "0",
		"unClaimed_vote_reward": "0",
		"deploy_contract_list": "",
		"vote": {
			"delegate": "bottostest12",
			"votes": "6000000000"
		}
	}
}

```

#### 5.3.4 合约相关

**查询合约ABI**

**接口功能**

> 接口说明： 查询合约ABI
>
> **接口地址**
>
> URL:  /v1/contract/abi 
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型   | 默认值 | 说明     |
| -------- | ---- | ------ | ------ | -------- |
| contract | TRUE | string | 无     | 合约名称 |

**响应字段：**

| 参数        | 类型       | 说明                                                         |
| ----------- | ---------- | ------------------------------------------------------------ |
| errcode     | uint32     | 错误码，0-相应成功，其他见错误码章节                         |
| msg         | string     | 响应描述                                                     |
| result      | jsonObject | 响应结果                                                     |
| types       | jsonObject | 预留字段                                                     |
| structs     | jsonArray  | 合约所包含的方法结构列表                                     |
| name        | string     | 结构体名，一般为自定义的合约方法名别名                       |
| base        | string     | 父方法，通常为空                                             |
| fields      | jsonObject | 方法入参结构体                                               |
| name        | string     | 参数-1，以注册账号为例：账号名称                             |
| pubkey      | string     | 参数-2，以注册账号为例：公钥                                 |
| actions     | jsonArray  | 合约所包含的方法                                             |
| action_name | string     | 合约方法名称，对应“发送交易信息”请求参数的method值           |
| type        | string     | 同name，结构体名，一般为自定义的合约方法名别名               |
| tables      | jsonArray  | 该合约数据的存储方式，定义表名，类型，Key值，类型，Value 类型。内置合约该字段为空。 |
| table_name  | string     | 合约存储的表名                                               |
| index_type  | string     | 索引类型，默认为string。                                     |
| key_names   | jsonArray  | 合约数据存储的Key值                                          |
| key_types   | jsonArray  | key值的类型，默认为string                                    |
| type        | string     | 合约数据key对应的value值，通常为 结构体                      |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/contract/abi >

- 请求：

  

  ```
  {
  	"contract":"test1@tinaailian"
  }
  
  ```

- 响应：



```
   HTTP/1.1 200 OK
  {
    "errcode": 0,
    "msg": "{\n\t\"types\": [],\n\t\"structs\": [\n              {\n              \t\"name\": \"UserInfo\",\n              \t\"base\": \"\",\n              \t\"fields\": {\n              \t\t\"userName\": \"string\",\n              \t\t\"userInfo\": \"string\"\n                    }\n              \t},\n              {\n              \t\"name\": \"UserBaseInfo\",\n              \t\"base\": \"\",\n              \t\"fields\": {\n              \t\t\"userInfo\": \"string\"\n                    }\n              \t}\n       ],\n\t\"actions\": [\n              {\n              \t\"action_name\": \"reguser\",\n              \t\"type\": \"UserInfo\"\n              }\n       ],\n\t\"tables\": [\n              {\n              \t\"table_name\": \"userinfo\",\n              \t\"index_type\": \"string\",\n              \t\"key_names\":  [\n              \t\t\"userName\"\n              \t ],\n              \t\"key_types\":  [\n              \t\t\"string\"\n              \t ],\n              \t\"type\": \"UserBaseInfo\"\n              }\n       ]\n}\n",
    "result": {
        "types": [],
        "structs": [
            {
                "name": "UserInfo",
                "base": "",
                "fields": {
                    "userName": "string",
                    "userInfo": "string"
                }
            },
            {
                "name": "UserBaseInfo",
                "base": "",
                "fields": {
                    "userInfo": "string"
                }
            },
            {
                "name": "UserInfo",
                "base": "",
                "fields": {
                    "userInfo": "string"
                }
            },
            {
                "name": "UserBaseInfo",
                "base": "",
                "fields": {
                    "userInfo": "string"
                }
            }
        ],
        "actions": [
            {
                "action_name": "reguser",
                "type": "UserInfo"
            }
        ],
        "tables": [
            {
                "table_name": "userinfo",
                "index_type": "string",
                "key_names": [
                    "userName"
                ],
                "key_types": [
                    "string"
                ],
                "type": "UserBaseInfo"
            }
        ]
     }
  }

```

**查询合约代码**

**接口功能**

> 接口说明： 查询合约代码
>
> **接口地址**
>
> URL:  /v1/contract/code
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型   | 默认值 | 说明     |
| -------- | ---- | ------ | ------ | -------- |
| contract | TRUE | string | 无     | 合约名称 |

**响应字段：**

| 参数    | 类型       | 说明                                 |
| ------- | ---------- | ------------------------------------ |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg     | string     | 响应描述                             |
| result  | jsonObject | 响应结果                             |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/contract/code >

- 请求：

  

  ```
  {
  	"contract":"usermng"
  }
  
  ```

- 响应：

  

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "",
      "result": "7b0a2020227479706573223a205b5d2c0a20202273747275637473223a205b7b0a202020202020226e616d65223a202255736572496e666f222c0a2020202020202262617365223a2022222c0a202020202020226669656c6473223a207b0a20202020202020202020226469646964223a2022737472696e67222c0a2020202020202020202022696e666f223a2022737472696e67220a20202020202020207d0a202020207d2c7b0a202020202020226e616d65223a2022557365724c6f67696e222c0a2020202020202262617365223a2022222c0a202020202020226669656c6473223a207b0a2020202020202020202022757365724e616d65223a2022737472696e67222c0a202020202020202020202272616e646f6d4e756d223a202275696e743332220a20202020202020207d0a202020207d2c7b0a202020202020226e616d65223a20225573657242617365496e666f222c0a2020202020202262617365223a2022222c0a202020202020226669656c6473223a207b0a2020202020202020202022696e666f223a2022737472696e67220a20202020202020207d0a202020207d0a20205d2c0a202022616374696f6e73223a205b7b0a20202020202022616374696f6e5f6e616d65223a202272656775736572222c0a2020202020202274797065223a202255736572496e666f220a202020207d2c7b0a20202020202022616374696f6e5f6e616d65223a2022757365726c6f67696e222c0a2020202020202274797065223a2022557365724c6f67696e220a202020207d0a20205d2c0a2020227461626c6573223a205b7b0a202020202020227461626c655f6e616d65223a202275736572726567696e666f222c0a20202020202022696e6465785f74797065223a2022737472696e67222c0a202020202020226b65795f6e616d6573223a205b0a2020202020202020226469646964220a2020202020205d2c0a202020202020226b65795f7479706573223a205b0a202020202020202022737472696e67220a2020202020205d2c0a2020202020202274797065223a20225573657242617365496e666f220a202020207d0a20205d0a7d0a"
  }
  
  ```

#### 5.3.5 生产者相关

**查询所有生产者**

**接口功能**

> 接口说明： 查询所有生产者
>
> **接口地址**
>
> URL:  /v1/delegate/getall
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数  | 必选 | 类型   | 默认值 | 说明         |
| ----- | ---- | ------ | ------ | ------------ |
| limit | TRUE | uint32 | 无     | 查询条数     |
| start | TRUE | uint32 | 0      | 查询起始下标 |

**响应字段：**

| 参数         | 类型      | 说明                                 |
| ------------ | --------- | ------------------------------------ |
| errcode      | uint32    | 错误码，0-相应成功，其他见错误码章节 |
| msg          | string    | 响应描述                             |
| result       | jsonArray | 响应结果                             |
| account_name | string    | 账号名称                             |
| public_key   | string    | 公钥                                 |
| location     | string    | 节点地理位置信息，如"shanghai,china" |
| desc         | string    | 节点描述信息                         |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/delegate/getall >

- 请求：

  

  ```
  {
      "limit": 10,
      "start": 0
  }
  
  ```

- 响应：

  

  ```
   HTTP/1.1 200 OK
  {
        {
        "errcode": 0,
        "msg": "success",
        "result": [
            {
                "account_name": "bottos",
                "public_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
                "location": "",
                "description": "",
                "votes": "",
                "active": true,
                "transit_votes": ""
            },
            {
                "account_name": "delegatecreate1",
                "public_key": "04290d3406ba34e4f048a512b2fa7c6687622106c7bf6b7a62dac4c31d5b8f3cbf829eb30790648dcab111fde5edbce038801d5ba43f20388c15249ddd22b081e1",
                "location": "",
                "description": "",
                "votes": "50000000000",
                "active": true,
                "transit_votes": "50000000000"
            },
            {
                "account_name": "delegatecreate2",
                "public_key": "04cc788ad88378837658b150f33440bf531aea0acc13a6921814b1e01927fd812ddb5ade669c784f34af3350b9188c8b63bb114b5afde4f64bbbab0ccd1f925458",
                "location": "",
                "description": "",
                "votes": "50000000000",
                "active": true,
                "transit_votes": "50000000000"
            }
        ]
    }
  }
  
  ```

#### 5.3.6 多签相关

**获取转账提案详情**

**接口功能**

> 接口说明： 获取转账提案详情
>
> **接口地址**
>
> URL:  /v1/proposal/review
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数          | 必选  | 类型   | 默认值 | 说明           |
| ------------- | ----- | ------ | ------ | -------------- |
| proposal_name | TRUE  | string | 无     | 提案名称       |
| proposer      | FALSE | string | 无     | 提案发起人账号 |

**响应字段：**

| 参数               | 类型       | 说明                                 |
| ------------------ | ---------- | ------------------------------------ |
| errcode            | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg                | string     | 响应描述                             |
| result             | jsonObject | 响应结果                             |
| proposal_name      | string     | 提案名称                             |
| proposer           | string     | 提案发起人                           |
| msign_account_name | string     | 多签账号名称                         |
| author_list        | jsonArray  | 多签账号授权账号列表                 |
| author_account     | string     | 授权账号                             |
| is_approved        | string     | 提案是否同意                         |
| packed_transaction | string     | 序列化之前的十六进制数据             |
| transaction        | jsonObject | 交易数据                             |
| from               | string     | 转账账号                             |
| to                 | string     | 接收账号                             |
| amount             | string     | 转账金额                             |
| memo               | string     | 转账备注                             |
| available          | bool       | 提案是否结束                         |
| time               | uint64     | 提案提交时间                         |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/proposal/review >

- 请求：

  

  ```
  {
      "proposal_name": "testtransfer",
    	"proposer": "bobabcdefg"
  }
  
  ```

- 响应：

  

  ```
   HTTP/1.1 200 OK
  {
  	"errcode": 0,
  	"msg": "success",
  	"result": {
  		"proposal_name": "testtransfer",
  		"proposer": "bobabcdefg",
  		"msign_account_name": "tester",
  		"author_list": [{
  			"author_account": "bob",
  			"is_approved": "true",
  			
  		}],
  		"packed_transaction": "c9b17f5b000000000000000000000100a6823403ea3055000000572d3ccdcd01000000005c95b1ca00000000003ccdcd34000000005c95b1ca00000000007015d60500000000000000045359530000000013706179207573657220736f6d65206d6f6e657900",
  		"transaction": {
  			"from": "bottos",
  			"memo": "testtransfer",
  			"to": "bottosreferrer1",
  			"value": 100000000000
  		},
  		"available": true,
  		"time": 1554692543
  	}
  }
  
  ```

#### 5.3.7 交易数据相关

**根据关键字查询数据**

**接口功能**

> 接口说明： 根据关键字查询数据
>
> **接口地址**
>
> URL: /v1/common/queryDB
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数       | 必选 | 类型   | 默认值 | 说明       |
| ---------- | ---- | ------ | ------ | ---------- |
| contract   | TRUE | string | 无     | 合约名称   |
| table_name | TRUE | string | 无     | 合约表名   |
| key        | TRUE | string | 无     | 查询关键字 |

**响应字段：**

| 参数       | 类型       | 说明                                 |
| ---------- | ---------- | ------------------------------------ |
| errcode    | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg        | string     | 响应描述                             |
| result     | jsonObject | 响应结果                             |
| contract   | string     | 合约名称                             |
| table_name | string     | 合约表名                             |
| key        | string     | 查询关键字                           |
| value      | jsonObject | 查询到的数据                         |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/common/queryDB>

- 请求：

  ```
  {
  	"contract":"bottos",
  	"table_name":"account",
  	"key":"bottos"
  }
  
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "contract": "bottos",
          "table_name": "account",
          "key": "bottos",
          "Value": {
              "account_name": "bottos",
              "contract_name": null,
              "create_date": 1533124800,
              "gs_permission": true,
              "public_key": "BFTxwiI9VTqm7lPqHM6ot794uMqZ8/9iKjuz5i3txxIIkDPWCR13KWVHvAcQIsooOMnobewpZnz3QOXJ5lS2En8="
          }
      }
  }
  
  ```

#### 5.3.8 序列化业务数据

**接口功能**

> 接口说明： 序列化业务数据，json 转为 十六进制字符串，作为“发送交易信息”请求中的param 字段值。
>
> **接口地址**
>
> URL: /v1/common/jsontobin
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型       | 默认值 | 说明                                                    |
| -------- | ---- | ---------- | ------ | ------------------------------------------------------- |
| sender   | TRUE | string     | 无     | 发送交易的账号名称                                      |
| contract | TRUE | string     | 无     | 合约名                                                  |
| method   | TRUE | string     | 无     | 合约方法名                                              |
| param    | TRUE | JsonObject | 无     | 业务结构数据，字段名称需与ABI文件中的fields结构字段相同 |



**响应字段：**

| 参数    | 类型   | 说明                                 |
| ------- | ------ | ------------------------------------ |
| errcode | uint32 | 错误码，0-相应成功，其他见错误码章节 |
| msg     | string | 响应描述                             |
| result  | string | 序列化后的业务数据                   |

**字段变化**

- 无

  **接口示例**

> 地址：<<http://127.0.0.1:8689/v1/common/jsontobin>

- 请求：

  ```
  {
  	"sender": "bottos",
  	"contract": "bottos",
  	"method": "newaccount",
  	"param": {
  		"name": "bottostest11",
  		"pubkey": "0492876e897e53de5d6767c41ba11217163baadc063ecbca38d4a3717d6c7f139c6e2d747dc6542d38c3d12dab495e3fad778852395ad247c76e63121864597f62"
  	}
  }
  
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": "dc0002da000c626f74746f73746573743131da008230343932383736653839376535336465356436373637633431626131313231373136336261616463303633656362636133386434613337313764366337663133396336653264373437646336353432643338633364313264616234393565336661643737383835323339356164323437633736653633313231383634353937663632"
  }
  
  ```

#### 5.3.9 反序列化业务数据

> 接口说明： 反序列化业务数据，十六进制字符串转为 json，查看“发送交易信息”请求中的param 字段值。
>
> **接口地址**
>
> URL: /v1/common/bintojson
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型   | 默认值 | 说明               |
| -------- | ---- | ------ | ------ | ------------------ |
| sender   | TRUE | string | 无     | 发送交易的账号名称 |
| contract | TRUE | string | 无     | 合约名             |
| method   | TRUE | string | 无     | 合约方法名         |
| data     | TRUE | string | 无     | 序列化后的业务数据 |



**响应字段：**

| 参数    | 类型       | 说明                                                    |
| ------- | ---------- | ------------------------------------------------------- |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节                    |
| msg     | string     | 响应描述                                                |
| result  | JsonObject | 业务结构数据，字段名称应与ABI文件中的fields结构字段相同 |

**字段变化**

- 无

  **接口示例**

> 地址：<<http://127.0.0.1:8689/v1/common/bintojson>

- 请求：

  ```
  {
  	"sender": "bottos",
  	"contract": "bottos",
  	"method": "newaccount",
  	"data": "dc0002da000c626f74746f73746573743131da008230343932383736653839376535336465356436373637633431626131313231373136336261616463303633656362636133386434613337313764366337663133396336653264373437646336353432643338633364313264616234393565336661643737383835323339356164323437633736653633313231383634353937663632"
  	}
  }
  
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "name": "bottostest11",
          "pubkey": "0492876e897e53de5d6767c41ba11217163baadc063ecbca38d4a3717d6c7f139c6e2d747dc6542d38c3d12dab495e3fad778852395ad247c76e63121864597f62"
      }
  }
  
  ```

#### 5.3.10 查询类

**查询交易记录列表**

**接口功能**

> 接口说明： 查询交易记录列表
>
> **接口地址**
>
> URL: /transferl/queryPersonalTransferlListAuto
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数        | 必选 | 类型   | 默认值 | 说明         |
| ----------- | ---- | ------ | ------ | ------------ |
| accountName | TRUE | string | 无     | 账号名称     |
| start       | TRUE | int    | 无     | 起始页       |
| length      | TRUE | int    | 无     | 每页条目数量 |



**响应字段：**

| 参数                 | 类型       | 说明               |
| -------------------- | ---------- | ------------------ |
| data                 | jsonObject | 包含交易记录信息   |
| blockNum             | uint64     | 区块号             |
| sender               | string     | 发送交易的账号名称 |
| receiver             | string     | 接收者账号名称     |
| tradeAmount          | string     | 交易额度           |
| currency             | string     | 交易币种           |
| transactionId        | string     | 交易HASH           |
| tradeDate            | uint64     | 交易日期           |
| iTotalDisplayRecords | uint32     | 显示的交易总条数   |
| message              | string     | 查询返回消息       |
| success              | bool       | 查询状态           |

**字段变化**

- 无

  **接口示例**

> 地址：<http://125.94.34.23:8080/transferl/queryPersonalTransferlListAuto>

- 请求：

  ```
  {
  	"accountName": "bottos.funds",
  	"start": 0,
  	"length": 20
  }
  
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
  	"data": {
  		"data": [{
  			"blockNum": 2845146,
  			"sender": "bottos.funds",
  			"receiver": "bto1415926",
  			"tradeAmount": 1814032318641,
  			"currency": "BTO",
  			"transactionId": "ef1384fe1ae5b52da7afe0996b3a5c3c64b825518c5e3c16938ac291a223a7e3",
  			"tradeDate": 1554738564
  		},		
  		{
  			"blockNum": 4195448,
  			"sender": "bottos.funds",
  			"receiver": "tioksbottos",
  			"tradeAmount": 52000000000,
  			"currency": "BTO",
  			"transactionId": "36222017b2747bddb26cdb77e33bda19a206ac211e3242c7c4fe381239dfd9c1",
  			"tradeDate": 1559038524
  		}],
  		"iTotalDisplayRecords": 2
  	},
  	"message": "find personal transfer success",
  	"success": true
  }
  
  ```

**查询交易详情**

**接口功能**

> 接口说明：查询交易详情
>
> **接口地址**
>
> URL: /trade/queryTradeDetailAuto
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数          | 必选 | 类型   | 默认值 | 说明     |
| ------------- | ---- | ------ | ------ | -------- |
| transactionId | TRUE | string | 无     | 交易HASH |



**响应字段：**

| 参数           | 类型       | 说明               |
| -------------- | ---------- | ------------------ |
| data           | jsonObject | 包含交易记录信息   |
| blockNum       | uint64     | 区块号             |
| transactionId  | string     | 交易HASH           |
| sender         | string     | 发送交易的账号名称 |
| contract       | string     | 合约名称           |
| method         | string     | 合约方法           |
| param          | jsonObject | 合约参数           |
| tradeDate      | uint64     | 交易日期           |
| tradeStatus    | string     | 交易状态           |
| resultType     | string     | 合约返回结果类型   |
| spaceTokenCost | uint32     | 空间资源消耗       |
| timeTokenCost  | uint32     | 时间资源消耗       |
| message        | string     | 查询返回消息       |
| success        | bool       | 查询状态           |

**字段变化**

- 无

  **接口示例**

> 地址：<http://125.94.34.23:8080/trade/queryTradeDetailAuto>

- 请求：

  ```
  {
  	"transactionId": "9dd7f5e7e7dd8a9e49fd23ac09e12b098a4fe4385af514f32626f6eecb119e21"
  }
  
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
  	"data": {
  		"data": {
  			"blockNum": 4289315,
  			"transactionId": "9dd7f5e7e7dd8a9e49fd23ac09e12b098a4fe4385af514f32626f6eecb119e21",
  			"sender": "scottyu0711",
  			"contract": "bottos",
  			"method": "transfer",
  			"param": {
  				"from": "scottyu0711",
  				"memo": "000837d0c03",
  				"to": "gateiobottos",
  				"value": 10000000000000
  			},
  			"tradeDate": 1559374704,
  			"tradeStatus": "已确认",
  			"resultType": "trade",
  			"spaceTokenCost": 302,
  			"timeTokenCost": 100
  		}
  	},
  	"message": "transaction detail find success",
  	"success": true
  }
  
  ```



### 5.4 钱包API接口 

**一键创建钱包**

**接口功能**

> 接口说明： 一键创建钱包，钱包文件包默认保存在 Linux： /home/bottos/bot/ 目录下
>
> **接口地址**
>
> URL:  /v1/wallet/createwallet 
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | 无     | 账号名称 |
| passwd       | TRUE | string | 无     | 密码     |

**响应字段：**

| 参数        | 类型       | 说明                                               |
| ----------- | ---------- | -------------------------------------------------- |
| errcode     | uint32     | 错误码，0-相应成功，其他见错误码章节               |
| msg         | string     | 响应描述                                           |
| result      | jsonObject | 响应结果                                           |
| wallet_name | string     | 生成的钱包文件名称，默认为账号名称+".keystore"后缀 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/createwallet  >

- 请求：

  ```
  {
  	"account_name": "testtest1",
  	"passwd": "Abc123"	
  }
  
  
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "wallet_name": "testtest1.keystore"
      }
  }
  
  
  ```





**生成公私钥对**

**接口功能**

> 接口说明： 生成公私钥对
>
> **接口地址**
>
> URL:  /v1/wallet/generatekeypair
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> GET

**请求参数：**

| 参数 | 必选 | 类型 | 默认值 | 说明 |
| ---- | ---- | ---- | ------ | ---- |
| 无   |      |      |        |      |

**响应字段：**

| 参数        | 类型       | 说明                                 |
| ----------- | ---------- | ------------------------------------ |
| errcode     | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg         | string     | 响应描述                             |
| result      | jsonObject | 响应结果                             |
| public_key  | string     | 公钥                                 |
| private_key | string     | 私钥                                 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/generatekeypair  >

- 请求：

  ```
  无
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "public_key": "043680ae1b81f87274d7051e6101afc8f8da3cd978bb75b22f24becb98afb456f110151644330ff6c742e44f8e9652f1ab5ea1cd3997bebe5a23a4389ff0cb6493",
          "private_key": "8a068d821ad8d58fe8caaa87f32ea69f889f6b8ce8c6bc3bc67ce2c68c43da3b"
      }
  }
  ```

**创建账号**

**接口功能**

> 接口说明： 创建账号，调用该接口时，需启动bottos节点程序；单独启动wallet服务，该功能不可用
>
> **接口地址**
>
> URL:  /v1/wallet/createaccount 
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明       |
| ------------ | ---- | ------ | ------ | ---------- |
| account_name | TRUE | string | 无     | 账号名称   |
| public_key   | TRUE | string | 无     | 公钥       |
| referrer     | TRUE | string | 无     | 引荐人账号 |

**响应字段：**

| 参数    | 类型       | 说明                                 |
| ------- | ---------- | ------------------------------------ |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg     | string     | 响应描述                             |
| result  | jsonObject | 响应结果，具体数据详情               |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/createaccount >

- 请求：

  ```
  {
  	"account_name": "testaccount1",
  	"public_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
  	"referrer": "bottos"	
  }
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
    "errcode": 0,
    "msg": "success",
    "result": {
        "trx": {
            "version": 65536,
            "cursor_num": 1933,
            "cursor_label": 503463811,
            "lifetime": 1548325777,
            "sender": "bottos",
            "contract": "bottos",
            "method": "newaccount",
            "param": "dc0002da000c746573746163636f756e7431da008230343534663163323232336435353361613665653533656131636365613862376266373862386361393966336666363232613362623365363264656463373132303839303333643630393164373732393635343762633037313032326361323833386339653836646563323936363763663734306535633965363534623631323766",
            "sig_alg": 1,
            "signature": "b3b5dedc31a63947b5cd058cae8723daf9e0489439f9a9328b2c3e089bcf1df97d245ad36a553619f99ac166cbb7d4a81be6aaf4960c0dd5d8a22ad58f9f7a95"
        },
        "trx_hash": "e5281d1bbc7b70f955136fa9c32cfecadebf6f07956a55ad85ff7a5f9e32428a"
    }
  }
  ```



**手动创建钱包**

**接口功能**

> 接口说明： 手动创建钱包，钱包文件包默认保存在 Linux： /home/bottos/bot/ 目录下，生成的钱包文件名称，默认为账号名称+".keystore"后缀
>
> **接口地址**
>
> URL:  /v1/wallet/createwalletmanual 
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | 无     | 账号名称 |
| private_key  | TRUE | string | 无     | 私钥     |
| passwd       | TRUE | string | 无     | 密码     |

**响应字段：**

| 参数    | 类型       | 说明                                 |
| ------- | ---------- | ------------------------------------ |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg     | string     | 响应描述                             |
| result  | jsonObject | 响应结果                             |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/createwalletmanual  >

- 请求：

  ```
  {
  	"account_name": "testtest1",
  	"private_key": "b799ef616830cd7b8599ae7958fbee56d4c8168ffd5421a16025a398b8a4be45",
  	"passwd": "Abc123"
  }
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "wallet_name": "testtest1.keystore"
      }
  }
  ```



**打开**/Unlock钱包

**接口功能**

> 接口说明： 打开/Unlock钱包
>
> **接口地址**
>
> URL:  /v1/wallet/unlockaccount
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | 无     | 账号名称 |
| passwd       | TRUE | string | 无     | 密码     |

**响应字段：**

| 参数    | 类型       | 说明                                 |
| ------- | ---------- | ------------------------------------ |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg     | string     | 响应描述                             |
| result  | jsonObject | 响应结果                             |
| unlock  | bool       | 操作结果                             |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/unlockaccount  >

- 请求：

  ```
  {
  	"account_name": "testtest1",
  	"passwd": "123456"
  }
  
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "unlock": true
      }
  }
  
  ```



**关闭/Lock钱包**

**接口功能**

> 接口说明： 关闭/Lock钱包
>
> **接口地址**
>
> URL:  /v1/wallet/lockaccount 
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | 无     | 账号名称 |

**响应字段：**

| 参数    | 类型       | 说明                                 |
| ------- | ---------- | ------------------------------------ |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg     | string     | 响应描述                             |
| result  | jsonObject | 响应结果                             |
| lock    | bool       | 操作结果                             |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/lockaccount  >

- 请求：

  ```
  {
  	"account_name": "testtest1"
  }
  
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "lock": true
      }
  }
  
  ```



**查询钱包列表**

**接口功能**

> 接口说明： 查询钱包列表
>
> **接口地址**
>
> URL:  /v1/wallet/list
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> GET

**请求参数：**

| 参数 | 必选 | 类型 | 默认值 | 说明 |
| ---- | ---- | ---- | ------ | ---- |
| 无   |      |      |        |      |

**响应字段：**

| 参数         | 类型       | 说明                                 |
| ------------ | ---------- | ------------------------------------ |
| errcode      | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg          | string     | 响应描述                             |
| result       | jsonObject | 响应结果                             |
| wallet_path  | string     | 钱包路径+文件名称                    |
| account_name | string     | 账号名称                             |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/list >

- 请求：

  ```
  无
  
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
  	"errcode": 0,
  	"msg": "success",
  	"result": [{
  		"wallet_path": "C:\\Users\\jim\\AppData\\Roaming\\bot\\delegatecreate1.keystore",
  		"account_name": "delegatecreate1"
  	},
  	{
  		"wallet_path": "C:\\Users\\jim\\AppData\\Roaming\\bot\\delegatecreate2.keystore",
  		"account_name": "delegatecreate2"
  	}]
  }
  
  ```



**查询公钥**

**接口功能**

> 接口说明： 查询公钥，调用该接口的前提：账号已处于打开或Unlock状态(不需要连接Bottos 链)
>
> **接口地址**
>
> URL:  /v1/wallet/getpublickey
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | 无     | 账号名称 |

**响应字段：**

| 参数         | 类型       | 说明                                 |
| ------------ | ---------- | ------------------------------------ |
| errcode      | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg          | string     | 响应描述                             |
| result       | jsonObject | 响应结果                             |
| account_name | string     | 账号名称                             |
| public_key   | string     | 公钥值                               |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/getpublickey>

- 请求：

  ```
  {
  	"account_name":"testtest"
  }
  
  ```

- 响应：

  ```
  {
  	"errcode": 0,
  	"msg": "success",
  	"result": {
  		"account_name": "testtest",
  		"public_key": "043680ae1b81f87274d7051e6101afc8f8da3cd978bb75b22f24becb98afb456f110151644330ff6c742e44f8e9652f1ab5ea1cd3997bebe5a23a4389ff0cb6493"
  	}
  }
  
  ```



**对交易签名**

**接口功能**

> 接口说明： 对交易签名
>
> **接口地址**
>
> URL:  /v1/wallet/signtransaction
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选  | 类型   | 默认值           | 说明                                                         |
| -------- | ----- | ------ | ---------------- | ------------------------------------------------------------ |
| sender   | TRUE  | string | 无               | 发送交易的账号名称                                           |
| contract | TRUE  | string | 无               | 合约名                                                       |
| method   | TRUE  | string | 无               | 合约方法名                                                   |
| param    | TRUE  | string | 无               | 业务结构数据，经bpl序列化后，转为十六进制字符串              |
| sig_alg  | FALSE | int    | 1                | 签名算法类型，当前只支持一种，后续可能会扩展                 |
| type     | FALSE | string | "normal"         | 签名钱包用途类型，normal：用于转账、投票等操作；delegate：用于生产者出块签名（一般生产者适用） |
| push_url | FALSE | string | "127.0.0.1:8689" | 接收交易的服务器地址信息，格式：IP地址或域名+端口号（默认8689），<br>  可选主网服务节点：mainnetservice1.bottos.org:8689；mainnetservice2.bottos.org:8689    <br>可选测试网服务节点：testnetservice1.bottos.org:8689；testnetservice2.bottos.org:8689 |

**响应字段：**

| 参数    | 类型       | 说明                                     |
| ------- | ---------- | ---------------------------------------- |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节     |
| msg     | string     | 响应描述                                 |
| result  | jsonObject | 响应结果，具体见 “发送交易信息” 请求字段 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/signtransaction>

- 请求：

  ```
  {
  	"sender": "bottosreferrer1",
  	"contract": "bottos",
  	"method": "newaccount",
  	"pa
