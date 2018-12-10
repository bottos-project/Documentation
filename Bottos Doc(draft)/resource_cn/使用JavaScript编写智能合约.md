# 1. 使用JavaScript编写智能合约

`注:`本套教程是基于Node.js开发环境的，如果您的电脑上没有安装请自行安装Node.js环境

## 1.1. 初始化项目

下载合约集成开发框架`contract-tool-js`,并初始化项目

```
sudo npm i contract-tool-js -g
contract-tool-js init MyDapp
cd MyDapp
```

通过上诉初始化步骤，可以生成如下项目结构

```
- config
    - config.js //主要放置配置文件
    - keystore.json  // 放置部署合约者的keystore秘钥文件
- contract
    - abi.json  // 用于放置智能合约的Abi结构
    - contract.js // 智能合约代码
- tools  
    - deploy.js  // 合约部署文件
- test  
    - test.js  // 合约测试文件
```

## 1.2. 智能合约与ABI开发

智能合约是在`contract`目录下开发

`contract/contract.js`文件中编写我们的智能合约代码
`contract/abi.json`文件中编写与智能合约相对应的`abi`描述文件

Bottos目前只支持单合约文件，有以下几点注意点

```
1. 不能使用npm安装的第三方依赖
2. 一个账户下只支持但合约文件部署，不支持多合约文件部署
```

abi文件描述模板如下

```
{
    "to":{"type":"string"},
    "value":{"type":"uint32"},
    "from":{"type":"string"},
    "contract":{
      "type":"object",
      "name":{"type":"string"},
      "sdfkjds":{
        "type":"object",
        "ksjdfl":{"type":"string"}
      }
    }
}
```

所有的字段类型有以下几种

```
uint8
uint16
uint32
uint64
uint256
string
bin16
object
array
```

## 1.3. 部署智能合约和ABI

智能合约与ABI开发完成以后，我们需要将智能合约和ABI文件部署到链上
`注:`可以通过Bottos官方钱包创建账户，获取keystore

- 将部署账户的`keystore`粘贴到`config/keystore.json`中
- 需要在`config/config.js`中配置keystore账户的密码`keystore_pwd`
- 运行一下命令部署合约与ABI文件

```
npm run deployContract  // 部署智能合约
npm run deployAbi  // 部署ABI文件
```

## 1.4. 测试智能合约

在`test/test.js`文件中编写智能合约测试代码,然后运行一下命令测试智能合约

```
npm test
```

## 1.5. 相关内置库

**Storage**

- Storage.set(table,key,value)
- Storage.get(contract,table,key)

**Lib**

- Lib.getParams()
- Lib.getPack(obj:object)
- Lib.getUnpack(packstr:string)


## 1.6. 相关文档

- [使用JavaScript编写智能合约](http://doc.bottos.org:4000/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6/Development/%E4%BD%BF%E7%94%A8JavaScript%E7%BC%96%E5%86%99%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6.html)
- [bottos-sdk-js API Document](https://github.com/bottos-project/bottos-sdk-js/wiki/API-Document)
- 官方开发文档:http://www.bottos.org/