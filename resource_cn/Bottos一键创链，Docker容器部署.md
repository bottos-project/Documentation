# Bottos一键创链，Docker容器部署

## 1 从 Docker Hub 拉取部署镜像

**在使用以下命令进行部署之前，请确保您在Linux系统上已正确安装docker。**

创建部署目录，在该目录下执行

```shell
docker pull yaoya12345/bottos:v1.0
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



## 2 从Github下载脚本文件

从Github下载脚本文件 makeDockerComposeYml.sh，并将下载的文件放到部署目录下。

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



## 3 创建并启动容器

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

