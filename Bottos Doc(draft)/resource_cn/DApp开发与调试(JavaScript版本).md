## 下载并引入`sdk`库文件

下载并引入`bottos-sdk-js.min.js`库文件

`bottos-sdk-js.min.js`下载地址:https://github.com/bottos-project/bottos-sdk-js

## 创建基本的项目结构

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

## 验证合约执行结果

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



