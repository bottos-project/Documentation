# Wallet SDK

## Classes

<dl>
<dt><a href="#BottosWalletSDK">BottosWalletSDK</a></dt>
<dd></dd>
</dl>

## Objects

<dl>
<dt><a href="#Api">Api</a> : <code>object</code></dt>
<dd></dd>
<dt><a href="#Contract">Contract</a> : <code>object</code></dt>
<dd></dd>
<dt><a href="#Tool">Tool</a> : <code>object</code></dt>
<dd></dd>
<dt><a href="#Wallet">Wallet</a> : <code>object</code></dt>
<dd></dd>
</dl>

## Typedefs

<dl>
<dt><a href="#functionCallback">functionCallback</a> : <code>function</code></dt>
<dd><p>This callback is displayed as a global member.</p>
</dd>
<dt><a href="#originFetchTemplate">originFetchTemplate</a> : <code>Object</code></dt>
<dd></dd>
</dl>

<a name="BottosWalletSDK"></a>

## BottosWalletSDK
**Kind**: global class  

* [BottosWalletSDK](#BottosWalletSDK)
    * [new BottosWalletSDK(config)](#new_BottosWalletSDK_new)
    * [.Api](#BottosWalletSDK+Api)
    * [.Tool](#BottosWalletSDK+Tool)
    * [.Wallet](#BottosWalletSDK+Wallet)
    * [.Contract](#BottosWalletSDK+Contract)
    * [.setBaseUrl(baseUrl)](#BottosWalletSDK+setBaseUrl)

<a name="new_BottosWalletSDK_new"></a>

### new BottosWalletSDK(config)
Represents the BottosWalletSDK.


| Param | Type | Default |
| --- | --- | --- |
| config | <code>Object</code> |  | 
| [config.baseUrl] | <code>string</code> | <code>&quot;http://localhost:8689/v1&quot;</code> | 
| [config.version] | <code>number</code> | <code>1</code> | 
| [config.crypto] | <code>Object</code> | <code>BTCryptTool</code> | 

<a name="BottosWalletSDK+Api"></a>

### bottosWalletSDK.Api
See [Api](#Api).

**Kind**: instance property of [<code>BottosWalletSDK</code>](#BottosWalletSDK)  
<a name="BottosWalletSDK+Tool"></a>

### bottosWalletSDK.Tool
See [Tool](#Tool).

**Kind**: instance property of [<code>BottosWalletSDK</code>](#BottosWalletSDK)  
<a name="BottosWalletSDK+Wallet"></a>

### bottosWalletSDK.Wallet
See [Wallet](#Wallet).

**Kind**: instance property of [<code>BottosWalletSDK</code>](#BottosWalletSDK)  
<a name="BottosWalletSDK+Contract"></a>

### bottosWalletSDK.Contract
See [Contract](#Contract).

**Kind**: instance property of [<code>BottosWalletSDK</code>](#BottosWalletSDK)  
<a name="BottosWalletSDK+setBaseUrl"></a>

### bottosWalletSDK.setBaseUrl(baseUrl)
**Kind**: instance method of [<code>BottosWalletSDK</code>](#BottosWalletSDK)  

| Param | Type | Description |
| --- | --- | --- |
| baseUrl | <code>string</code> | The baseUrl used in request. |

<a name="Api"></a>

## Api : <code>object</code>
**Kind**: global namespace  

* [Api](#Api) : <code>object</code>
    * [.chain_id](#Api.chain_id)
    * [.request(url, params, [method])](#Api.request)
    * [.getAbi(contract, [callback])](#Api.getAbi) ⇒ <code>Promise.&lt;Object&gt;</code> \| <code>undefined</code>
    * [.getBlockHeader([callback])](#Api.getBlockHeader) ⇒ <code>Promise.&lt;Object&gt;</code> \| <code>undefined</code>

<a name="Api.chain_id"></a>

### Api.chain_id
Documented as Api.chain_id

**Kind**: static property of [<code>Api</code>](#Api)  
<a name="Api.request"></a>

### Api.request(url, params, [method])
**Kind**: static method of [<code>Api</code>](#Api)  

| Param | Type | Default |
| --- | --- | --- |
| url | <code>string</code> |  | 
| params | <code>Object</code> |  | 
| [method] | <code>string</code> | <code>&quot;POST&quot;</code> | 

<a name="Api.getAbi"></a>

### Api.getAbi(contract, [callback]) ⇒ <code>Promise.&lt;Object&gt;</code> \| <code>undefined</code>
Returns the abi. If callback is undefined, this function will return a promise.

**Kind**: static method of [<code>Api</code>](#Api)  

| Param | Type | Description |
| --- | --- | --- |
| contract | <code>string</code> | The contract name. |
| [callback] | [<code>functionCallback</code>](#functionCallback) | The optional callback. |

<a name="Api.getBlockHeader"></a>

### Api.getBlockHeader([callback]) ⇒ <code>Promise.&lt;Object&gt;</code> \| <code>undefined</code>
Documented as Api.getBlockHeader.

**Kind**: static method of [<code>Api</code>](#Api)  
**Returns**: <code>Promise.&lt;Object&gt;</code> \| <code>undefined</code> - If callback is undefined, a promise will be returned.  

| Param | Type |
| --- | --- |
| [callback] | [<code>functionCallback</code>](#functionCallback) | 

<a name="Contract"></a>

## Contract : <code>object</code>
**Kind**: global namespace  

* [Contract](#Contract) : <code>object</code>
    * [.deployContract(param, senderInfo)](#Contract.deployContract) ⇒ <code>Promise.&lt;Object&gt;</code>
    * [.deployABI(param, senderInfo)](#Contract.deployABI) ⇒ <code>Promise.&lt;Object&gt;</code>
    * [.callContract(originFetchTemplate, privateKey)](#Contract.callContract) ⇒ <code>Promise.&lt;Object&gt;</code>

<a name="Contract.deployContract"></a>

### Contract.deployContract(param, senderInfo) ⇒ <code>Promise.&lt;Object&gt;</code>
Deploy a contract.

**Kind**: static method of [<code>Contract</code>](#Contract)  

| Param | Type | Default | Description |
| --- | --- | --- | --- |
| param | <code>Object</code> |  |  |
| [param.vm_type] | <code>number</code> | <code>1</code> | vm_type, now is 1. |
| [param.vm_version] | <code>number</code> | <code>1</code> | vm_version, now is 1. |
| param.contract_code | <code>Uint8Array</code> \| <code>ArrayBuffer</code> |  | wasm file buffer. |
| senderInfo | <code>Object</code> |  | The sender |
| senderInfo.account | <code>string</code> |  | sender's account |
| senderInfo.privateKey | <code>string</code> \| <code>Uint8Array</code> |  | sender's privateKey |

<a name="Contract.deployABI"></a>

### Contract.deployABI(param, senderInfo) ⇒ <code>Promise.&lt;Object&gt;</code>
Deploy an abi.

**Kind**: static method of [<code>Contract</code>](#Contract)  

| Param | Type | Description |
| --- | --- | --- |
| param | <code>Object</code> |  |
| param.contract_abi | <code>string</code> \| <code>Uint8Array</code> \| <code>ArrayBuffer</code> | ABI content or file buffer. |
| senderInfo | <code>Object</code> | The sender |
| senderInfo.account | <code>string</code> | sender's account |
| senderInfo.privateKey | <code>string</code> \| <code>Uint8Array</code> | sender's privateKey |

<a name="Contract.callContract"></a>

### Contract.callContract(originFetchTemplate, privateKey) ⇒ <code>Promise.&lt;Object&gt;</code>
**Kind**: static method of [<code>Contract</code>](#Contract)  

| Param | Type |
| --- | --- |
| originFetchTemplate | <code>Object</code> | 
| privateKey | <code>string</code> \| <code>Uint8Array</code> | 

<a name="Tool"></a>

## Tool : <code>object</code>
**Kind**: global namespace  

* [Tool](#Tool) : <code>object</code>
    * [.buf2hex(buffer)](#Tool.buf2hex) ⇒ <code>string</code>
    * [.getRequestParams(originFetchTemplate, privateKey)](#Tool.getRequestParams) ⇒ <code>Promise.&lt;Object&gt;</code>

<a name="Tool.buf2hex"></a>

### Tool.buf2hex(buffer) ⇒ <code>string</code>
**Kind**: static method of [<code>Tool</code>](#Tool)  
**Returns**: <code>string</code> - Hexadecimal string.  

| Param | Type | Description |
| --- | --- | --- |
| buffer | <code>Uint8Array</code> | Uint8Array buffer. |

<a name="Tool.getRequestParams"></a>

### Tool.getRequestParams(originFetchTemplate, privateKey) ⇒ <code>Promise.&lt;Object&gt;</code>
**Kind**: static method of [<code>Tool</code>](#Tool)  

| Param | Type | Description |
| --- | --- | --- |
| originFetchTemplate | [<code>originFetchTemplate</code>](#originFetchTemplate) |  |
| privateKey | <code>string</code> \| <code>Uint8Array</code> | Your private key. |

<a name="Wallet"></a>

## Wallet : <code>object</code>
**Kind**: global namespace  

* [Wallet](#Wallet) : <code>object</code>
    * [.createAccountByIntro(params)](#Wallet.createAccountByIntro) ⇒ <code>Object</code>
    * [.createKeys()](#Wallet.createKeys) ⇒ <code>Object</code>
    * [.createAccountWithIntro(params, referrerInfo)](#Wallet.createAccountWithIntro) ⇒ <code>Promise.&lt;Object&gt;</code>
    * [.recover(password, keyObject)](#Wallet.recover) ⇒ <code>Uint8Array</code>
    * [.getAccountInfo(account_name)](#Wallet.getAccountInfo) ⇒ <code>Promise.&lt;Object&gt;</code>
    * [.sendTransaction(params, privateKey)](#Wallet.sendTransaction) ⇒ <code>Promise.&lt;Object&gt;</code>
    * [.stake(amount, privateKey)](#Wallet.stake) ⇒ <code>Promise.&lt;Object&gt;</code>
    * [.unstake(amount, privateKey)](#Wallet.unstake) ⇒ <code>Promise.&lt;Object&gt;</code>
    * [.claim(amount, privateKey)](#Wallet.claim) ⇒ <code>Promise.&lt;Object&gt;</code>

<a name="Wallet.createAccountByIntro"></a>

### Wallet.createAccountByIntro(params) ⇒ <code>Object</code>
**Kind**: static method of [<code>Wallet</code>](#Wallet)  
**Returns**: <code>Object</code> - keystore  

| Param | Type | Description |
| --- | --- | --- |
| params | <code>Object</code> | the params required for create keystore |
| params.account | <code>string</code> | account |
| params.password | <code>string</code> | password |
| params.privateKey | <code>string</code> \| <code>Uint8Array</code> | privateKey |

<a name="Wallet.createKeys"></a>

### Wallet.createKeys() ⇒ <code>Object</code>
Create public and private key pair

**Kind**: static method of [<code>Wallet</code>](#Wallet)  
**Returns**: <code>Object</code> - keys  
<a name="Wallet.createAccountWithIntro"></a>

### Wallet.createAccountWithIntro(params, referrerInfo) ⇒ <code>Promise.&lt;Object&gt;</code>
register account on chain

**Kind**: static method of [<code>Wallet</code>](#Wallet)  

| Param | Type | Description |
| --- | --- | --- |
| params | <code>Object</code> | The params |
| params.account | <code>string</code> | The new user's account |
| params.publicKey | <code>string</code> \| <code>Uint8Array</code> | The publicKey provided by the new user |
| referrerInfo | <code>Object</code> | The referrer |
| referrerInfo.account | <code>string</code> | referrer's account |
| referrerInfo.privateKey | <code>string</code> \| <code>Uint8Array</code> | referrer's privateKey |

<a name="Wallet.recover"></a>

### Wallet.recover(password, keyObject) ⇒ <code>Uint8Array</code>
**Kind**: static method of [<code>Wallet</code>](#Wallet)  
**Returns**: <code>Uint8Array</code> - privateKey  

| Param | Type | Description |
| --- | --- | --- |
| password | <code>string</code> | password |
| keyObject | <code>Object</code> | the keystore |

<a name="Wallet.getAccountInfo"></a>

### Wallet.getAccountInfo(account_name) ⇒ <code>Promise.&lt;Object&gt;</code>
**Kind**: static method of [<code>Wallet</code>](#Wallet)  

| Param | Type |
| --- | --- |
| account_name | <code>string</code> | 

<a name="Wallet.sendTransaction"></a>

### Wallet.sendTransaction(params, privateKey) ⇒ <code>Promise.&lt;Object&gt;</code>
**Kind**: static method of [<code>Wallet</code>](#Wallet)  

| Param | Type |
| --- | --- |
| params | <code>Object</code> | 
| params.from | <code>string</code> | 
| params.to | <code>string</code> | 
| params.value | <code>string</code> \| <code>number</code> | 
| privateKey | <code>string</code> | 

<a name="Wallet.stake"></a>

### Wallet.stake(amount, privateKey) ⇒ <code>Promise.&lt;Object&gt;</code>
**Kind**: static method of [<code>Wallet</code>](#Wallet)  

| Param | Type |
| --- | --- |
| amount | <code>number</code> | 
| privateKey | <code>string</code> \| <code>Uint8Array</code> | 

<a name="Wallet.unstake"></a>

### Wallet.unstake(amount, privateKey) ⇒ <code>Promise.&lt;Object&gt;</code>
**Kind**: static method of [<code>Wallet</code>](#Wallet)  

| Param | Type |
| --- | --- |
| amount | <code>number</code> | 
| privateKey | <code>string</code> \| <code>Uint8Array</code> | 

<a name="Wallet.claim"></a>

### Wallet.claim(amount, privateKey) ⇒ <code>Promise.&lt;Object&gt;</code>
**Kind**: static method of [<code>Wallet</code>](#Wallet)  

| Param | Type |
| --- | --- |
| amount | <code>number</code> | 
| privateKey | <code>string</code> \| <code>Uint8Array</code> | 

<a name="functionCallback"></a>

## functionCallback : <code>function</code>
This callback is displayed as a global member.

**Kind**: global typedef  

| Param | Type | Description |
| --- | --- | --- |
| err | <code>\*</code> | The callback error. |
| result | <code>\*</code> | The success result. |

<a name="originFetchTemplate"></a>

## originFetchTemplate : <code>Object</code>
**Kind**: global typedef  
**Properties**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| [originFetchTemplate.version] | <code>number</code> | <code>1</code> | Default value is 1. |
| originFetchTemplate.sender | <code>string</code> |  | Default value is bottos. |
| [originFetchTemplate.contract] | <code>string</code> | <code>&quot;bottos&quot;</code> | The contract. Default value is bottos. |
| originFetchTemplate.method | <code>string</code> |  |  |
| originFetchTemplate.param | <code>Object</code> |  |  |
| [originFetchTemplate.sig_alg] | <code>number</code> | <code>1</code> | Default value is 1. |

