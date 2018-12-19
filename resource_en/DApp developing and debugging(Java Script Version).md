# Dapp Development and commissioning

## Download and introduce the `SDK` library file

Download and import `bottos-sdk-js.min.js` library files

`bottos-sdk-js.min.js` file download address :https://github.com/bottos-project/bottos-sdk-js

## Create a basic project structure

```
Project Catalog
    - index.html
    - index.js
    - bottos-sdk-js.min.js
```
- index.html

By injecting the `Index.js` and ` bottos-sdk-js.min.js` in index.html, the code is as follows

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
        <p>Create account excution result</p>
        <div id="createAccount" style="min-height:150px;background-color:#ccc">

        </div>
    
        <p>Publish the contact people execution result</p>
        <div id="pushTransaction" style="min-height:150px;background-color:#ccc">
    
        </div>
    
        <p>Get the contact people execution result</p>
        <div id="getTransaction" style="min-height:150px;background-color:#ccc">
    
        </div>
    </div>
    
</body>
</html>


```

- index.js

`Index.js` implements the write and read operation of the smart contract on the chain, the code is as follows

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

// Create account
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

// Invoke the contract
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
        alert('Please create the account at first')
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

// publish the cotact people
function pushTransaction(){
    console.log("pushTransaction")
    callContract()
}

// Read the contact people
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

## Verify the Contract Execution Results

- Create an account as a first

Click `Create account` and if the following structure is returned, the account creation is successful and the return value is the user's `KeyStore` file and needs to be securely saved.

```
{"account":"testaccount","crypto":{"cipher":"aes-128-ctr","ciphertext":"4cd010eba51ff45d9a752f38d64a4def7697a142570253cc381afa2b04288e68","cipherparams":{"iv":"46b469bb1c87751852857114b928e6ad"},"mac":"04051cce0379362c28d8027a19c8b79f03621602c2eff68d8b793f94ae6f58fb","kdf":"scrypt","kdfparams":{"dklen":32,"n":1024,"r":1,"p":8,"salt":"cf9dbed2413764c640018b9fccb6629ed38dad72b333c7d12e89994523ec7857"}},"id":"48a923c2-1c40-46aa-b0c1-8f24d8e1bc81","version":3}
```

- Writing a contract

Click the `Publish Contacts` button to indicate that the write contract was executed successfully if the following results are returned

```
{"errcode":0,"msg":"trx receive succ","result":{"trx":{"version":1,"cursor_num":286,"cursor_label":423110953,"lifetime":1537498176,"sender":"testaccount","contract":"john","method":"reguser","param":"dc0002da00046a6f686eda001b7b2270686f6e65223a22313130313230222c22616765223a31387d","sig_alg":1,"signature":"4149cb35eab48415082081aee0ab3766b7a6730b1a2213c96638540227a8616f17cdf773ba90e3c515183c3fc5631fa53b65dcf93eed320d53ec78a672738675"},"trx_hash":"eb79dc2d8a8461451ea55257fcbaa5897a9b9732e7cc3b0c8a8322ab4909789b"}}
```

- Reading a contract

Click the `Read Contacts` button and if the following results are returned, the read contract execution is successful

```
{"errcode":0,"msg":"success","result":{"contract":"john","object":"userreginfo","key":"john","value":"dc0001da001b7b2270686f6e65223a22313130313230222c22616765223a31387d"}}
```
At this point, one of our simple and complete dapp has been developed, and if you want to develop a more powerful dapp, you can view detailed interface documentation



