# Common REST Interface

## Get Block Header Information

**API Function**

> API Description： Get block header information
>
> **APIAddress**
>
> URL:  /v1/block/height
>
> **Response Format**
>
> JSON
>
> **Request Format**
>
> GET
>
> **Request Parameter：**
>
> | Parameter | Mandatory | Type | Default Value | Description |
> | --------- | --------- | ---- | ------------- | ----------- |
> | Null      |           |      |               |             |

**Response Fields：**

| Parameter                | Type       | Description                                                  |
| ------------------------ | ---------- | ------------------------------------------------------------ |
| errcode                  | uint32     | Error code，0-Succeed，others refer to error code chapter    |
| msg                      | string     | response description                                         |
| result                   | jsonObject | response result                                              |
| head_block_num           | uint64     | Block number                                                 |
| head_block_hash          | string     | Previous Block hash value                                    |
| head_block_time          | uint64     | Generating time of block                                     |
| head_block_delegate      | string     | Producer of block                                            |
| cursor_label             | uint32     | Block identity                                               |
| last_consensus_block_num | uint64     | Irreversible Block's number                                  |
| chain_id                 | string     | Chain ID，The chain_id must be the same for all nodes in the same chain |
| head_block_version       | uint64     | Version number of block chain                                |


**Fields Changes**

- Null

  **API Sample**

> Address：<http://127.0.0.1:8689/v1/block/height>

- Request:



  ```
  Null
  ```

- Response:



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

##  Get the block information

**API Functions**

> API： Get block information
>
> **API Address**
> URL:  /v1/block/detail
>
> **Response Format**
>
> JSON
>
> **Request Method**
>
> POST
>
> **Request Parameters：**
>
> | Parameter  | Mandatory  | Type   | Default Value | Description      |
> | ---------- | ---------- | ------ | ------------- | ---------------- |
> | block_num  | FALSE      | uint64 | Null          | Block number     |
> | block_hash | FALSE      | string | Null          | Block hash value |

Note：block_num、block_hash can only choose one of them; If not given in either，it will returns block information of "block 0" in default。

**Response Fields：**

| Parameter               | Type       | Description                                                           |
| ------------------ | ---------- | -------------------------------------------------------------- |
| errcode            | uint32     | Error code，0-succeed，others please refer to the error code chapter.                           |
| msg                | string     | response description                                                       |
| result             | jsonObject | response result                                                       |
| block_num          | uint64     | Block number                                                           |
| prev_block_hash    | string     | Previous Block hash value                                                   |
| block_hash         | string     | Current Block hash value                                                   |
| cursor_block_label | uint32     | Current block identity                                                     |
| block_time         | uint64     | Generate time of the block                                                     |
| trx_merkle_root    | string     | Merkle root value，The hash value of all transactions packaged by the block                       |
| delegate           | string     | Producer name                                                     |
| delegate_sign      | string     | Producer signature                                                     |
| ResourceReceipt | jsonObject | Transaction consumption of resources |
| account_name | string | account name |
| space_token_cost | uint64 | Space resources consumed by exchanges |
| time_token_cost | uint64 | Time resources consumed by exchanges |
| trxs               | jsonArray  | The list of transactions packaged in the current block, as described in the response field in the "Query Transaction information" section,Plus TrxHash |
| TrxHash | string | transaction hash |

**Field changes**

- Null

  **API Smple**

> Address：<http://127.0.0.1:8689/v1/block/detail>

- Request:

  

  ```
  {
  	"block_num": 32,
  	"block_hash": "eeca4c8ee8410cf256d27e5e676f6ce395ebdffade431b52775bb20aa60b8929"
  }
  ```

- Response:



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

## Get hash for signature

**API Function**

> API Description：Get hash for signature
>
> **APIAddress**
>
> URL:  /v1/transaction/getHashForSign
>
> **Response Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter | Mandatory | Type   | Default Value | Description                            |
| --------- | --------- | ------ | ------------- | -------------------------------------- |
| sender    | TRUE      | string | Null          | Sender                                 |
| contract  | TRUE      | string | Null          | Contract name                          |
| method    | TRUE      | string | Null          | Contract method                        |
| param     | TRUE      | string | Null          | Business parameter, hexadecimal string |

**Response Fields：**

| Parameter    | Type       | Description                                                  |
| ------------ | ---------- | ------------------------------------------------------------ |
| errcode      | uint32     | Error code，0-Succeed，others refer to error code chapter    |
| msg          | string     | response description                                         |
| result       | jsonObject | response result                                              |
| trx_hash     | string     | Hash value of each transaction                               |
| trx          | jsonObject | Transaction details                                          |
| version      | uint32     | Version number of block chain                                |
| cursor_num   | uint64     | Latest block number，get by querying the block header        |
| cursor_label | uint32     | Latest block label，get by querying the block header         |
| lifetime     | uint64     | Transaction exipired time，by ways of getting block header, plus a certain delay |
| sender       | string     | Sender                                                       |
| contract     | string     | Contract name                                                |
| method       | string     | Contract method                                              |
| param        | string     | Business parameter，hexadecimal string                       |
| sig_alg      | uint32     | Sign algorism                                                |
| signature    | string     | Signature value                                              |

**Fields Changes**

- Null

  **API Sample**

> Address：<http://127.0.0.1:8689/v1/transaction/getHashForSign>

- Request:

  ```
  {
  	"sender": "bottos",
  	"contract": "bottos",
  	"method": "newaccount",
  	"param": "dc0002da000a626f74746f7374657374da008230343931363362623834633739393438316131633630616331323265393431663566306233653639346435326439626530613862316561343730666361636266323564623439306330336334376564356465393862653735623435376333383730386465376539653935653461306263653634356539633033353861386435393638"
  }
  ```

  

- Response:

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

## Send the transaction information

**API Function**

> API Description： Send the transaction information
>
> **APIAddress**
>
> URL:  /v1/transaction/send
>
> **Response Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter         | Mandatory | Type    | Default Value | Description                                                      |
| ------------ | ---- | ------ | -------- | --------------------------------------------------------- |
| version      | TRUE | uint32 | 1        | Version number of block chain                                                  |
| cursor_num   | TRUE | uint64 | Null     | Latest block number，getting by querying header block      |
| cursor_label | TRUE | uint32 | Null     | Latest block identity，get by querying the block header                          |
| lifetime     | TRUE | uint64 | Null     | Transaction exipired time，by ways of getting block header, plus a certain delay，it is recommanded to delay by 100 seconds |
| sender       | TRUE | string | Null     | Sender                                                    |
| contract     | TRUE | string | Null     | Contract name                                                  |
| method       | TRUE | string | Null     | Contract method                                                  |
| param        | TRUE | string | Null     | Business parameter, hexadecimal string                                  |
| sig_alg      | TRUE | uint32 | 1        | Sign algorism                                                  |
| signature    | TRUE | string | Null     | Signature value                                                    |

**Response Fields：**

| Parameter         | Type       | Description                                       |
| ------------ | ---------- | ------------------------------------------ |
| errcode      | uint32     | Error code，0-Succeed，others refer to error code chapter       |
| msg          | string     | response description                                   |
| result       | jsonObject | response result                                   |
| trx_hash     | string     | Hash value of each transaction                                 |
| trx          | jsonObject | Transaction details                                   |
| version      | uint32     | Version number of block chain                                   |
| cursor_num   | uint64     | Latest block number，get by querying the block header             |
| cursor_label | uint32     | Latest block label，get by querying the block header           |
| lifetime     | uint64     | Transaction exipired time，by ways of getting block header, plus a certain delay |
| sender       | string     | Sender                                     |
| contract     | string     | Contract name                                   |
| method       | string     | Contract method                                   |
| param        | string     | Business parameter，hexadecimal string            |
| sig_alg      | uint32     | Sign algorism                                   |
| signature    | string     | Signature value                                     |

**Fields Changes**

- Null

  **API Sample**

> Address：<http://127.0.0.1:8689/v1/transaction/send>

- Request:

  

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

- Response:

  

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

## Query Transaction Information

**API Function**

> API Description： Query transaction information
>
> **APIAddress**
>
> URL:  /v1/transaction/get
>
> **Response Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter     | Mandatory | Type   | Default Value | Description       |
| -------- | ---- | ------ | ------ | ---------- |
| trx_hash | TRUE | string | Null     | Hash value of each transaction |

**Response Fields：**

| Parameter       | Type       | Description                                       |
| ---------- | ---------- | ------------------------------------------ |
| errcode    | uint32     | Error code，0-Succeed，others refer to error code chapter       |
| msg        | string     | response description                                   |
| result     | jsonObject | response result                                   |
| version    | uint32     | Version number of block chain                                   |
| cursor_num | uint64     | Latest block number，get by querying the block header             |
| cursor_lab | uint32     | Latest label of block，get by querying the block header           |
| lifetime   | uint64     | Transaction exipired time，by ways of getting block header, plus a certain delay |
| sender     | string     | Sender                                     |
| contract   | string     | Contract name                                   |
| method     | string     | Contract method                                   |
| param      | jsonObject | Business Parameter                                   |
| sig_alg    | uint32     | Sign algorism                                   |
| signature  | string     | Signature value                                     |

**Fields Changes**

- Null

  **API Sample**

> Address：<http://127.0.0.1:8689/v1/transaction/get>

- Request:

  

  ```
  {
  	"trx_hash": "8a403642ea7b51595d1a1454b43b83ba62420629581c3d2f0d2143342aa89c9f"
  }
  ```

- Response:

  

  ```
   HTTP/1.1 200 OK
  {
    "errcode": 0,
    "msg": "success",
    "result": {
        "Transaction": {
            "version": 65536,
            "cursor_num": 1390,
            "cursor_label": 384655640,
            "lifetime": 1548324148,
            "sender": "bottos",
            "contract": "bottos",
            "method": "transfer",
            "param": {
                "from": "bottos",
                "memo": "",
                "to": "accountcreate5",
                "value": 10000000000
            },
            "sig_alg": 1,
            "signature": "97a3a4d4e103ed60e94cb79ba83fa0bae7eb623feceee6222dfd06156cd705b35ee5d85a07ab8b2e1ca95267408d4bf0b9d78fc7aa063e7d4a5ba67a1953b1c3"
        },
        "ResourceReceipt": null,
        "TrxHash": "8a403642ea7b51595d1a1454b43b83ba62420629581c3d2f0d2143342aa89c9f"
    }
  }
  ```

## Query Transaction Status

**API Function**

> API Description： Query transaction status
>
> **APIAddress**
>
> URL:  /v1/transaction/status
>
> **Response Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter | Mandatory | Type   | Default Value | Description                    |
| --------- | --------- | ------ | ------------- | ------------------------------ |
| trx_hash  | TRUE      | string | Null          | Hash value of each transaction |

**Response Fields：**

| Parameter | Type       | Description                                                  |
| --------- | ---------- | ------------------------------------------------------------ |
| errcode   | uint32     | Error code，0-Succeed，others refer to error code chapter    |
| msg       | string     | response description                                         |
| result    | jsonObject | response result                                              |
| status    | string     | query transaction status result.<br />”committed“：Transaction has successfully committed；<br />”not found“：Transaction execute failed；<br />”packed“：Transaction has packed；<br/>”pending“：Transaction submitted but not processed |

**Fields Changes**

- Null

  **API Sample**

> Address：<http://127.0.0.1:8689/v1/transaction/status

- Request:



  ```
  {
  	"trx_hash": "8a403642ea7b51595d1a1454b43b83ba62420629581c3d2f0d2143342aa89c9f"
  }
  ```

- Response:



  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "status": "committed"
      }
  }
  ```


## Query Accounts Brief Information

**API Function**

> API Description： Query accounts brief information
>
> **APIAddress**
>
> URL:  /v1/account/brief
>
> **Response Format**
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

**Response Fields：**

| Parameter              | Type       | Description                                 |
| ----------------- | ---------- | ------------------------------------ |
| errcode           | uint32     | Error code，0-Succeed，others refer to error code chapter |
| msg               | string     | response description                             |
| result            | jsonObject | response result                             |
| account_name      | string     | Account name                             |
| pubkey            | string     | Public key                                 |
| balance           | string     | Token value                            |

**Fields Changes**

- Null

  **API Sample**

> Address：<http://127.0.0.1:8689/v1/account/brief>

- Request:

  

  ```
  {
  	"account_name":"bottos"
  }
  ```

- Response:



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

## Query Accounts Detail Information

**API Function**

> API Description： Query accounts detail information
>
> **APIAddress**
>
> URL:  /v1/account/info
>
> **Response Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter    | Mandatory | Type   | Default Value | Description  |
| ------------ | --------- | ------ | ------------- | ------------ |
| account_name | TRUE      | string | Null          | Account name |

**Response Fields：**

| Parameter              | Type       | Description                                                  |
| ---------------------- | ---------- | ------------------------------------------------------------ |
| errcode                | uint32     | Error code，0-Succeed，others refer to error code chapter    |
| msg                    | string     | response description                                         |
| result                 | jsonObject | response result                                              |
| account_name           | string     | Account name                                                 |
| pubkey                 | string     | Public key                                                   |
| balance                | string     | Token value，                                                |
| staked_balance         | string     | Staked BTO value                                             |
| staked_space_balance   | string     | Staked BTO value for SPACE(Transactions need to consume SPACE) |
| staked_time_balance    | string     | Staked BTO value for TIME(Transactions need to consume TIME) |
| unStaking_balance      | string     | Under unstakeing BTO value                                   |
| unStaking_timestamp    | uint64     | Unstake token timestamp（ Unix timestamp ）                  |
| authority              | jsonObject | Multi-sign account authorization information                 |
| author_account         | string     | authorization account                                        |
| weight                 | uint32     | authorization account weight                                 |
| resource               | jsonObject | Resource information                                         |
| free_available_space   | uint64     | The number of SPACEs that can be used within the free quota  |
| free_used_space        | uint64     | The number of SPACEs used within the free quota              |
| stake_available_space  | uint64     | The number of SPACEs that can be used within the scope of the pledge |
| stake_used_space       | uint64     | Number of SPACEs used within the scope of pledge             |
| free_available_time    | uint64     | The number of TIMEs available for free credit                |
| free_used_time         | uint64     | The number of TIMEs that have been used within the free credit |
| stake_available_time   | uint64     | The number of TIMEs that can be used within the pledge       |
| stake_used_time        | uint64     | The number of TIMEs that have been used within the pledge    |
| unClaimed_block_reward | string     | Number of bonuses                                            |
| unClaimed_vote_reward  | string     | Number of voting rewards                                     |
| deploy_contract_list   | string     | List of contracts deployed for this account                  |
| vote                   | jsonObject | vote information                                             |
| delegate               | string     | the delegate who were voted                                  |
| votes                  | string     | Number of votes                                              |

Note：balance、staked_balance、staked_space_balance、staked_time_balance、unStaking_balance, the summary value of that three is the total token value of the change account.

**Fields Changes**

- Null

  **API Sample**

> Address：<http://127.0.0.1:8689/v1/account/info>

- Request:

  

  ```
  {
  	"account_name":"bottostest"
  }
  ```

- Response:



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

## 

## Query Contract ABI

**API Function**

> API Description： Query contract ABI
>
> **APIAddress**
>
> URL:  /v1/contract/abi 
>
> **Response Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter | Mandatory | Type   | Default Value | Description   |
| --------- | --------- | ------ | ------------- | ------------- |
| contract  | TRUE      | string | Null          | Contract name |

**Response Fields：**

| Parameter        | Type       | Description                                                                                |
| ----------- | ---------- | ----------------------------------------------------------------------------------- |
| errcode     | uint32     | Error code，0-Succeed，others refer to error code chapter                                                |
| msg         | string     | response description                                                                            |
| result      | jsonObject | response result                                                                            |
| types       | jsonObject | reserved field                                                                            |
| structs     | jsonArray  | The struct list of method which included in the contract                                                            |
| name        | string     | struct name，typically the custom contract method name aliases                                              |
| base        | string     | Father method，usually be Null                                                                    |
| fields      | jsonObject | method's inputting parameters' structs                                                                      |
| name        | string     | Parameter-1，take a registered account as an example：Account name                                                    |
| pubkey      | string     | Parameter-2，take a registered account as an example：Public key                                                        |
| actions     | jsonArray  | The method included in the contract                                                                    |
| action_name | string     | Contract method name，relate to “Send the transaction information”'s request parameter's method value                                |
| type        | string     | Same as name, the struct name, typically the custom contract method name aliases                                      |
| tables      | jsonArray  | Describe how the contract data is stored, defining the table name, Type,key value, Type,value Type. Built-in contract the field is null |
| table_name  | string     | Table name for contract storage                                                                      |
| index_type  | string     | Index Type，default is string                                                            |
| key_names   | jsonArray  | Key value for contract data storage                                                                 |
| key_types   | jsonArray  | key value's Type，default is string                                                           |
| type        | string     | Value values corresponding to contract data key, usually be structs                                             |

**Fields Changes**

- Null

  **API Sample**

> Address：<http://127.0.0.1:8689/v1/contract/abi >

- Request:

  

  ```
  {
  	"contract":"test1@tinaailian"
  }
  ```

- Response:



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

## Query contract code

**API Function**

> API Description： Query contract code
>
> **APIAddress**
>
> URL:  /v1/contract/code
>
> **Response Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter     | Mandatory | Type   | Default Value | Description     |
| -------- | ---- | ------ | ------ | -------- |
| contract | TRUE | string | Null     | Contract name |

**Response Fields：**

| Parameter    | Type       | Description                                 |
| ------- | ---------- | ------------------------------------ |
| errcode | uint32     | Error code，0-succeed，others refer to error code chapters |
| msg     | string     | response description                             |
| result  | jsonObject | response result                             |

**Fields Changes**

- Null

  **API sample**

> Address：<http://127.0.0.1:8689/v1/contract/code >

- Request:

  

  ```
  {
  	"contract":"usermng"
  }
  ```

- Response:

  

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "",
      "result": "7b0a2020227479706573223a205b5d2c0a20202273747275637473223a205b7b0a202020202020226e616d65223a202255736572496e666f222c0a2020202020202262617365223a2022222c0a202020202020226669656c6473223a207b0a20202020202020202020226469646964223a2022737472696e67222c0a2020202020202020202022696e666f223a2022737472696e67220a20202020202020207d0a202020207d2c7b0a202020202020226e616d65223a2022557365724c6f67696e222c0a2020202020202262617365223a2022222c0a202020202020226669656c6473223a207b0a2020202020202020202022757365724e616d65223a2022737472696e67222c0a202020202020202020202272616e646f6d4e756d223a202275696e743332220a20202020202020207d0a202020207d2c7b0a202020202020226e616d65223a20225573657242617365496e666f222c0a2020202020202262617365223a2022222c0a202020202020226669656c6473223a207b0a2020202020202020202022696e666f223a2022737472696e67220a20202020202020207d0a202020207d0a20205d2c0a202022616374696f6e73223a205b7b0a20202020202022616374696f6e5f6e616d65223a202272656775736572222c0a2020202020202274797065223a202255736572496e666f220a202020207d2c7b0a20202020202022616374696f6e5f6e616d65223a2022757365726c6f67696e222c0a2020202020202274797065223a2022557365724c6f67696e220a202020207d0a20205d2c0a2020227461626c6573223a205b7b0a202020202020227461626c655f6e616d65223a202275736572726567696e666f222c0a20202020202022696e6465785f74797065223a2022737472696e67222c0a202020202020226b65795f6e616d6573223a205b0a2020202020202020226469646964220a2020202020205d2c0a202020202020226b65795f7479706573223a205b0a202020202020202022737472696e67220a2020202020205d2c0a2020202020202274797065223a20225573657242617365496e666f220a202020207d0a20205d0a7d0a"
  }
  ```

## Query All Producers

**API Functions**

> API Description： Query all producers
>
> **APIAddress**
>
> URL:  /v1/delegate/getall
>
> **Response Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter  | Mandatory | Type   | Default Value | Description         |
| ----- | ---- | ------ | ------ | ------------ |
| limit | TRUE | uint32 | Null     | Query numbers     |
| start | TRUE | uint32 | 0      | Query start number |

**Response Fields：**

| Parameter         | Type      | Description                                 |
| ------------ | --------- | ------------------------------------ |
| errcode      | uint32    | Error code，0-Succeed，others refer to error code chapter |
| msg          | string    | response description                             |
| result       | jsonArray | response result                             |
| account_name | string    | Account name                             |
| public_key   | string    | Public key                                 |
| location     | string    | Node geolocation information, such as "shanghai,china" |
| desc         | string    | Node descriptions                         |

**Fields Changes**

- Null

  **API Sample**

> Address：<http://127.0.0.1:8689/v1/delegate/getall >

- Request:

  

  ```
  {
      "limit": 10,
      "start": 0
  }
  ```

- Response:

  

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


