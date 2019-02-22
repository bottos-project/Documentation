# Wallet REST Interface

## One-Step to create wallet

**API FUNCTION**

> API Description: One step to create the wallet that is stored by default under directory of Linux： /home/bottos/bot/
>
> **API Address**
>
> URL:  /v1/wallet/createwallet 
>
> **Result Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter    | Mandatory | Type   | Default Value | Description     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | Null     | Account name |
| passwd       | TRUE | string | Null     | Password     |

**Response Field:**

| Parameter        | Type       | Description                                               |
| ----------- | ---------- | -------------------------------------------------- |
| errcode     | uint32     | Error code, 0-succeed, others refer to error code chapter               |
| msg         | string     | Response description                                           |
| result      | jsonObject | Response result                                           |
| wallet_name | string     | Generated wallet file name, default is account name+".keystore" in tail |

**Field change**

- Null

  **API Sample**

> Address : <http://127.0.0.1:6869/v1/wallet/createwallet  >

- Request : 

  ```
  {
  	"account_name": "testtest1",
  	"passwd": "Abc123"		
  }
  
  
  ```

- Response : 

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





## Generate Public Private Key Pairs

**API Function**

> API Description: Generate public private key pairs
>
> **API Address**
>
> URL:  /v1/wallet/generatekeypair
>
> **Result Format**
>
> JSON
>
> **Request Format**
>
> GET

**Request Parameter：**

| Parameter | Mandatory | Type | Default Value | Description |
| ---- | ---- | ---- | ------ | ---- |
| Null   |      |      |        |      |

**Response Field:**

| Parameter        | Type       | Description                                 |
| ----------- | ---------- | ------------------------------------ |
| errcode     | uint32     | Error code, 0-succeed, others refer to error code chapter |
| msg         | string     | Response description                             |
| result      | jsonObject | Response result                             |
| public_key  | string     | Public key                                 |
| private_key | string     | Private Key                                 |

**Field change**

- Null

  **API Sample**

> Address : <http://127.0.0.1:6869/v1/wallet/generatekeypair  >

- Request : 

  ```
  Null
  ```

- Response : 

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

## Create Account

**API Function**

> API Description: Create account
>
> **API Address**
>
> URL:  /v1/wallet/createaccount 
>
> **Result Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter         | Mandatory  | Type   | Default Value | Description                                   |
| ------------ | ----- | ------ | ------ | -------------------------------------- |
| account_name | TRUE  | string | Null     | Account name                               |
| public_key   | TRUE  | string | Null     | Public key                                   |
| referrer     | TRUE | string | Null | Referrer account |

**Response Field:**

| Parameter         | Type       | Description                                 |
| ------------ | ---------- | ------------------------------------ |
| errcode      | uint32     | Error code, 0-succeed, others refer to error code chapter |
| msg          | string     | Response description                             |
| result       | jsonObject | Response result and data details               |

**Field change**

- Null

  **API Sample**

> Address : <http://127.0.0.1:6869/v1/wallet/createaccount >

- Request : 

  ```
  {
  	"account_name": "testaccount1",
  	"public_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
  	"referrer": "bottos"	
  }
  ```

- Response : 

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



## Create Wallet by Manual

**API Function**

> API Description: Create wallet manually，wallet file is stored by default in Linux directory： /home/bottos/bot/, and the generated wallet file name is account name +".keystore" in tail by default.
>
> **API Address**
>
> URL:  /v1/wallet/createwalletmanual 
>
> **Result Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter         | Mandatory | Type   | Default Value | Description     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | Null     | Account name |
| private_key  | TRUE | string | Null     | Private Key     |
| passwd       | TRUE | string | Null     | Password     |

**Response Field:**

| Parameter        | Type       | Description                                               |
| ----------- | ---------- | -------------------------------------------------- |
| errcode     | uint32     | Error code, 0-succeed, others refer to error code chapter               |
| msg         | string     | Response description                                           |
| result      | jsonObject | Response result                                           |
| wallet_name | string     | the generated wallet file name, it is account name +".keystore" in tail by default |

**Field change**

- Null

  **API Sample**

> Address : <http://127.0.0.1:6869/v1/wallet/createwalletmanual  >

- Request : 

  ```
  {
  	"account_name": "testtest1",
  	"private_key": "b799ef616830cd7b8599ae7958fbee56d4c8168ffd5421a16025a398b8a4be45",
  	"passwd": "Abc123"
  }
  ```

- Response : 

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



## Open/Unlock wallet

**API Function**

> API Description: Open/Unlock wallet
>
> **API Address**
>
> URL:  /v1/wallet/unlockaccount
>
> **Result Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter         | Mandatory | Type   | Default Value | Description     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | Null     | Account name |
| passwd       | TRUE | string | Null     | Passsword     |

**Response Field:**

| Parameter    | Type       | Description                                 |
| ------- | ---------- | ------------------------------------ |
| errcode | uint32     | Error code, 0-succeed, others refer to error code chapter |
| msg     | string     | Response description                             |
| result  | jsonObject | Response result                             |
| unlock  | bool       | Unlock Result                             |

**Field change**

- Null

  **API Sample**

> Address : <http://127.0.0.1:6869/v1/wallet/unlockaccount  >

- Request : 

  ```
  {
  	"account_name": "testtest1",
  	"passwd": "123456"
  }
  ```

- Response : 

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



## Close/Lock Wallet

**API Function**

> API Description: Close/Lock wallet
>
> **API Address**
>
> URL:  /v1/wallet/lockaccount 
>
> **Result Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter         | Mandatory | Type   | Default Value | Description     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | Null     | Account name |

**Response Field:**

| Parameter    | Type       | Description                                 |
| ------- | ---------- | ------------------------------------ |
| errcode | uint32     | Error code, 0-succeed, others refer to error code chapter |
| msg     | string     | Response description                             |
| result  | jsonObject | Response result                             |
| lock    | bool       | Unlock Result                             |

**Field change**

- Null

  **API Sample**

> Address : <http://127.0.0.1:6869/v1/wallet/lockaccount  >

- Request : 

  ```
  {
  	"account_name": "testtest1"
  }
  ```

- Response : 

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



## Query wallets' list

**API Function**

> API Description: Query wallets' list
>
> **API Address**
>
> URL:  /v1/wallet/list
>
> **Result Format**
>
> JSON
>
> **Request Format**
>
> GET

**Request Parameter：**

| Parameter | Mandatory | Type | Default Value | Description |
| ---- | ---- | ---- | ------ | ---- |
| Null   |      |      |        |      |

**Response Field:**

| Parameter         | Type       | Description                                       |
| ------------ | ---------- | ------------------------------------------ |
| errcode      | uint32     | Error code, 0-succeed, others refer to error code chapter       |
| msg          | string     | Response description                                   |
| result       | jsonObject | Response result                                   |
| wallet_path  | string     | Wallet path+file name                          |
| account_name | string     | Account name                                   |

**Field change**

- Null

  **API Sample**

> Address : <http://127.0.0.1:6869/v1/wallet/list >

- Request : 

  ```
  Null
  ```

- Response : 

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



## Query Public Key

**API Function**

> API Description: Query public Key pair，the precondition to invoke this API: the account must be in opened or unlocked status.
>
> **API Address**
>
> URL:  /v1/wallet/getpublickey
>
> **Result Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter         | Mandatory | Type   | Default Value | Description     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | Null     | Account name |

**Response Field:**

| Parameter         | Type       | Description                                 |
| ------------ | ---------- | ------------------------------------ |
| errcode      | uint32     | Error code, 0-succeed, others refer to error code chapter |
| msg          | string     | Response description                             |
| result       | jsonObject | Response result                             |
| account_name | string     | Account name                             |
| public_key   | string     | Public Key value                               |

**Field change**

- Null

  **API Sample**

> Address : <http://127.0.0.1:6869/v1/wallet/getpublickey>

- Request : 

  ```
  {
  	"account_name":"testtest"
  }
  ```

- Response : 

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



## Sign for HASH

**API Function**

> API Description: sign for HASH
>
> **API Address**
>
> URL:  /v1/wallet/signhash
>
> **Result Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter         | Mandatory | Type   | Default Value | Description         |
| ------------ | ---- | ------ | ------ | ------------ |
| account_name | TRUE | string | Null     | Account name     |
| hash        | TRUE | string | Null     | sha256 Hash value of data |

**Response Field:**

| Parameter       | Type       | Description                                 |
| ---------- | ---------- | ------------------------------------ |
| errcode    | uint32     | Error code, 0-succeed, others refer to error code chapter |
| msg        | string     | Response description                             |
| result     | jsonObject | Response result                             |
| sign_value | string     | Signature value                               |

**Field change**

- Null

  **API Sample**

> Address : <http://127.0.0.1:6869/v1/wallet/signhash

- Request : 

  ```
  {
  	"account_name": "bottos",
  	"hash": "87d80210bc83f8bb233d26d5551a516ad27a4e3ce2a2faaac6eacc4c87fadc3d"
  }
  ```

- Response : 

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "sign_value": "ed6b57fa91ee369af925e4c0545c06f5829ce3d2825949931a2b8816039f53f47160701c779b528abe84f5d6acdb2d9c46de6958e42606d2e4d7b9b072991729"
      }
  }
  ```

