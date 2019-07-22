# Bottos Wallet JavaScript API

SDK支持以下功能:

1. 创建账号keystore
2. 创建账号mnemonic
3. 从keystore恢复账号
4. 从mnemonic恢复账号
5. 转账、质押

[文档](./Wallet-API-中文.md)

## 安装

### Node.js

如果使用NPM

```shell
npm install bottos-sdk-js --save
```

或 yarn

```shell
yarn add bottos-sdk-js
```

## 使用

node方式中引入SDK:

```js
var SDK = require('bottos-sdk-js');
```

browers方式中引入SDK:

```html
<script src="path/to/bottos-sdk-js.min.js"></script>
<!-- or a CDN  -->
<script src="unpkg.com/bottos-sdk-js"></script>
```

文件

您可以在[release page](https://github.com/bottos-project/bottos-sdk-js/releases)上找到bottos-sdk-js.min.js文件

然后:

```js
const Wallet = new SDK({
    baseUrl: "http://localhost:8689/v1"
}).Wallet;
```

现在你可以像下面这样使用它:

创建 keystore:

```js
const account = 'myaccount'
const password = '12345678'
const privateKey = 'b4e0391643ff9be326a6ddfa543df0e0c2e37b7e11ed2f45590c62a5d5f09d9f'
const keystore = Wallet.createKeystore({account, password, privateKey})
```

转账:
```js

const params = {
  from: 'senderAccount',
  memo: 'memo',
  to: 'receiveAccount',
  value: 100,
}
let privateKey = 'b4e0391643ff9be326a6ddfa543df0e0c2e37b7e11ed2f45590c62a5d5f09d9f'

Wallet.sendTransaction(params, privateKey)
  .then(res => {
    console.log('sendTransaction res:', res)
  })
```
您可以在[`example`](https://github.com/bottos-project/bottos-sdk-js/tree/master/example) directory中找到更多示例。
