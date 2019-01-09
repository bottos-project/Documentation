# 钱包REST接口

## 一键创建钱包

**接口功能**

> 接口说明： 一键创建钱包，钱包文件包默认保存在 Linux： /home/bottos/bot/ 目录下
>
> **接口地址**
>
> URL:  /v1/wallet/createwallet 
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
| account_name | TRUE | string | 无     | 账号名称 |
| passwd       | TRUE | string | 无     | 密码     |

**响应字段：**

| 参数        | 类型       | 说明                                               |
| ----------- | ---------- | -------------------------------------------------- |
| errcode     | uint32     | 错误码，0-相应成功，其他见错误码章节               |
| msg         | string     | 响应描述                                           |
| result      | jsonObject | 响应结果                                           |
| wallet_name | string     | 生成的钱包文件名称，默认为账号名称+".keystore"后缀 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/createwallet  >

- 请求：

  ```
  	"account_name": "testtest1",
  	"passwd": "123456"	
  }
  
  
  ```

- 响应：

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





## 生成公私钥对

**接口功能**

> 接口说明： 生成公私钥对
>
> **接口地址**
>
> URL:  /v1/wallet/generatekeypair
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> GET

**请求参数：**

| 参数 | 必选 | 类型 | 默认值 | 说明 |
| ---- | ---- | ---- | ------ | ---- |
| 无   |      |      |        |      |

**响应字段：**

| 参数        | 类型       | 说明                                 |
| ----------- | ---------- | ------------------------------------ |
| errcode     | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg         | string     | 响应描述                             |
| result      | jsonObject | 响应结果                             |
| public_key  | string     | 公钥                                 |
| private_key | string     | 私钥                                 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/generatekeypair  >

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
          "public_key": "043680ae1b81f87274d7051e6101afc8f8da3cd978bb75b22f24becb98afb456f110151644330ff6c742e44f8e9652f1ab5ea1cd3997bebe5a23a4389ff0cb6493",
          "private_key": "8a068d821ad8d58fe8caaa87f32ea69f889f6b8ce8c6bc3bc67ce2c68c43da3b"
      }
  }
  ```

## 创建账号

**接口功能**

> 接口说明： 创建账号
>
> **接口地址**
>
> URL:  /v1/wallet/createaccount 
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明       |
| ------------ | ---- | ------ | ------ | ---------- |
| account_name | TRUE | string | 无     | 账号名称   |
| public_key   | TRUE | string | 无     | 公钥       |
| referrer     | TRUE | string | 无     | 引荐人账号 |

**响应字段：**

| 参数         | 类型       | 说明                                 |
| ------------ | ---------- | ------------------------------------ |
| errcode      | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg          | string     | 响应描述                             |
| result       | jsonObject | 响应结果，具体数据详情               |
| account_name | string     | 新注册的账号名称                     |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/createaccount >

- 请求：

  ```
  {
  	"account_name": "testtest",
  	"public_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
  	"referrer": "bottos"	
  }
  ```

- 响应：

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
      	"account_name":"testtest"
      }
  }
  ```



## 手动创建钱包

**接口功能**

> 接口说明： 手动创建钱包，钱包文件包默认保存在 Linux： /home/bottos/bot/ 目录下，生成的钱包文件名称，默认为账号名称+".keystore"后缀
>
> **接口地址**
>
> URL:  /v1/wallet/createwalletmanual 
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
| account_name | TRUE | string | 无     | 账号名称 |
| private_key  | TRUE | string | 无     | 私钥     |
| passwd       | TRUE | string | 无     | 密码     |

**响应字段：**

| 参数        | 类型       | 说明                                               |
| ----------- | ---------- | -------------------------------------------------- |
| errcode     | uint32     | 错误码，0-相应成功，其他见错误码章节               |
| msg         | string     | 响应描述                                           |
| result      | jsonObject | 响应结果                                           |
| wallet_name | string     | 生成的钱包文件名称，默认为账号名称+".keystore"后缀 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/createwalletmanual  >

- 请求：

  ```
  {
  	"account_name": "testtest1",
  	"private_key": "b799ef616830cd7b8599ae7958fbee56d4c8168ffd5421a16025a398b8a4be45",
  	"passwd": "123456"
  }
  ```

- 响应：

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



## 打开/Unlock钱包

**接口功能**

> 接口说明： 打开/Unlock钱包
>
> **接口地址**
>
> URL:  /v1/wallet/unlockaccount
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
| account_name | TRUE | string | 无     | 账号名称 |
| passwd       | TRUE | string | 无     | 密码     |

**响应字段：**

| 参数    | 类型       | 说明                                 |
| ------- | ---------- | ------------------------------------ |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg     | string     | 响应描述                             |
| result  | jsonObject | 响应结果                             |
| unlock  | bool       | 操作结果                             |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/unlockaccount  >

- 请求：

  ```
  {
  	"account_name": "testtest1",
  	"passwd": "123456"
  }
  ```

- 响应：

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



## 关闭/Lock钱包

**接口功能**

> 接口说明： 关闭/Lock钱包
>
> **接口地址**
>
> URL:  /v1/wallet/lockaccount 
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
| account_name | TRUE | string | 无     | 账号名称 |

**响应字段：**

| 参数    | 类型       | 说明                                 |
| ------- | ---------- | ------------------------------------ |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg     | string     | 响应描述                             |
| result  | jsonObject | 响应结果                             |
| lock    | bool       | 操作结果                             |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/lockaccount  >

- 请求：

  ```
  {
  	"account_name": "testtest1"
  }
  ```

- 响应：

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



## 查询钱包列表

**接口功能**

> 接口说明： 查询钱包列表
>
> **接口地址**
>
> URL:  /v1/wallet/list
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> GET

**请求参数：**

| 参数 | 必选 | 类型 | 默认值 | 说明 |
| ---- | ---- | ---- | ------ | ---- |
| 无   |      |      |        |      |

**响应字段：**

| 参数         | 类型       | 说明                                       |
| ------------ | ---------- | ------------------------------------------ |
| errcode      | uint32     | 错误码，0-相应成功，其他见错误码章节       |
| msg          | string     | 响应描述                                   |
| result       | jsonObject | 响应结果                                   |
| wallet_path  | string     | 钱包路径+文件名称                          |
| account_name | string     | 账号名称                                   |
| public_key   | string     | 公钥值，若该账号未在链上上注册，则查询不到 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/list >

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
  	"result": [{
  		"wallet_path": "C:\\Users\\jim\\AppData\\Roaming\\bot\\testtest12.keystore",
  		"account_name": "testtest12",
  		"public_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f"
  	},
  	{
  		"wallet_path": "C:\\Users\\jim\\AppData\\Roaming\\bot\\testtest2.keystore",
  		"account_name": "testtest2",
  		"public_key": "not found on Chain"
  	}]
  }
  ```



## 查询公钥

**接口功能**

> 接口说明： 查询公钥，调用该接口的前提：账号已处于打开或Unlock状态(不需要连接Bottos 链)
>
> **接口地址**
>
> URL:  /v1/wallet/getpublickey
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
| account_name | TRUE | string | 无     | 账号名称 |

**响应字段：**

| 参数         | 类型       | 说明                                 |
| ------------ | ---------- | ------------------------------------ |
| errcode      | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg          | string     | 响应描述                             |
| result       | jsonObject | 响应结果                             |
| account_name | string     | 账号名称                             |
| public_key   | string     | 公钥值                               |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/getpublickey>

- 请求：

  ```
  {
  	"account_name":"testtest"
  }
  ```

- 响应：

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



## 对交易签名

**接口功能**

> 接口说明： 对交易签名
>
> **接口地址**
>
> URL:  /v1/wallet/signtransaction
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数     | 必选 | 类型   | 默认值 | 说明                                            |
| -------- | ---- | ------ | ------ | ----------------------------------------------- |
| sender   | TRUE | string | 无     | 发送交易的账号名称                              |
| contract | TRUE | string | 无     | 合约名                                          |
| method   | TRUE | string | 无     | 合约方法名                                      |
| param    | TRUE | string | 无     | 业务结构数据，经bpl序列化后，转为十六进制字符串 |

**响应字段：**

| 参数    | 类型       | 说明                                     |
| ------- | ---------- | ---------------------------------------- |
| errcode | uint32     | 错误码，0-相应成功，其他见错误码章节     |
| msg     | string     | 响应描述                                 |
| result  | jsonObject | 响应结果，具体见 “发送交易信息” 请求字段 |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/signtransaction>

- 请求：

  ```
  {
  	"sender": "bottos",
  	"contract": "bottos",
  	"method": "newaccount",
  	"param": ""
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
          "cursor_num": 26,
          "cursor_label": 1948301132,
          "lifetime": 1537330126,
          "sender": "bottos",
          "contract": "bottos",
          "method": "newaccount",
          "param": "",
          "sig_alg": 1,
          "signature": "aa249f7c0e5a5564b48ada5e9f0ffa4665d955b08e08c43906a156fa5bf30272547f2e4cde31fa8d5d303f36a4de0718ec3284b2e82f93fa7da50a54cbdcf86a"
      }
  }
  ```

## 对HASH签名

**接口功能**

> 接口说明： 对HASH签名
>
> **接口地址**
>
> URL:  /v1/wallet/signhash
>
> **返回格式**
>
> JSON
>
> **请求方式**
>
> POST

**请求参数：**

| 参数         | 必选 | 类型   | 默认值 | 说明                            |
| ------------ | ---- | ------ | ------ | ------------------------------- |
| account_name | TRUE | string | 无     | 账号名称                        |
| hash         | TRUE | string | 无     | 数据的sha256 HASH值（消息摘要） |

**响应字段：**

| 参数       | 类型       | 说明                                 |
| ---------- | ---------- | ------------------------------------ |
| errcode    | uint32     | 错误码，0-相应成功，其他见错误码章节 |
| msg        | string     | 响应描述                             |
| result     | jsonObject | 响应结果                             |
| hash_value | string     | 签名值                               |

**字段变化**

- 无

  **接口示例**

> 地址：<http://127.0.0.1:6869/v1/wallet/signhash

- 请求：

  ```
  {
  	"account_name": "bottos",
  	"hash": "87d80210bc83f8bb233d26d5551a516ad27a4e3ce2a2faaac6eacc4c87fadc3d"
  }
  ```

- 响应：

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

