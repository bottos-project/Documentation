# 使用C++编写智能合约
# １.合约编写

我们主要以　https://github.com/bottos-project/contract-tool-cpp.git　里的[testDbSaveAndRead](https://github.com/bottos-project/contract-tool-cpp/tree/master/testDbSaveAndRead)的例子来说明基本合约的编写及编译。这个例子提供了两个方法，分别是helloworld和start：(以下说明问题可能只截取部分代码，全部代码请参考git库)：

```
......
int helloworld()  //method helloworld
{
    myprints("hello world in contract");
    
    return 0;
}

int start() // method start
{
    TestStruct testStruct = {{0}};
    
    if ( !parseParam<TestStruct>(testStruct) )  return ERROR_UNPACK_FAIL;
    
    myprints("data from input param:");
    printi(testStruct.valueA);
    printi(testStruct.valueB);

    testStruct.valueA += 1;
    testStruct.valueB += 2;

    char tableName[] = "testTableName";
    char keyName[] = "testKeyName";

    if (!saveData(testStruct, tableName, keyName)) return ERROR_SAVE_DB_FAIL;


    if (!getData(nullptr, tableName, keyName, testStruct) ){
        myprints("getData failed!");
        return ERROR_GET_DB_FAIL;
    }
    
    myprints("data from read db:");
    printi(testStruct.valueA);
    printi(testStruct.valueB);

    return 0;
}
```

注：（详细请参考对应头文件dbSaveRead.hpp）

- 方法对应的函数原型是”int funcname() “，没有入参，目前返回值范围是[0,0xfff]，其中0表示合约执行成功，其他数值可以根据合约逻辑定义成对应的错误码进行返回，可通过如下命令获取到该错误码：

```
curl  http://RESTHost:RESTPort/v1/transaction/status -X POST -d '{"trx_hash": "trxhash"}'
```

- 方法名对应的函数需要按C语言进行编译，如下：

  ```
  extern "C" {
      int helloworld();
      int start();    
  }
  ```

  

该合约中，方法helloworld就是简单的实现一个打印，下面我们重点看一下start这个方法实现的逻辑。



## 1.1. 获取调用合约的参数

首先将外部注入的参数获取到，并且反序列化存储到本地结构体，并且打印：

```
......
int start() 
{
    TestStruct testStruct = {{0}};
    
    if ( !parseParam<TestStruct>(testStruct) )  return ERROR_UNPACK_FAIL; //Deserialization
    
    myprints("data from input param:");
    printi(testStruct.valueA);   // print elem valueA
    printi(testStruct.valueB);   // print elem valueB   
    ......
}
```

其中”parseParam“是个模板，里面会调用到”TestStruct“结构体类型的反序列化函数，我们需要定义一下该函数以供在模板中被调用：

```
static bool unpack_struct(MsgPackCtx *ctx, TestStruct *info)
{    
    uint32_t size = 0;
    UNPACK_ARRAY(2)　//表示有两个元素

    UNPACK_U32(info,valueA)　//第一个元素按32位无符号整型解析到info->valueA
    UNPACK_U32(info,valueB)  //第二个元素按32位无符号整型解析到info->valueB
    
    return true;
}
```

其中UNPACK_ARRAY、UNPACK_U32都是为了使用方便而定义的一些宏，放在公共的头文件contractcomm.hpp中。



## 1.2. 存储合约数据

第二是将结构体里的元素修改后存储到链上：

```
......
int start()
{
	......
    testStruct.valueA += 1;　//modify elemA
    testStruct.valueB += 1;  //modify elemA

    char tableName[] = "testTableName";
    char keyName[] = "testKeyName";

    if (!saveData(testStruct, tableName, keyName)) return ERROR_SAVE_DB_FAIL; //save to blockchain
    ......
}
```

其中tableName和keyName分别是存储数据时的表名以及数据的键值，”saveData“是个模板，里面会调用”TestStruct“结构体类型的序列化函数，我们需要定义一下该函数以供在模板中被调用：

```
static bool pack_struct(MsgPackCtx *ctx, TestStruct *info)
{    
    PACK_ARRAY16(2)　//表示有两个元素

    PACK_U32(info,valueA)　//将info->valueA按32位无符号整型序列化到buffer
    PACK_U32(info,valueB)　//将info->valueB按32位无符号整型序列化到buffer

    return true;
}
```

其中，PACK_ARRAY16、PCACK_U32都是为了使用方便而定义的一些宏，放在公共的头文件contractcomm.hpp中。



## 1.3. 读取合约数据

第三是将链上读取的数据反序列化得到原始的数据：

```
......
int start() 
{
    ......
    if (!getData(nullptr, tableName, keyName, testStruct) ){  //get data from chain
        myprints("getData failed!");
        return ERROR_GET_DB_FAIL;
    }
    
    myprints("data from read db:");
    printi(testStruct.valueA);
    printi(testStruct.valueB);

    return 0;
}
```

”saveData“是个模板，里面会根据表名以及键值读取到数据，然后调用”TestStruct“结构体类型的反序列化函数，我们需要定义一下该函数以供在模板中被调用：

```
static bool unpack_struct(MsgPackCtx *ctx, TestStruct *info)
{    
    uint32_t size = 0;
    UNPACK_ARRAY(2)　 //表示有两个元素

    UNPACK_U32(info,valueA)　//第一个元素按32位无符号整型解析到info->valueA
    UNPACK_U32(info,valueB)  //第二个元素按32位无符号整型解析到info->valueB
    
    return true;
}
```

好了，这个合约的逻辑大概描述完了，再看一下我们来编译一下这个合约。



# ２. 合约编译

合约的编译相关工具链是https://github.com/bottos-project/contract-tool-cpp.git, 一份合约新建一个文件夹，如[testDbSaveAndRead](https://github.com/bottos-project/contract-tool-cpp/tree/master/testDbSaveAndRead)，编译合约的时候进入该文件夹，执行：

```
python ../gentool.py wasm dbSaveRead.cpp
```

命令执行完后将会生成对应的wasm文件：dbSaveRead.wasm

再来看一下abi文件的生成，首先简单介绍一下abi文件的组成，参考已经生成的dbSaveRead.abi:

- structs ：扫描出来的结构体的定义描述，供后面使用；
- actions：合约提供的方法描述，其中action_name 是方法名， type 是调用合约所要的参数；
- tables ：合约持久化数据访问接口描述，即合约保存的数据描述，其中table_name 是表名，index_type 是索引的类型， key_names 和key_types 分别是键值的名称和类型，type 是保存的数据的结构定义。

abi文件是通过扫描hpp文件生成， 在hpp文件里通过注释来告诉扫描器具体的定义：

- "//@abi action start"：

​        本合约定义了两个方法，其中start 对应的入参定义为TestStruct ；

- ”//@abi table testTableName:[index_type:string, key_names:keyName, key_types:string] “

​       定义了一个表， 表内容的结构体定义为testTableName 。

在testDbSaveAndRead文件夹下通过如下命令就可以扫描出hpp文件对应的abi文件：

```
python ../gentool testRegUser.hpp
```

命令执行完后将会生成对应的abi文件dbSaveRead.abi。



# ３. 合约部署

我们再来看一下合约如何部署：

部署可以使用提供的bcli命令来进行，假设账号testdbsaveread已经存在，并且其对应的钱包已经解锁，则可以按如下命令部署合约，详细请参考bcli命合约部署相关描述

```
./bcli contract deploy --account testdbsaveread --code $filepath/dbSaveRead.wasm --abi $filepath/dbSaveRead.abi
```

参考的回显：

```
Push transaction done for deploying contract testdbsaveread
Trx: 
{
    "version": 1,
    "cursor_num": 5517,
    "cursor_label": 3051494823,
    "lifetime": 1542971302,
    "sender": "testdbsaveread",
    "contract": "bottos",
    "method": "deploycode",
    "param": {
        "name": "testdbsaveread",
        "vm_type": 1,
        "vm_version": 1,
        "contract_code": "0061736d010000000......"
    },
    "param_bin": "dc0004......",
    "sig_alg": 1,
    "signature": "949ffe......"
}
TrxHash: a5c86aa93c5889c1176ff3e36b7c5c372424c525d85dbe4a0d7ec2881f4eec53
{
    "errcode": 0,
    "msg": "trx receive succ",
    "result": {
        "trx": {
            "version": 1,
            "cursor_num": 5517,
            "cursor_label": 3051494823,
            "lifetime": 1542971302,
            "sender": "testdbsaveread",
            "contract": "bottos",
            "method": "deployabi",
            "param": "dc0003......",
            "sig_alg": 1,
            "signature": "286f8......"
        },
        "trx_hash": "160f500e2bec9ec2f817d96158f512d2ba741aa35a0133408e43dad4188b9be9"
    }
}
```

以上信息显示链已接收到请求，我们可以过一段时间通过如下命令输入transaction hash查看是否成功执行：

```
./bcli transaction  get --trxhash 160f500e2bec9ec2f817d96158f512d2ba741aa35a0133408e43dad4188b9be9
```

如果以上命令长时间查不到该transaction信息，说明transaction执行失败，可以通过如下一个调试用rest接口查询错误码：

```
curl  http://RESTHost:RESTPort/v1/transaction/status -X POST -d '{"trx_hash": "160f500e2bec9ec2f817d96158f512d2ba741aa35a0133408e43dad4188b9be9"}'
```



# ４. 合约调用

合约部署完后，我们再来看一下如何调用合约。

目前bcli也提供了调用合约的方式，比如我们要调用上面合约的start方法：（假设callaccount账户已经创建，并且钱包已经解锁）

```
./bcli transaction push --sender callaccount --method start --contract testdbsaveread --param "valueA:1, valueB:2"
```

上面是用callaccount发起一次调用，调用testdbsaveread账户下合约的start方法，参数valueA和valueB分别为1和2，参数格式来源于abi的定义，如下，里面定义了start方法的参数是TestStruct结构，里面的两个变量名分别为valueA和valueB：

```
{
	"types": [],
	"structs": [
              {
              	"name": "TestStruct",
              	"base": "",
              	"fields": {
              		"valueA": "uint32",
              		"valueB": "uint32"
                    }
              	}
       ],
	"actions": [
              {
              	"action_name": "start",
              	"type": "TestStruct"
              }
       ],
	"tables": [
              {
              	"table_name": "testTableName",
              	"index_type": "string",
              	"key_names":  [
              		"keyName"
              	 ],
              	"key_types":  [
              		"string"
              	 ],
              	"type": "uint32_t valueA;"
              }
       ]
}
```

同理，我们可以过一段时间通过如下命令输入transaction hash查看是否成功执行：

```
./bcli transaction  get --trxhash 160f500e2bec9ec2f817d96158f512d2ba741aa35a0133408e43dad4188b9be9
```

如果以上命令长时间查不到该transaction，说明transaction执行失败，可以通过如下一个调试用rest接口查询错误码：

```
curl  http://RESTHost:RESTPort/v1/transaction/status -X POST -d '{"trx_hash": "160f500e2bec9ec2f817d96158f512d2ba741aa35a0133408e43dad4188b9be9"}'
```

合约正确执行后，则保存至链上的数据valueA和valueB分别是2和3，可以通过如下命令进行查询：

```
./bcli  gettable --account testdbsaveread --table testTableName --key testKeyName
{
    "contract": "testdbsaveread",
    "object": "testTableName",
    "key": "testKeyName",
    "value": "dc0002ce00000002ce00000003"
}

Table data is : map[valueA:2 valueB:3] 
```



# ５. 附录

## 5.1. 附1：供合用调用的接口函数

- void prints(char *str, uint32_t len);

  功能：打印字符串

  参数说明：

| 参数 | 类型     | 说明               |
| ---- | -------- | ------------------ |
| str  | char*    | 要打印的字符指针   |
| len  | uint32_t | 要打印的字符串长度 |

  

- void printi(uint64_t param);

| 参数  | 类型     | 说明         |
| ----- | -------- | ------------ |
| param | uint64_t | 要打印的整数 |

  

- uint32_t setBinValue(char* object, uint32_t objLen, char* key, uint32_t keyLen, char *value, uint32_t valLen);

  功能：保存数据至链上

  参数说明：

| 参数   | 类型     | 说明                         |
| ------ | -------- | ---------------------------- |
| object | char*    | 保存的数据对应的表名称       |
| objLen | uint32_t | 保存的数据对应的表名称的长度 |
| key    | char*    | 保存的数据的键值名称         |
| keyLen | uint32_t | 保存的数据的键值名称的长度   |
| value  | char*    | 要保存的数据                 |
| valLen | uint32_t | 要保存的数据的长度           |

  返回值：保存的数据长度

- uint32_t getBinValue(char* contract, uint32_t contractLen, char* object, uint32_t objLen, char* key, uint32_t keyLen, char *valueBuf, uint32_t valueBufLen);

  功能：从链上获取数据

  参数说明：

| 参数        | 类型     | 说明                         |
| ----------- | -------- | ---------------------------- |
| contract    | char*    | 获取的数据对应的合约名       |
| contractLen | uint32_t | 获取的数据对应的合约名的长度 |
| object      | char*    | 获取的数据对应的表名称       |
| objLen      | uint32_t | 获取的数据对应的表名称的长度 |
| key         | char*    | 获取的数据的键值名称         |
| keyLen      | uint32_t | 获取的数据的键值名称的长度   |
| valueBuf    | char*    | 用于存储数据的缓冲区         |
| valueBufLen | uint32_t | 用于存储数据的缓冲区的长度   |

  返回值：获取的数据的长度

- uint32_t removeBinValue(char* object, uint32_t objLen, char* key, uint32_t keyLen);

  功能：从链上删除数据

  参数说明：

| 参数   | 类型     | 说明                         |
| ------ | -------- | ---------------------------- |
| object | char*    | 删除的数据对应的表名称       |
| objLen | uint32_t | 删除的数据对应的表名称的长度 |
| key    | char*    | 删除的数据的键值名称         |
| keyLen | uint32_t | 删除的数据的键值名称的长度   |

  返回值：删除的数据的长度

- uint32_t getParam(char *param, uint32_t bufLen);

  功能：获取调用合约时参数

  参数说明：

| 参数   | 类型     | 说明             |
| ------ | -------- | ---------------- |
| param  | char*    | 存储参数的缓冲区 |
| bufLen | uint32_t | 存储参数的缓冲区 |

  返回值：获取的参数的长度

- bool callTrx(char *contract , uint32_t contractLen, char *method , uint32_t methodLen,  char *buf , uint32_t bufLen );

  功能：调用其他合约（异步方式）

  参数说明：

| 参数        | 类型     | 说明                       |
| ----------- | -------- | -------------------------- |
| contract    | char*    | 要调用合约的名称           |
| contractLen | uint32_t | 要调用合约的名称的长度     |
| method      | char*    | 要调用合约的方法名称       |
| methodLen   | uint32_t | 要调用合约的方法名称的长度 |
| buf         | char*    | 调用合约传入的参数         |
| bufLen      | uint32_t | 调用合约传入的参数的长度   |

  返回值：true: 成功，false: 失败

- uint32_t getCtxName(char *str , uint32_t len);

  功能：获取合约名称

  参数说明：

| 参数 | 类型     | 说明                       |
| ---- | -------- | -------------------------- |
| str  | char*    | 存储合约名称的缓冲区       |
| len  | uint32_t | 存储合约名称的缓冲区的长度 |

  返回值：所获取账户名称的长度

- uint32_t  getSender(char *str , uint32_t len);

  功能：获取调用当前合约的账户名称

  参数说明：

| 参数 | 类型     | 说明                       |
| ---- | -------- | -------------------------- |
| str  | char*    | 存储账户名称的缓冲区       |
| len  | uint32_t | 存储账户名称的缓冲区的长度 |

  返回值：所获取账户名称的长度

- bool isAccountExist(char *name， uint32_t nameLen);

  功能：检查账户是否存在

  参数说明：

| 参数    | 类型     | 说明                     |
| ------- | -------- | ------------------------ |
| name    | char*    | 所要检查的账户           |
| nameLen | uint32_t | 所要检查的账户名称的长度 |

  返回值：true: 存在，false: 不存在



## 5.2. 附2：MessagePack序列化

### 5.2.1 概述

为了便于调用合约时的参数传输，以及读取合约的持久化数据，我们选择了MessagePack这种轻量级的编解码方法，详细的规范参考：

https://msgpack.org/

https://github.com/msgpack/msgpack/blob/master/spec.md

另外针对合约数据的特点，我们进行了一些裁剪：

1. 基本类型：支持uint8、uint16、uint32、uint64、array16、bin16、str16类型；
2. 变长数据：比如str类型，MessagePack原规范根据字符串长度填写长度字节，有1、2、4字节长度的不同，改造后默认使用2字节（str16)，bin类型和array类型也是，即只支持bin16、array16这种类型；
3. 结构体：采用array形式封装结构体，编码时首先写array16头，再依次编码各字段。

例子(C)：

```
struct user_login {
    char user_name[USER_NAME_MAX_LEN];
    uint32_t random_num;
};

user_login login;
strcpy(login.user_name, "testuser");
login.random_num = 99;

pack_array16(&ctx, 2);
pack_str16(&ctx, login->user_name, strlen(login->user_name));
pack_u32(&ctx, login->random_num);

```

编码结果：

```
0xdc, 0x00, 0x02, 0xda, 0x00, 0x08, 0x74, 0x65, 0x73, 0x74, 0x75, 0x73, 0x65, 0x72, 0xce, 0x00, 0x00, 0x00, 0x63

```



### 5.2.2 编码规范

**Types**

- **Integer** represents an integer
- Raw
  - **String** extending Raw type represents a UTF-8 string
  - **Binary** extending Raw type represents a byte array
- **Array** represents a sequence of objects



**Format**

| format name | first byte (in binary) | first byte (in hex) |
| ----------- | ---------------------- | ------------------- |
| bin16       | 11000101               | 0xc5                |
| uint8       | 11001100               | 0xcc                |
| uint16      | 11001101               | 0xcd                |
| uint32      | 11001110               | 0xce                |
| uint64      | 11001111               | 0xcf                |
| str16       | 11011010               | 0xda                |
| array16     | 11011100               | 0xdc                |

**Notation in diagrams**

```
one byte:
+--------+
|        |
+--------+

a variable number of bytes:
+========+
|        |
+========+

variable number of objects stored in MessagePack format:
+~~~~~~~~~~~~~~~~~+
|                 |
+~~~~~~~~~~~~~~~~~+

```

**int format family**

Int format family stores an integer in 2, 3, 5, or 9 bytes.

```
uint 32 stores a 32-bit big-endian unsigned integer
+--------+--------+--------+--------+--------+
|  0xce  |ZZZZZZZZ|ZZZZZZZZ|ZZZZZZZZ|ZZZZZZZZ|
+--------+--------+--------+--------+--------+

uint 64 stores a 64-bit big-endian unsigned integer
+--------+--------+--------+--------+--------+--------+--------+--------+--------+
|  0xcf  |ZZZZZZZZ|ZZZZZZZZ|ZZZZZZZZ|ZZZZZZZZ|ZZZZZZZZ|ZZZZZZZZ|ZZZZZZZZ|ZZZZZZZZ|
+--------+--------+--------+--------+--------+--------+--------+--------+--------+

```

**str format family**

Str format family stores a byte array in 3 bytes of extra bytes in addition to the size of the byte array.

```
str 16 stores a byte array whose length is upto (2^16)-1 bytes:
+--------+--------+--------+========+
|  0xda  |ZZZZZZZZ|ZZZZZZZZ|  data  |
+--------+--------+--------+========+

where
* ZZZZZZZZ_ZZZZZZZZ is a 16-bit big-endian unsigned integer which represents N
* N is the length of data

```

**bin format family**

Bin format family stores an byte array in 3 bytes of extra bytes in addition to the size of the byte array.

```
bin 16 stores a byte array whose length is upto (2^16)-1 bytes:
+--------+--------+--------+========+
|  0xc5  |YYYYYYYY|YYYYYYYY|  data  |
+--------+--------+--------+========+

where
* YYYYYYYY_YYYYYYYY is a 16-bit big-endian unsigned integer which represents N
* N is the length of data

```

**array format family**

Array format family stores a sequence of elements in 3 bytes of extra bytes in addition to the elements.

```
array 16 stores an array whose length is upto (2^16)-1 elements:
+--------+--------+--------+~~~~~~~~~~~~~~~~~+
|  0xdc  |YYYYYYYY|YYYYYYYY|    N objects    |
+--------+--------+--------+~~~~~~~~~~~~~~~~~+

where
* YYYYYYYY_YYYYYYYY is a 16-bit big-endian unsigned integer which represents N
    N is the size of a array

```



**Serialization: type to format conversion**

MessagePack serializers convert MessagePack types into formats as following:

| source types | output format                                       |
| ------------ | --------------------------------------------------- |
| Integer      | int format family (positive fixint uint 8/16/32/64) |
| String       | str format family (str16)                           |
| Binary       | bin format family (bin16)                           |
| Array        | array format family (array16)                       |



**Deserialization: format to type conversion**

MessagePack deserializers convert MessagePack formats into types as following:

| source formats                  | output type |
| ------------------------------- | ----------- |
| positive fixint,uint 8/16/32/64 | Integer     |
| str16                           | String      |
| bin16                           | Binary      |
| array16                         | Array       |

