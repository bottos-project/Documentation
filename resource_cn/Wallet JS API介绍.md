# Bottos Wallet API Document:
  - [如何初始化 wallet](#InitializeWallet)
  - [如何创建账号 keystore](#CreateKeystore)
  - [如何从keystore恢复账号](#RecoverKeystore)
  - [如何创建mnemonic](#CreateMnemonic)
  - [如何从mnemonic恢复账号](#RecoverMnemonic)
  - [如何质押](#Stake)
  - [如何转账](#Transaction)

<span id="InitializeWallet">

# Wallet 初始化:

参数:

|    name    |  Type  | Required | Description  |
| :--------: | :----: | :------: | :----------: |
|  url  | string |   True   | 服务url |

示例:

```shell

import SDK from 'bottos-sdk-js'

const Wallet = new SDK({
    baseUrl: "http://serverUrl/..."
}).Wallet;

```
</span>

<span id="CreateKeystore">

# Wallet.createKeystore:

参数:

|    name    |  Type  | Required | Description  |
| :--------: | :----: | :------: | :----------: |
|  accounte  | string |   True   | 账号名称 |
|   passwd   | string |   True   |   密码   |
| privateKey | string |  False   | 私钥  |

示例:

```shell
let account = 'myaccount'
let password = '12345678'
let privateKey = 'b4e0391643ff9be326a6ddfa543df0e0c2e37b7e11ed2f45590c62a5d5f09d9f'

// Create keystore
let keystore = Wallet.createKeystore({account, password, privateKey})

// Print the keystore you created
console.log(JSON.stringify(keystoreObj))

```
</span>

<span id="RecoverKeystore">

# Wallet.recoverKeystore:

参数:

|    Name    |  Type  | Required | Description  |
| :--------: | :----: | :------: | :----------: |
|  password  | string |   True   | 密码 |
|   keystoreObj  | json |   True   |   keystore  |

示例:

```shell
let password = '12345678'

let keystoreObj = JSON.parse({
	"account": "myaccount",
	"crypto": {
		"cipher": "aes-128-ctr",
		"ciphertext": "ac6...",
		"cipherparams": {
			"iv": "f07..."
		},
		"mac": "403...",
		"kdf": "scrypt",
		"kdfparams": {
			"dklen": 32,
			"n": 262144,
			"r": 1,
			"p": 8,
			"salt": "3fc..."
		}
	},
	"id": "377...",
	"version": 3
})

// Recovery of Account from Keystore
let keys = Wallet.recoverKeystore(password, keystoreStrObj);

// Print account private key
console.log(keys.privateKey)

// Print account public key
console.log(keys.privateKey)
```
</span>

<span id="CreateMnemonic">

# Wallet.createMnemonic:

参数:

无

示例:

```shell
Wallet.createMnemonic().then(data => {
  // 输出助记词
  console.log(data.mnemonic)

  // 输出私钥
  console.log(data.privateKey)

  // 输出公钥
  console.log(data.publicKey)
}).catch(error=>{

  // 异常处理
  console.log(error)
})
```
</span>

<span id="RecoverMnemonic">

# Wallet.recoverMnemonic:

参数:

|    name    |  Type  | Required | Description  |
| :--------: | :----: | :------: | :----------: |
|  mnemonic  | string |   True   | 助记词 |

示例:

```shell
let mnemonic = 'output define output remember special physical entry unlock vendor track mountain young federal diary need struggle dawn staff buzz filter sound gun unaware'

Wallet.recoverMnemonic(mnemonic).then(keys => {
  // 打印私钥
  console.log(keys.privateKey)

  // 打印公钥
  console.log(keys.publicKey)
}).catch(error=>{

  // 异常处理
  console.log(error)
})
```
</span>

<span id="Stake">

# Wallet.stake:

示例:

|    name    |  Type  | Required | Description  |
| :--------: | :----: | :------: | :----------: |
|  params  | Object |   True   |  |
|  params.amount  | number |   True   | 金额 |
|  [params.target]  | string |   False   | 您要为其设置质押的目标，可选的值为：space|time|vote，默认：vote |
|  senderInfo  | Object |   True   |  |
|  senderInfo.account  | string |   True   | 账号 |
|  senderInfo.privateKey  | string |   True   | 私钥 |

示例:

```shell
let sender = {
    account: 'myaccount',
    privateKey: 'b4e0391643ff9be326a6ddfa543df0e0c2e37b7e11ed2f45590c62a5d5f09d9f'
}

// stake time
Wallet.stake({
  amount: 1,
  target: "time"
}, sender).then(response=>{
  if(response && response.errcode == 0){
    console.log(stake success!)
  } else {
    throw response.errcode;
  }
}).catch(error=>{
  console.log(error)
})

// stake space
Wallet.stake({
  amount: 1,
  target: "space"
}, sender).then(response=>{
  if(response && response.errcode == 0){
    console.log(stake success!)
  } else {
    throw response.errcode;
  }
}).catch(error=>{
  console.log(error)
})
```
</span>

<span id="Transaction">

# Wallet.sendTransaction:

参数:

|    name    |  Type  | Required | Description  |
| :--------: | :----: | :------: | :----------: |
|  params  | Object |   True   |  |
|  params.from  | string |   True   | 转账方账号 |
|  params.to  | string |   True   | 收款方账号 |
|  params.value  | number |   True   |  |
|  [params.memo]  | string |   True   | 不能超出32个字符 |
|  privateKey  | string |   True   | 私钥 |

示例:

```shell
let params = {
  from: 'myaccount',
  memo: 'accounttest',
  to: 'senderaccount',
  value: '1'
}

let privateKey = '6ec664b993664abc4c197982b9ae48f7a37f1b4664f5981955453f1e13ec5b83'

// Transaction
Wallet.sendTransaction(params, privateKey).then(response=>{
  if(response && response.errcode == 0){
    console.log(stake success!)
  } else {
    throw response.errcode;
  }
}).catch(error=>{
    console.log(error)
})
```
</span>
