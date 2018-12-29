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
      "msg": "",
      "result": {
          "head_block_num": 87,
          "head_block_hash": "b34806eefc77b88743ab447f43658bf229fd4e5cd9452340e21f3995a5d2054b",
          "head_block_time": 1534213225,
          "head_block_delegate": "alsephina",
          "cursor_label": 2782004555,
          "last_consensus_block_num": 64,
          "chain_id": "4b97b92d2c78bcffe95ebd3067565c73a2931b39d5eb7234b11816dcec54761a"
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
| trxs               | jsonArray  | The list of transactions packaged in the current block, as described in the response field in the "Query Transaction information" section |

**Field changes**

- Null

  **API Smple**

> Address：<http://127.0.0.1:8689/v1/block/detail>

- Request:

  

  ```
  {
  	"block_num": 32,
  	"block_hash": "405a6fb8b91a055a7a4cf007451ce0b31ea6626cb2d56ec050b126701fbf093d"
  }
  ```

- Response:

  

  ```
  HTTP/1.1 200 OK
  
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "prev_block_hash": "1b345401d8f859c05e37b5ccacd39ff5b4a21615b63f9b96edb59352a3e54e82",
          "block_num": 32,
          "block_hash": "405a6fb8b91a055a7a4cf007451ce0b31ea6626cb2d56ec050b126701fbf093d",
          "cursor_block_label": 532613437,
          "block_time": 1537259127,
          "trx_merkle_root": "85f9d2fbe1d3c0a217e10932899b6f73b24fafe59a006406ed65d7e4a39a7416",
          "delegate": "bottos",
          "delegate_sign": "41c25998e7d432527f07ae5c10c5c30a4873e9519c29cb02e7f46e3a8e238baf47748efe3f24db3ff3630305441b1d24c5d0ba796b3332a8b8fd3fca4efc4cfb",
          "trxs": [
              {
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
          ]
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
  	"trx_hash": "85f9d2fbe1d3c0a217e10932899b6f73b24fafe59a006406ed65d7e4a39a7416"
  }
  ```

- Response:

  

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
| status    | string     | query transaction status result.<br />”commited“：Transaction has commited；<br />”not found“：Transaction execute failed；<br />”pending“：Transaction submitted but not processed |

**Fields Changes**

- Null

  **API Sample**

> Address：<http://127.0.0.1:8689/v1/transaction/status

- Request:



  ```
  {
  	"trx_hash": "85f9d2fbe1d3c0a217e10932899b6f73b24fafe59a006406ed65d7e4a39a7416"
  }
  ```

- Response:



  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "status": "commited"
      }
  }
  ```


## Query Accounts Information**

**API Function**

> API Description： Query accounts information
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
| balance           | string     | Token value，                            |
| staked_balance    | string     | Staked BTO value                        |
| staked_space_balance | string | Staked BTO value for SPACE(Transactions need to consume SPACE) |
| staked_time_balance | string | Staked BTO value for TIME(Transactions need to consume TIME) |
| unStaking_balance | string     | Under unstakeing BTO value                    |
| unStaking_timestamp | uint64     | Unstake token timestamp（ Unix timestamp ）         |
| vote | jsonObject | vote information |
| delegate | string | the delegate who were voted |
| votes | string | Number of votes |
| available_space_balance | uint64 | SPACE value of available |
| used_space_balance | uint64 | SPACE value of used |
| available_time_balance | uint64 | TIME value of available |
| used_time_balance | uint64 | TIME value of used |

Note：balance、staked_balance、staked_space_balance、staked_time_balance、unStaking_balance, the summary value of that three is the total token value of the change account.

**Fields Changes**

- Null

  **API Sample**

> Address：<http://127.0.0.1:8689/v1/account/info>

- Request:

  

  ```
  {
  	"account_name":"delta"
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
        "pubkey": "045f9402135fd2a8d43e9dd27ef6cd3b9569559c970de161e117e4cb34f99f31485e441e263acc2424fa4e2bf3681bfeee14145590f822a82ffb9f0db82d1939b7",
        "balance": "9999990000000000",
        "staked_balance": "10000000000",
        "staked_space_balance": "0",
        "staked_time_balance": "0",
        "unStaking_balance": "0",
        "unStaking_timestamp": 0,
        "vote": {
            "delegate": "bottostest1",
            "votes": "10000000000"
        },
        "available_space_balance": 199644,
        "used_space_balance": 356,
        "available_time_balance": 2000000,
        "used_time_balance": 0
      }
  }
  ```


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
      "errcode": 0,
      "msg": "success",
      "result":  [
          {
              "account_name": "adhil",
              "report_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
              "location": "shanghai,china",
              "desc": "",
              "last_slot": 1029945,
              "total_missed": 0,
              "last_confirmed_block_num": 32,
              "active": true
          },
          {
              "account_name": "albireo",
              "report_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
              "location": "",
              "desc": "",
              "last_slot": 1026356,
              "total_missed": 123,
              "last_confirmed_block_num": 10,
              "active": false
          }
      ]
  }
  ```


