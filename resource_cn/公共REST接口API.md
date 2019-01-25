# 公共REST接口

## 获取区块高度信息

**接口功能**

> 接口说明： 获取区块高度信息
>
> **接口地址**
>
> URL:  /v1/block/height
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> GET
>
> **请求参数：**
>
> | 参数 | 必选 | 类型 | 默认值 | 说明 |
> | ---- | ---- | ---- | ------ | ---- |
> | 无   |      |      |        |      |

**响应字段：**

| 参数                     | 类型       | 说明                                     |
| ------------------------ | ---------- | ---------------------------------------- |
| errcode                  | uint32     | 错误码，0-相应成功，其他见错误码章节     |
| msg                      | string     | 响应描述                                 |
| result                   | jsonObject | 响应结果                                 |
| head_block_num           | uint64     | 块号                                     |
| head_block_hash          | string     | 前一块哈希值                             |
| head_block_time          | uint64     | 块生成时间                               |
| head_block_delegate      | string     | 块生产者                                 |
| cursor_label             | uint32     | 块标识                                   |
| last_consensus_block_num | uint64     | 不可逆块号                               |
| chain_id                 | string     | 链ID，同一链的所有节点的Chain_id必须相同 |
| head_block_version       | uint64     | 链版本号                           |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/block/height>

- 请求：



  ```
  无
  ```

- 响应：



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



##  获取区块信息

**接口功能**

> 接口说明： 获取区块信息
>
> **接口地址**

> URL:  /v1/block/detail
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST
>
> **请求参数：**
>
> | 参数       | 必选  | 类型   | 默认值 | 说明     |
> | ---------- | ----- | ------ | ------ | -------- |
> | block_num  | FALSE | uint64 | 空     | 块号     |
> | block_hash | FALSE | string | 空     | 块哈希值 |

备注：block_num、block_hash 必须二选一，若都缺省，默认查询到的是 0 号块的信息。

**响应字段：**

| 参数               | 类型       | 说明                                                         |
| ------------------ | ---------- | ------------------------------------------------------------ |
| errcode            | uint32     | 错误码，0-相应成功，其他见错误码章节                         |
| msg                | string     | 响应描述                                                     |
| result             | jsonObject | 响应结果                                                     |
| block_num          | uint64     | 块号                                                         |
| prev_block_hash    | string     | 前一块哈希值                                                 |
| block_hash         | string     | 当前块哈希值                                                 |
| cursor_block_label | uint32     | 当前块标识                                                   |
| block_time         | uint64     | 块生成时间                                                   |
| trx_merkle_root    | string     | 默克尔根值，该块打包的所有交易的根哈希值                     |
| delegate           | string     | 生产者名称                                                   |
| delegate_sign      | string     | 生产者签名                                                   |
| ResourceReceipt    | jsonObject | 交易消耗资源情况                                             |
| account_name       | string     | 账户名称                                                     |
| space_token_cost   | uint64     | 交易所消耗的空间资源                                         |
| time_token_cost    | uint64     | 交易所消耗的时间资源                                         |
| trxs               | jsonArray  | 当前区块所打包的交易列表，具体见“查询交易信息”章节的响应字段，另加TrxHash |
| TrxHash            | string     | 交易HASH 值                                                  |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/block/detail>

- 请求：

  

  ```
  {
  	"block_num": 32,
  	"block_hash": "eeca4c8ee8410cf256d27e5e676f6ce395ebdffade431b52775bb20aa60b8929"
  }
  ```

- 响应：



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

## 发送交易信息

**接口功能**

> 接口说明： 发送交易信息
>
> **接口地址**
>
> URL:  /v1/transaction/send
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明                                                      |
| ------------ | ---- | ------ | ------ | --------------------------------------------------------- |
| version      | TRUE | uint32 | 1      | 链版本号                                                  |
| cursor_num   | TRUE | uint64 | 无     | 最新区块号，调用获取区块头获得                            |
| cursor_label | TRUE | uint32 | 无     | 最新区块标识，调用获取区块头获得                          |
| lifetime     | TRUE | uint64 | 无     | 交易过期时间，调用获取区块头，加一定的延时，推荐延时100秒 |
| sender       | TRUE | string | 无     | 发送者                                                    |
| contract     | TRUE | string | 无     | 合约名称                                                  |
| method       | TRUE | string | 无     | 合约方法                                                  |
| param        | TRUE | string | 无     | 业务参数，十六进制字符串                                  |
| sig_alg      | TRUE | uint32 | 1      | 签名算法                                                  |
| signature    | TRUE | string | 无     | 签名值                                                    |

**响应字段：**

| 参数         | 类型       | 说明                                       |
| ------------ | ---------- | ------------------------------------------ |
| errcode      | uint32     | 错误码，0-相应成功，其他见错误码章节       |
| msg          | string     | 响应描述                                   |
| result       | jsonObject | 响应结果                                   |
| trx_hash     | string     | 交易哈希值                                 |
| trx          | jsonObject | 交易详情                                   |
| version      | uint32     | 链版本号                                   |
| cursor_num   | uint64     | 最新区块号，调用获取区块头获得             |
| cursor_label | uint32     | 最新区块标签，调用获取区块头获得           |
| lifetime     | uint64     | 交易过期时间，调用获取区块头，加一定的延时 |
| sender       | string     | 发送者                                     |
| contract     | string     | 合约名称                                   |
| method       | string     | 合约方法                                   |
| param        | string     | 业务参数，十六进制字符串                   |
| sig_alg      | uint32     | 签名算法                                   |
| signature    | string     | 签名值                                     |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/transaction/send>

- 请求：

  

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

- 响应：

  

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

## 查询交易信息

**接口功能**

> 接口说明： 查询交易信息
>
> **接口地址**
>
> URL:  /v1/transaction/get
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型   | 默认值 | 说明       |
| -------- | ---- | ------ | ------ | ---------- |
| trx_hash | TRUE | string | 无     | 交易哈希值 |

**响应字段：**

| 参数       | 类型       | 说明                                       |
| ---------- | ---------- | ------------------------------------------ |
| errcode    | uint32     | 错误码，0-相应成功，其他见错误码章节       |
| msg        | string     | 响应描述                                   |
| result     | jsonObject | 响应结果                                   |
| version    | uint32     | 链版本号                                   |
| cursor_num | uint64     | 最新区块号，调用获取区块头获得             |
| cursor_lab | uint32     | 最新区块标签，调用获取区块头获得           |
| lifetime   | uint64     | 交易过期时间，调用获取区块头，加一定的延时 |
| sender     | string     | 发送者                                     |
| contract   | string     | 合约名称                                   |
| method     | string     | 合约方法                                   |
| param      | jsonObject | 业务参数                                   |
| sig_alg    | uint32     | 签名算法                                   |
| signature  | string     | 签名值                                     |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/transaction/get>

- 请求：

  

  ```
  {
  	"trx_hash": "8a403642ea7b51595d1a1454b43b83ba62420629581c3d2f0d2143342aa89c9f"
  }
  ```

- 响应：

  

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

## 查询交易状态

**接口功能**

> 接口说明： 查询交易状态
>
> **接口地址**
>
> URL:  /v1/transaction/status
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型   | 默认值 | 说明       |
| -------- | ---- | ------ | ------ | ---------- |
| trx_hash | TRUE | string | 无     | 交易哈希值 |

**响应字段：**

| 参数    | 类型       | 说明                                                         |
| ------- | ---------- | ------------------------------------------------------------ |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节                         |
| msg     | string     | 响应描述                                                     |
| result  | jsonObject | 响应结果                                                     |
| status  | string     | 查询交易状态结果，<br />”commited“：交易已生效；<br />”not found“：交易执行失败；<br />”pending“：交易已提交，但未处理 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/transaction/status

- 请求：



  ```
  {
  	"trx_hash": "8a403642ea7b51595d1a1454b43b83ba62420629581c3d2f0d2143342aa89c9f"
  }
  ```

- 响应：



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

## 查询账户信息

**接口功能**

> 接口说明： 查询账户信息
>
> **接口地址**
>
> URL:  /v1/account/info
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明     |
| ------------ | ---- | ------ | ------ | -------- |
| account_name | TRUE | string | 无     | 账户名称 |

**响应字段：**

| 参数              | 类型       | 说明                                 |
| ----------------- | ---------- | ------------------------------------ |
| errcode           | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg               | string     | 响应描述                             |
| result            | jsonObject | 响应结果                             |
| account_name      | string     | 账号名称                             |
| pubkey            | string     | 公钥                                 |
| balance                 | string     | 账号可支配的BTO数量                   |
| staked_balance          | string     | 质押投票的BTO数量                     |
| staked_space_balance    | string     | 质押SPACE的BTO数量（交易需消耗SPACE） |
| staked_time_balance     | string     | 质押TIME的BTO数量（交易需消耗TIME） |
| unStaking_balance       | string     | 正解质押的BTO数量                     |
| unStaking_timestamp | uint64     | 解质押的时间（ Unix时间戳 ）         |
| vote                    | jsonObject | 投票信息                              |
| delegate                | string     | 被投票生产者                          |
| votes                   | string     | 投票数量                              |
| available_space_balance | uint64     | 可使用的SPACE数量                     |
| used_space_balance      | uint64     | 已用的SPACE数量                       |
| available_time_balance  | uint64     | 可使用的TIME数量                      |
| used_time_balance       | uint64     | 已使用的SPACE数量                     |

备注：balance、staked_balance、staked_space_balance、staked_time_balance、unStaking_balance 三者之和为改账户总的Token值 。

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/account/info>

- 请求：

  

  ```
  {
  	"account_name":"bottos"
  }
  ```

- 响应：



  ```
   HTTP/1.1 200 OK
   {
        "errcode": 0,
        "msg": "success",
        "result": {
            "account_name": "bottos",
            "pubkey": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
            "balance": "93329890000000000",
            "staked_balance": "0",
            "staked_space_balance": "0",
            "staked_time_balance": "0",
            "unStaking_balance": "0",
            "unStaking_timestamp": 0,
            "resource": {
                "free_available_space": 0,
                "free_used_space": 0,
                "stake_available_space": 0,
                "stake_used_space": 0,
                "free_available_time": 0,
                "free_used_time": 0,
                "stake_available_time": 0,
                "stake_used_time": 0
            },
            "unClaimed_block_reward": "0",
            "unClaimed_vote_reward": "0",
            "deploy_contract_list": "",
            "vote": null
        }
    }
    ```


## 查询合约ABI

**接口功能**

> 接口说明： 查询合约ABI
>
> **接口地址**
>
> URL:  /v1/contract/abi 
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型   | 默认值 | 说明     |
| -------- | ---- | ------ | ------ | -------- |
| contract | TRUE | string | 无     | 合约名称 |

**响应字段：**

| 参数        | 类型       | 说明                                                         |
| ----------- | ---------- | ------------------------------------------------------------ |
| errcode     | uint32     | 错误码，0-相应成功，其他见错误码章节                         |
| msg         | string     | 响应描述                                                     |
| result      | jsonObject | 响应结果                                                     |
| types       | jsonObject | 预留字段                                                     |
| structs     | jsonArray  | 合约所包含的方法结构列表                                     |
| name        | string     | 结构体名，一般为自定义的合约方法名别名                       |
| base        | string     | 父方法，通常为空                                             |
| fields      | jsonObject | 方法入参结构体                                               |
| name        | string     | 参数-1，以注册账号为例：账号名称                             |
| pubkey      | string     | 参数-2，以注册账号为例：公钥                                 |
| actions     | jsonArray  | 合约所包含的方法                                             |
| action_name | string     | 合约方法名称，对应“发送交易信息”请求参数的method值           |
| type        | string     | 同name，结构体名，一般为自定义的合约方法名别名               |
| tables      | jsonArray  | 该合约数据的存储方式，定义表名，类型，Key值，类型，Value 类型。内置合约该字段为空。 |
| table_name  | string     | 合约存储的表名                                               |
| index_type  | string     | 索引类型，默认为string。                                     |
| key_names   | jsonArray  | 合约数据存储的Key值                                          |
| key_types   | jsonArray  | key值的类型，默认为string                                    |
| type        | string     | 合约数据key对应的value值，通常为 结构体                      |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/contract/abi >

- 请求：

  

  ```
  {
  	"contract":"test1@tinaailian"
  }
  ```

- 响应：



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

## 查询合约代码

**接口功能**

> 接口说明： 查询合约代码
>
> **接口地址**
>
> URL:  /v1/contract/code
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型   | 默认值 | 说明     |
| -------- | ---- | ------ | ------ | -------- |
| contract | TRUE | string | 无     | 合约名称 |

**响应字段：**

| 参数    | 类型       | 说明                                 |
| ------- | ---------- | ------------------------------------ |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg     | string     | 响应描述                             |
| result  | jsonObject | 响应结果                             |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/contract/code >

- 请求：

  

  ```
  {
  	"contract":"usermng"
  }
  ```

- 响应：

  

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "",
      "result": "7b0a2020227479706573223a205b5d2c0a20202273747275637473223a205b7b0a202020202020226e616d65223a202255736572496e666f222c0a2020202020202262617365223a2022222c0a202020202020226669656c6473223a207b0a20202020202020202020226469646964223a2022737472696e67222c0a2020202020202020202022696e666f223a2022737472696e67220a20202020202020207d0a202020207d2c7b0a202020202020226e616d65223a2022557365724c6f67696e222c0a2020202020202262617365223a2022222c0a202020202020226669656c6473223a207b0a2020202020202020202022757365724e616d65223a2022737472696e67222c0a202020202020202020202272616e646f6d4e756d223a202275696e743332220a20202020202020207d0a202020207d2c7b0a202020202020226e616d65223a20225573657242617365496e666f222c0a2020202020202262617365223a2022222c0a202020202020226669656c6473223a207b0a2020202020202020202022696e666f223a2022737472696e67220a20202020202020207d0a202020207d0a20205d2c0a202022616374696f6e73223a205b7b0a20202020202022616374696f6e5f6e616d65223a202272656775736572222c0a2020202020202274797065223a202255736572496e666f220a202020207d2c7b0a20202020202022616374696f6e5f6e616d65223a2022757365726c6f67696e222c0a2020202020202274797065223a2022557365724c6f67696e220a202020207d0a20205d2c0a2020227461626c6573223a205b7b0a202020202020227461626c655f6e616d65223a202275736572726567696e666f222c0a20202020202022696e6465785f74797065223a2022737472696e67222c0a202020202020226b65795f6e616d6573223a205b0a2020202020202020226469646964220a2020202020205d2c0a202020202020226b65795f7479706573223a205b0a202020202020202022737472696e67220a2020202020205d2c0a2020202020202274797065223a20225573657242617365496e666f220a202020207d0a20205d0a7d0a"
  }
  ```

## 查询所有生产者

**接口功能**

> 接口说明： 查询所有生产者
>
> **接口地址**
>
> URL:  /v1/delegate/getall
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数  | 必选 | 类型   | 默认值 | 说明         |
| ----- | ---- | ------ | ------ | ------------ |
| limit | TRUE | uint32 | 无     | 查询条数     |
| start | TRUE | uint32 | 0      | 查询起始下标 |

**响应字段：**

| 参数         | 类型      | 说明                                 |
| ------------ | --------- | ------------------------------------ |
| errcode      | uint32    | 错误码，0-相应成功，其他见错误码章节 |
| msg          | string    | 响应描述                             |
| result       | jsonArray | 响应结果                             |
| account_name | string    | 账号名称                             |
| public_key   | string    | 公钥                                 |
| location     | string    | 节点地理位置信息，如"shanghai,china" |
| desc         | string    | 节点描述信息                         |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:8689/v1/delegate/getall >

- 请求：

  

  ```
  {
      "limit": 10,
      "start": 0
  }
  ```

- 响应：

  

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


