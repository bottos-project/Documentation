# Using C++ to Write Smart Contracts
# １.Write a Smart Contract

We chiefly use the sample [testDbSaveAndRead] to interpret how to write and compile a basic contract.  from　https://github.com/bottos-project/contract-tool-cpp.git
(https://github.com/bottos-project/contract-tool-cpp/tree/master/testDbSaveAndRead)

It provides two methods in this sample of : hellworld and start(Following show the parts of code, for more details please refer to the git library).

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

Note：（For details of this code please refer to header file of dbSaveRead.hpp）

- The pure function prototype is "”int funcname()" which takes no parameters, the return value range is by [0, 0xfff] in which 0 means the execuation of contract in succeed, and other values stand for the errorcode according to the corresponding errors in the contract logicals. Users can get the errorcodes according to following command.

```
curl  http://RESTHost:RESTPort/v1/transaction/status -X POST -d '{"trx_hash": "trxhash"}'
```

- The functions should be compiled in C rules, as:

  ```
  extern "C" {
      int helloworld();
      int start();    
  }
  ```
The 'helloworld' function simply realizes the printing message in it, let us chiefly have a check with the logical of function 'start' in following chapters.

## 1.1. Get the Parameters from the Contract be called

Firstly we get the parameters injected from the "outside", then unmarshal them into local structures and print them out: 

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

The 'parseParam' is a template function in which it will invoke structure TestStruct's unmarshal function，thus we need define the function of 'unpack_struct' to be used in function 'parseParam'.

```
static bool unpack_struct(MsgPackCtx *ctx, TestStruct *info)
{    
    uint32_t size = 0;
    UNPACK_ARRAY(2)　//It means we have 2 elements in this package.

    UNPACK_U32(info,valueA)　//1st element: use the 32 unsigned integer to get the value of 'info->valueA'
    UNPACK_U32(info,valueB)  //2nd element: use the 32 unsigned integer to get the value of info->valueB'
    
    return true;
}
```
The UNPACK_ARRAY、UNPACK_U32 are some convinient micros, and we put these micros in the common header file 'contractcomm.hpp'.


## 1.2. Store the Data of the Contract

The second step in this sample is to put the changed elements onto the chain.

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

In this case, tableName and keyName stand for the table name and data values in the stored database, in which 'saveData' is a template function, which aims to invoke the marshal function of structure 'TestStruct'. Thus we need define the 'pack_struct' function to be used in function 'saveData'.

```
static bool pack_struct(MsgPackCtx *ctx, TestStruct *info)
{    
    PACK_ARRAY16(2)　//It means we have 2 elements to be packed to this package.

    PACK_U32(info,valueA)　//to marshal the info->valueA into the buffer as the 32 unsigned integer value
    PACK_U32(info,valueB)　//to marshal the info->valueB into the buffer as the 32 unsigned integer value

    return true;
}
```
The PACK_ARRAY16、PCACK_U32 are some convinient micros, and we put these micros in the common header file 'contractcomm.hpp'.


## 1.3. Read the Data Stored from the Contracts

The 3rd step in this sample is to get the raw data from the chain, and unmarshal them.

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
The 'saveData' is a template function in which it will read the data value according to the table name and keyword，and invoke the unmarshal function to get the unmarshaled data into struct of 'TestStruct'. Thus we need define the function of 'unpack_struct' to be used in function 'saveData'.

```
static bool unpack_struct(MsgPackCtx *ctx, TestStruct *info)
{    
    uint32_t size = 0;
    UNPACK_ARRAY(2)　 //It means we have two elements

    UNPACK_U32(info,valueA)　//1st element: use the 32 unsigned integer to get the value of 'info->valueA'
    UNPACK_U32(info,valueB)  //2nd element: use the 32 unsigned integer to get the value of 'info->valueB'
    
    return true;
}
```
Now the logical of this sample is done, let us compile this contract in the next step.


# ２. Compiling a Contract

The tool chain of the contract compiling is in https://github.com/bottos-project/contract-tool-cpp.git, eah contract we use each single folder，like: [testDbSaveAndRead](https://github.com/bottos-project/contract-tool-cpp/tree/master/testDbSaveAndRead)，please come into this directory as you need to compile it, then do as:

```
python ../gentool.py wasm dbSaveRead.cpp
```
After compiling, the file dbSaveRead.wasm will be generated.

Then have a check about how an abi file can be created. First we introduce how an abi file be composed, as you can refer to the generated file 'dbSaveRead.abi':

- structs ：The structure definitions from the tool scanning , to be used later;
- actions： The methods' descriptions of the contract,in which 'action_name' is the method name, 'type' is the parameters that invoke a contract.
- tables ：  The contract persistence data provider description, that is, the contract saved data description, where table_name is the table name, Index_type is the type of index, Key_names and Key_types are the name and type of the key value, type is the structure definition of the saved data.

The ABI file is generated by scanning the hpp file, and the Hpp file is annotated to tell the scanner the specific definition:

- "//@abi action start"：

​        This contract defines two methods in which the entry corresponding to the start is defined as Teststruct;

- ”//@abi table testTableName:[index_type:string, key_names:keyName, key_types:string] “

​      We defined a table in which the structure of the table content is defined as Testtablename 。

The ABI file corresponding to the HPP file can be scanned with the following command under the Testdbsaveandread folder:

```
python ../gentool testRegUser.hpp
```

After the command is executed, the corresponding ABI file Dbsaveread.abi will be generated.


# ３. Deploy a Contract

Let's take another look at how the contract is deployed: 

Deployment can be done using the provided BCLI command, assuming that the account Testdbsaveread already exists and its corresponding wallet has been unlocked, you can deploy the contract as follows, please refer to the BCLI contract deployment related description in detail.

```
./bcli contract deploy --account testdbsaveread --code $filepath/dbSaveRead.wasm --abi $filepath/dbSaveRead.abi
```

The referred feedback：

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

The above information shows that the chain has received the request, we can after a period of time through the following command to enter transaction hash to see if the successful execution:

```
./bcli transaction  get --trxhash 160f500e2bec9ec2f817d96158f512d2ba741aa35a0133408e43dad4188b9be9
```

If the above command does not find the transaction information for a long time, it means that the transaction execution is failed; You can query the error code with the rest interface with the following debugging:

```
curl  http://RESTHost:RESTPort/v1/transaction/status -X POST -d '{"trx_hash": "160f500e2bec9ec2f817d96158f512d2ba741aa35a0133408e43dad4188b9be9"}'
```



# ４. Invoke a Contract

After the contract is deployed, let's take a look at how to invoke the contract.

BCLI also provides a way to invoke contracts, such as the Start method we want to invoke the contract above: (assuming that the Callaccount account has been created and the wallet has been unlocked)

```
./bcli transaction push --sender callaccount --method start --contract testdbsaveread --param "valueA:1, valueB:2"
```
Above is a invoking initiated with callaccount, invoking the start method of the contract under Testdbsaveread account, the parameters Valuea and Valueb are 1 and 2, respectively, and the parameter format is derived from the definition of ABI, such as the following, The parameters that define the Start method are the TESTSTRUCT structure, and the two variable names inside are Valuea and VALUEB, respectively:

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

Similarly, we can enter transaction hash for a period of time with the following command to see if it was executed successfully:

```
./bcli transaction  get --trxhash 160f500e2bec9ec2f817d96158f512d2ba741aa35a0133408e43dad4188b9be9
```
If the above command does not find the transaction for a long time, it means that transaction's execution failed, you can query the error code with the rest interface with the following debugging:

```
curl  http://RESTHost:RESTPort/v1/transaction/status -X POST -d '{"trx_hash": "160f500e2bec9ec2f817d96158f512d2ba741aa35a0133408e43dad4188b9be9"}'
```
After the contract is executed correctly, the data Valuea and Valueb saved to the chain are 2 and 3, respectively, and can be queried by the following command:

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



# ５. Appendix

## 5.1. Attachment 1: Interface Function for a Contract

- void prints(char *str, uint32_t len);

  Function：print strings

  Parameter Description：

| Parameters | Type     | Description                              |
| ---------- | -------- | ---------------------------------------- |
| str        | char*    | the character pointer to print           |
| len        | uint32_t | Length of the character pointer to print |

  

- void printi(uint64_t param);

| Parameters | Type     | Description             |
| ---------- | -------- | ----------------------- |
| param      | uint64_t | the integer to be print |

  

- uint32_t setBinValue(char* object, uint32_t objLen, char* key, uint32_t keyLen, char *value, uint32_t valLen);

  Functions: Store the data to blockchain.

  Parameter Description：

| Parameters | Type     | Description                                              |
| ---------- | -------- | -------------------------------------------------------- |
| object     | char*    | The table name corresponding to the saved data           |
| objLen     | uint32_t | Length of the table name corresponding to the saved data |
| key        | char*    | Key value name of the saved data                         |
| keyLen     | uint32_t | Length of the key value name of the saved data           |
| value      | char*    | Data to be stored                                        |
| valLen     | uint32_t | Length of data to be stored                              |

  The Return Value：Length of the stored data

- uint32_t getBinValue(char* contract, uint32_t contractLen, char* object, uint32_t objLen, char* key, uint32_t keyLen, char *valueBuf, uint32_t valueBufLen);

  Functions: Obtain the data from the blockchain.

  Parameter Description：

| Parameters  | Type     | Description                                                    |
| ----------- | -------- | -------------------------------------------------------------- |
| contract    | char*    | The contract name corresponding to the obtained data           |
| contractLen | uint32_t | Length of the contract name corresponding to the obtained data |
| object      | char*    | The table name corresponding to the data                       |
| objLen      | uint32_t | Length of the table name corresponding to the data             |
| key         | char*    | The key value name of the data                                 |
| keyLen      | uint32_t | Length of the key value name of the data                       |
| valueBuf    | char*    | Buffers used to store data                                     |
| valueBufLen | uint32_t | Length of Buffers used to store data                           |

  The Return Value：Get the length of data.
  
- uint32_t getParam(char *param, uint32_t bufLen);

  Functions: Get the parameters from invoking a contract

  Parameter Description：

| Parameters | Type     | Description                               |
| ---------- | -------- | ----------------------------------------- |
| param      | char*    | Buffer for store the parameters           |
| bufLen     | uint32_t | Length of buffer for store the parameters |

  The Return Value：The total length of parameters.

- bool callTrx(char *contract , uint32_t contractLen, char *method , uint32_t methodLen,  char *buf , uint32_t bufLen );

  Functions: Invoke other contracts（Asynchronous mode）

  Parameter Description：

| Parameters  | Type     | Description                                             |
| ----------- | -------- | ------------------------------------------------------- |
| contract    | char*    | The name of the contract to invoke                      |
| contractLen | uint32_t | Length of the name of the contract to invoke            |
| method      | char*    | The method name to invoke the contract                  |
| methodLen   | uint32_t | Length of the method name to invoke the contract        |
| buf         | char*    | The inputting parameters as invoke a contract           |
| bufLen      | uint32_t | Length of the inputting parameters as invoke a contract |

  The Return Value：true: Success，false: Failure

- uint32_t getCtxName(char *str , uint32_t len);

  Functions: Get the name of the contract

  Parameter Description：

| Parameters | Type     | Description                                 |
| ---------- | -------- | ------------------------------------------- |
| str        | char*    | Buffer for storing contract names           |
| len        | uint32_t | Length of buffer for storing contract names |

  The Return Value：The length of the account name obtained

- uint32_t  getSender(char *str , uint32_t len);

  Functions: Gets the name of the account that invokes the current contract

  Parameter Description：

| Parameters | Type     | Description                                |
| ---------- | -------- | ------------------------------------------ |
| str        | char*    | Buffer for storing account names           |
| len        | uint32_t | Length of buffer for storing account names |

  The Return Value：The length of the account name obtained

- bool isAccountExist(char *name， uint32_t nameLen);

  Functions: Check if an account exists.

  Parameter Description：

| Parameters | Type     | Description                        |
| ---------- | -------- | ---------------------------------- |
| name       | char*    | The account to be checked          |
| nameLen    | uint32_t | Length of he account to be checked |

  The Return Value：true: exists，false: not exists



## 5.2. Attachment 2：Marshal for MessagePack

### 5.2.1 概述

In order to facilitate the parameters transmission when the contract is invoked, and to read the persistent data of the contract, we have selected Messagepack this lightweight codec method, detailed specification reference:

https://msgpack.org/

https://github.com/msgpack/msgpack/blob/master/spec.md

In addition, we have made some tailoring to the characteristics of the contract data:

1. Basic Type：Supports uint8、uint16、uint32、uint64、array16、bin16、str16Type；
2. Variable length data: For example strtype,messagepack the original specification according to the length of the string fill in the length of bytes, there are 1, 2, 4 byte length of the difference, after the transformation of the default use of 2 bytes (str16), Bintype and ArrayType is also, that is, only support Bin16, ARRAY16 this type;
3. Structure: The structure body is encapsulated in the form of array, the ARRAY16 head is written first, and then the fields are encoded in next turn.

Sample(C)：

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

Compiling Result：

```
0xdc, 0x00, 0x02, 0xda, 0x00, 0x08, 0x74, 0x65, 0x73, 0x74, 0x75, 0x73, 0x65, 0x72, 0xce, 0x00, 0x00, 0x00, 0x63

```


### 5.2.2 Coding Rules

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

