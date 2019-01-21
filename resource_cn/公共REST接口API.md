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
  	"block_hash": "405a6fb8b91a055a7a4cf007451ce0b31ea6626cb2d56ec050b126701fbf093d"
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
  		"prev_block_hash": "905c688db5fbb831b06c545a71ce7ae109bcedb447dd8af9670bd0fbe2bf4cec",
  		"block_num": 281031,
  		"block_hash": "e7fa5ae6def1d93bca2f62c9c386afe8f539ebed24ddeab0d7ce325b668f7a6f",
  		"cursor_block_label": 1720679023,
  		"block_time": 1546833570,
  		"trx_merkle_root": "6ae1ce2045f6302db1a330432a90741741dcd47c346f2e2883bd5cedc8ce5ac0",
  		"delegate": "bto-alibaba",
  		"delegate_sign": "b359bac262801118a676d1d0bee8f069878e0753aa0400176b4d8c2509e25f36341c2613801b2e8bc45a03609093289a95a028fe3aac67b2652e1bf4907facb3",
  		"trxs": [{
  			"Transaction": {
  				"version": 65536,
  				"cursor_num": 281030,
  				"cursor_label": 3804187884,
  				"lifetime": 1546833667,
  				"sender": "bottostest",
  				"contract": "bottos",
  				"method": "transfer",
  				"param": {
  					"from": "bottos",
  					"memo": "",
  					"to": "bottosreferrer1",
  					"value": 200000000000
  				},
  				"sig_alg": 1,
  				"signature": "97b53d105108cc949c64c5932ad200ddad12f69412ab01af7e3e6955fc9991b262c67c560e27742efe12bc130c1485a358a47c707d4c7722afdf27d8e96a5d2c"
  			},
  			"ResourceReceipt": {
  				"account_name": "bottostest",
  				"space_token_cost": 265,
  				"time_token_cost": 100
  			},
  			"TrxHash": "81ff5685349926a6200abb3c13fad6d38505030c12b89af68d1a4d08b48d836e"
  		}]
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
  	"trx_hash": "85f9d2fbe1d3c0a217e10932899b6f73b24fafe59a006406ed65d7e4a39a7416"
  }
  ```

- 响应：

  

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
  	"trx_hash": "e1ddadcb266f4973284f66f3f5002ddf7e1bbfad04095213f7d87d8f33f0b7e3"
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
  	"account_name":"bottostest"
  }
  ```

- 响应：



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


