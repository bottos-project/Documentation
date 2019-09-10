![](./common/cover.jpg)

<div style="page-break-after: always;"></div>

<!-- TOC -->

- [1. Bottos Introduction](#1-bottos-introduction)
  - [1.1. Project Brief](#11-project-brief)
  - [1.2. System Architecture](#12-system-architecture)
  - [1.3. Network Structure](#13-network-structure)
  
- [2. Bottos Chain Browser](#2-getting-started)
  - [2.1. Bottos Chain Overview](#21-bottos-chain-overview)
  - [2.2. Activities on Bottos Chain](#22-activities-on-bottos-chain)
  - [2.3. Locations of Super Nodes](#23-locations-of-super-nodes)
  
- [3. Developing Guide](#3-developing-guide)
  - [3.1. Smart Contract](#31-smart-contract)
    - [3.1.1. Introduction to Smart Contract](#311-introduction-to-smart-contract)
    - [3.1.2. C++ smart contract developing example](#312-c-smart-contract-developing-example)
    - [3.1.3. JavaScript smart contract developing example](#313-javascript-smart-contract-developing-example)
  - [3.2. DAPP Development](#32-dapp-development)
    - [3.2.1. JavaScript contract development example](#321-javascript-contract-development-example)
  - [3.3. Development tools](#33-development-tools)
    - [3.3.1. Wallet SDK](#331-wallet-sdk)
    - [3.3.2. C++ Smart Contract Development SDK](#332-c-smart-contract-development-sdk)
    - [3.3.3. JavaScript Smart Contract Development SDK](#333-javascript-smart-contract-development-sdk)
  - [3.4. BCLI Command](#34-bcli-command)
  
- [4. Run Bottos Locally](#4-run-bottos-locally)
  - [4.1. Setup Environment](#41-setup-environment)
    - [4.1.1. Basic environment preparation](#411-basic-environment-preparation)
      - [4.1.1.1. Operating System](#4111-operating-system)
      - [4.1.1.2. Node base version package installation](#4112-node-base-version-package-installation)
    - [4.1.2. Single node developing environment](#412-single-node-developing-environment)
    - [4.1.3. Multi-Nodes developing environment](#413-multi-nodes-developing-environment)
  - [4.2. Prepare the Bottos Version](#42-prepare-the-bottos-version)
  - [4.3. Ready to run environment](#43-ready-to-run-environment)
    - [4.3.1. Start the local single-node environment](#431-start-the-local-single-node-environment)
    - [4.3.2. Join an existing test network](#432-join-an-existing-test-network)
  - [4.4. Experience basic operations](#44-experience-basic-operations)
    - [4.4.1. Create the Wallet](#441-create-the-wallet)
    - [4.4.2. Create Account](#442-create-account)
    - [4.4.3. Stake](#443-stake)
    - [4.4.4. Claim](#444-claim)
    - [4.4.5. Vote Resources](#445-vote-resources)
    - [4.4.6. Space Resources](#446-space-resources)
    - [4.4.7. Time Resources](#447-time-resources)
    - [4.4.8. Experience the BTO transfer](#448-experience-the-bto-transfer)
  
- [5. Supernode startup guide](#5-supernode-startup-guide)
  - [5.1. Basis of preparation](#51-basis-of-preparation)
  - [5.2. Safe lifting](#52-safe-lifting)
  
- [6. Resource repository](#6-resource-repository)
  - [6.1. C++ Contract Development SDK](#61-c-contract-development-sdk)
  - [6.2. JavaScript Contract Development SDK](#62-javascript-contract-development-sdk)
  - [6.3. Wallet Development SDK](#63-wallet-development-sdk)
  - [6.4. Common REST API](#64-common-rest-api)
  - [6.5. Wallet API](#65-wallet-api)

<!-- /TOC -->

# 1.Bottos Introduction


## 1.1.Project Brief

Bottos is an infrastructure that serves for the artificial intelligence, not only a public underlying block-chain be designed based on features of data, but also a data circulation platform serves the whole artificial intelligence and its derivative industries. By means of data mining and using smart contracts, Bottos realizes a consensus-based, scalable, easy-to-develop, and collaborative one-stop application platform that based on data, models, calculation, and storage of multi-tiered shared services.

Bottos can be deployed in fields of big data, artificial intelligence, smart hardware, robotics, IOT, VR/AR, etc,. To simply put, it is not just an artificial intelligence public chain, it also has the data and model circulation service, which realizes the value circulation of artificial intelligence and its derivative industry based on data feeding, and finally forms a new ecological of distributed AI.

As a fundamental public chain which is designed to serve the artificial intelligence industry, Bottos’ performance advantages are concentrated in data flow, as well as calculation force, storage sharing and so on, with strong industrial attributes. Its original technical features include intelligent currency design, lottery DPOS algorithm and distributed storage with AI algorithm, which has a leading competitive advantage in data privacy protection, oversized data storage and so on.

The target of Bottos fundamental public chain is to create a decentralized data flow platform, solve the difficult pain points of artificial intelligence training data acquisition, then attract artificial intelligence and its derivative industries to actively enter the platform. Through data and model certainty, users are encouraged to share and speed up the flow of transactions. Through the intelligent contract lifecycle management, Bottos helps AI and its derivative industries eliminate trust costs and increase efficiency.

The application development layer of Bottos is chiefly based on Dapps which be divided into three categories: Artificial Intelligence class, artificial intelligence derivative category, block chain Technical Service category. The block chain technology are continues iteration and increasing, such as Lightning Network, ORALCE, side chain, cross-chain, etc.,; In order to improve the Bottos ecology, the artificial intelligence Dapp is represented by simple software, with the features of data feeding model iterative upgrading; Artificial intelligence derivative Dapps which include intelligent hardware(be represented by the combination of soft and hard), IOT, robots, etc., and collects new data through hardware, are the source channels of AI data. These Dapps form a closed loop of data between each other, which can eventually form a global scale of data pools, while there is also a demand between Dapps intelligent modules to form a demand map through blockchain technology, which will eventually result in a large pool of modules.


## 1.2. System Architecture

Bottos is a basic infrastructure which focuses on the field of artificial intelligence. It is not only a public underlying blockchain based on data, but it is also a data exchange platform serving the whole artificial intelligence and its derivative industries.
The data exchange upon Bottos' blockchain is the world's largest data collection pool based on blockchain technology, addressing the difficult pain points of high-quality data acquisition in the artificial intelligence (AI) industry, creating smart data equity contracts, using data mining to achieve personal data wealth sharing, and establishing a value link between personal data and AI models.

Therefore, the hierarchical architecture is adopted in the design of Bottos system, which facilitates the dynamic expansion and flexible deployment of the system. The overall system is divided into three layers, as shown below.

Core layer: The Chainbase layer, providing chain service based on blockchain, constructing trust public chain infrastructure and realizing the basic function of block chain.

Service Layer: Provides basic services based on Bottos chain development based on Chainbase, such as providing distributed identity services, distributed storage, contracts and token management services, in order to achieve rapid DApp development;

Application Layer: A collection of applications based on Bottos development.

Currently, this article chiefly introduces how to use the services of core layer, (that is to say, the block chain’s basic services), and we provide the corresponding development interface and use cases, the basic interface and mode of wallet.

The overall technical architecture of the Bottos system is shown in the following figure.

![](../common/BottosArchitecture.png)


## 1.3. Network Structure

### 1.3.1 The overall of network

There are three typical roles in Bottos networks：
- The end user
- The provider of end-user access services
- The super node (block producer)

&nbsp;

These three roles divide the Bottos network into three layers, as shown in the figure below respectively:

- The access layer where the end users are located, and the terminal network that these end users may form

- A service layer formed between provider nodes which provide the accessing services

- A producer network that consisting of supernodes

&nbsp;
&nbsp;
![](../common/net_hierarchy.png)


&nbsp;
&nbsp;
### 1.3.2. Super Node Network

Supernodes undertake the execution and recording of all transactions in the whole network, which is the fundation for the stability of the whole network. Therefore, Bottos adopts the full-connection networking in the design of the supernode network, as shown in the figure below (take a full connection of 10 supernodes as an example. The actual number of super nodes is 49, among which 29 are selected for each round and the other 20 nodes are optional)

![](../common/fullmesh.png)

&nbsp;
&nbsp;

### 1.3.3. Connections with Other Nodes

Other types of nodes except super nodes are loosely organized networks, similar to the mesh structure in the following figure.

![](../common/mesh.png)


&nbsp;
&nbsp;

### 1.3.4. Node Layers

Bottos nodes are divided into: basic service nodes, application-oriented nodes, light nodes and ultra-light nodes. Each node checks and balances and complements each other, forming a dynamic balance of the self-consistent node system.

-  **Basic service nodes**

```
The Basic Service node provides the fundamental  service of the whole Bottos blockchain system, in addition to supporting the core functions of the blockchain core, such as transaction consensus, contract deployment, block production, etc., it also supports the main functions that provided by the Bottos service layer, such as unified identity system, storage management services, credit services, Token management and contract management and other key functions, to provide the most important production services for the overall Bottos network.
```

-  **Application nodes**
```
The kind of application node primarily serves different Dapps’ deployments in the ecosystem, and application node can be deployed on itself, or be deployed on the fundamental nodes. (Logical applications on each fundamental node can charge a certain deployment threshold fee in future.)
```

-  **Lightweight nodes**
```
The lightweight node chiefly works as the data verification node of Bottos, and it does not provide the corresponding function of the service layer. It only carries on the block data’s synchronization and so on, and can also support the Bottos core Layer basic service.
```


-  **Ultra lightweight nodes**
```
The ultra lightweight node chiefly handles the block correlation head verification, and synchronizes the key hash data, etc.
```


# 2.Bottos Chain Browser


[Bottos Browser](http://explorer.botfans.org) link is http://explorer.botfans.org

## 2.1. Bottos Chain Overview

![](./common/1.png)

## 2.2. Activities on Bottos Chain

![](./common/2.png)

## 2.3. Locations of Super Nodes

![](./common/3.png)

![](./common/4.png)


# 3.Developing Guide


## 3.1. Smart Contract


### 3.1.1. Introduction to Smart Contract

The Bottos smart contract supports both C++ and JavaScript. The smart contract that supports the C++ language is run on a virtual machine based on wagon/wasm. The coding rules and ABI are described separately for the user.

### 3.1.2. C++ smart contract developing example

#### 3.1.2.1.Write a Smart Contract

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

Or, through Bcli command shown as follwoing:

```
 bcli transaction get --trxhash  <hash>
```

- The functions should be compiled in C rules, as:

  ```
  extern "C" {
      int helloworld();
      int start();    
  }
  ```
The 'helloworld' function simply realizes the printing message in it, let us chiefly have a check with the logical of function 'start' in following chapters.

##### 3.1.2.1.1 Get the Parameters from the Contract be called

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


##### 3.1.2.1.2. Store the Data of the Contract

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


##### 3.1.2.1.3. Read the Data Stored from the Contracts

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


#### 3.1.2.2. Compiling a Contract

The tool chain of the contract compiling is in https://github.com/bottos-project/contract-tool-cpp.git, eah contract we use each single folder，like: [testDbSaveAndRead](https://github.com/bottos-project/contract-tool-cpp/tree/master/testDbSaveAndRead)，please come into this directory as you need to compile it, then do as:

```
python ../gentool.py --type wasm --file dbSaveRead.cpp
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
python ../gentool --file testRegUser.hpp
```

After the command is executed, the corresponding ABI file Dbsaveread.abi will be generated.


#### 3.1.2.3. Deploy a Contract

Let's take another look at how the contract is deployed: 

Deployment can be done using the provided BCLI command, assuming that the account Testdbsaveread already exists and its corresponding wallet has been unlocked, you can deploy the contract as follows, note that "dbcontract" is the name we assign to the contract here, please refer to the BCLI contract deployment related description in detail.

```
./bcli contract deploy --contract dbcontract --code $filepath/dbSaveRead.wasm --abi $filepath/dbSaveRead.abi --account testdbsaveread
```

The referred feedback：

```
Push transaction done for deploying contract testdbsaveread	TrxHash: 160f500e2bec9ec2f817d96158f512d2ba741aa35a0133408e43dad4188b9be9
Trx: 	
	This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>
```

The above information shows that the chain has received the request, we can after a period of time through the following command to enter transaction hash to see if the successful execution:

```
./bcli transaction  get --trxhash 160f500e2bec9ec2f817d96158f512d2ba741aa35a0133408e43dad4188b9be9
```

Or, you can also inquiry the transaction by following restful api:

```
curl  http://RESTHost:RESTPort/v1/transaction/status -X POST -d '{"trx_hash": "160f500e2bec9ec2f817d96158f512d2ba741aa35a0133408e43dad4188b9be9"}'
```



#### 3.1.2.4. Invoke a Contract

After the contract is deployed, let's take a look at how to invoke the contract.

BCLI also provides a way to invoke contracts (The invoked contract's name format should be "contract name@deployed account"), such as the Start method we want to invoke the contract above: (assuming that the Callaccount account has been created and the wallet has been unlocked)

```
./bcli transaction push --sender callaccount --method start --contract dbcontract@testdbsaveread --param "valueA:1, valueB:2"
```
Above is a invoking initiated with callaccount, invoking the start method of the contract of "dbcontract" under the Testdbsaveread account, the parameters Valuea and Valueb are 1 and 2, respectively, and the parameter format is derived from the definition of ABI, such as the following, The parameters that define the Start method are the TESTSTRUCT structure, and the two variable names inside are Valuea and VALUEB, respectively:

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
./bcli  gettable --contract dbcontract@testdbsaveread --table testTableName --key testKeyName
{
    "contract": "dbcontract@testdbsaveread",
    "object": "testTableName",
    "key": "testKeyName",
    "value": "dc0002ce00000002ce00000003"
}

Table data is : map[valueA:2 valueB:3]  
```



#### 3.1.2.5. Appendix

##### 3.1.2.5.1. Attachment 1: Interface Function for a Contract

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



##### 3.1.2.5.2. Attachment 2：Marshal for MessagePack

###### 3.1.2.5.2.1 Abstract

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


###### 3.1.2.1.5.2.2 Coding Rules

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

### 3.1.3. JavaScript smart contract developing example

#### 3.1.3.1. Using C++ to Write Smart Contracts

`Note:`  
This tutorial is based on the node.js development environment. If you do not have it installed on your computer, please install the node.js environment yourself.

##### 3.1.3.1.1. Initialize the project

Download contracts integrated development framework `contract-tool-js`, and initialize the project

```
sudo npm i contract-tool-js -g
contract-tool-js init MyDapp
cd MyDapp
```

The following project structure can be generated by the appeal initialization step

```
- config
    - config.js //Store your configuration files
    - keystore.json  // Store your deployment contractor's keystore secret key file
- contract
    - abi.json  // An Abi structure for placing smart contracts
    - contract.js // Store your smart contract codes
- tools  
    - deploy.js  // Store your smart contract deploy codes
- test  
    - test.js  // Store your smart contract testing codes
```

##### 3.1.3.1.2. Developing for Smart Contract and ABI

The smart contract is developed under the directory of `contract`

File `contract/contract.js`: Store the smart contract codes
File `contract/abi.json`: The abi description file that corresponding to smart contract

Bottos currently supports only single-contract files with the following points:

```
1. Cannot use NPM installed third-party dependencies
2. Only contract file deployment is supported under one account, not multi-contract file deployment
```

The abi file describes the template as follows.

```
{
    "to":{"type":"string"},
    "value":{"type":"uint32"},
    "from":{"type":"string"},
    "contract":{
      "type":"object",
      "name":{"type":"string"},
      "sdfkjds":{
        "type":"object",
        "ksjdfl":{"type":"string"}
      }
    }
}
```

There are several types of all fields

```
uint8
uint16
uint32
uint64
uint256
string
bin16
object
array
```

##### 3.1.3.1.3. Deploy the Smart Contract and ABI

After the smart contract and ABI have been developed done, we need to deploy the smart contract and ABI files to the chain.

`Note:`You can create an account with Bottos's official wallet to get the keystore.

- Paste the account's `keystore` entire file contents into file `config/keystore json`
- Configure the `keystore_pwd` from the keystore's account in file `config/config.js`
- Run the command to deploy the contract and ABI files

```
npm run deployContract  // Deploy the smart contract
npm run deployAbi  // Deploy the ABI file
```

##### 3.1.3.1.4. Testing your Smart Contract

Write the testing codes in file `test/test.js` and run following command to test that smart contract.

```
npm test
```

##### 3.1.3.1.5. Related built-in libraries

**Storage**

- Storage.set(table,key,value)
- Storage.get(contract,table,key)

**Lib**

- Lib.getParams()
- Lib.getPack(obj:object)
- Lib.getUnpack(packstr:string)


##### 3.1.3.1.6. Related documentations

- [bottos-sdk-js API Document](https://github.com/bottos-project/bottos-sdk-js/wiki/API-Document)
- Official development documentation :http://www.bottos.org/

## 3.2. DAPP Development

### 3.2.1. JavaScript contract development example

#### Dapp Development and commissioning

##### Download and introduce the `SDK` library file

Download and import `bottos-sdk-js.min.js` library files

`bottos-sdk-js.min.js` file download address :https://github.com/bottos-project/bottos-sdk-js

##### Create a basic project structure

```
Project Catalog
    - index.html
    - index.js
    - bottos-sdk-js.min.js
```
- index.html

By injecting the `Index.js` and ` bottos-sdk-js.min.js` in index.html, the code is as follows

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=375px, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Bottos Demo</title>
    <script src="./bottos-sdk-js.min.js"></script>
    <script src="./index.js"></script>
</head>
<body>
    <div style="margin-top:50px">
        <button style="width:100px;height:30px;background-color:coral" onClick="createAccount()">Create Account</button>
        <button style="width:100px;height:30px;background-color:coral" onClick="pushTransaction()">Publish the contacts</button>
        <button style="width:100px;height:30px;background-color:bisque" onClick="getTransaction()" >Get the contacts</button>
    </div>


    <div style="margin-top:100px">
        <p>Create account excution result</p>
        <div id="createAccount" style="min-height:150px;background-color:#ccc">

        </div>
    
        <p>Publish the contact people execution result</p>
        <div id="pushTransaction" style="min-height:150px;background-color:#ccc">
    
        </div>
    
        <p>Get the contact people execution result</p>
        <div id="getTransaction" style="min-height:150px;background-color:#ccc">
    
        </div>
    </div>
    
</body>
</html>


```

- index.js

`Index.js` implements the write and read operation of the smart contract on the chain, the code is as follows

```
var BottosWalletSDK = window.BottosWalletSDK
const config = {
    baseUrl:'http://192.168.52.130:8689/v1',
    version:1
}
var SDK = new BottosWalletSDK(config)
var Tool = SDK.Tool
var Wallet = SDK.Wallet
var Contract = SDK.Contract
var Api = SDK.Api

let account = 'testaccount'
let password = 'testpassword'
let keystore = null

// Create account
function createAccount(){
    console.log("createAccount")
    let params = {account:account,password:password}
    Wallet.createAccount(params)
        .then(response=>{
            keystore = response
            document.getElementById('createAccount').innerHTML = JSON.stringify(response)
        }).catch(error=>{
            console.log({error})
            document.getElementById('createAccount').innerHTML = JSON.stringify(error)
            
        })
}

// Invoke the contract
function callContract(requestParam){
    let params = {
        method:'reguser',
        contract:'john',
        sender:account,
        param:{
            userName:'john',
            userInfo:JSON.stringify({phone:'110120',age:18})
        }
    }

    if(keystore == null){
        alert('Please create the account at first')
        return
    }
    let privateKey = Wallet.recover(password,keystore)
    let privateKeyStr = Tool.buf2hex(privateKey)

    Contract.callContract(params,privateKeyStr)
        .then(response=>{
            console.log({response})
            document.getElementById('pushTransaction').innerHTML = JSON.stringify(response)
        }).catch(error=>{
            console.log({error})
            document.getElementById('pushTransaction').innerHTML = JSON.stringify(error)
        })
}

// publish the cotact people
function pushTransaction(){
    console.log("pushTransaction")
    callContract()
}

// Read the contact people
function getTransaction(){
    console.log("getTransaction")
    // callContract()
    let url =  config.baseUrl + '/common/query'
    let params = {
        contract:'john',
        object:'userreginfo',
        key:'john'

    }

    fetch(url,{
        method:'POST',
        body:JSON.stringify(params)
    }).then(function(response){return response.json()})   
    .then(function(response){
        document.getElementById('getTransaction').innerHTML = JSON.stringify(response)
    }).catch(function(error){
        document.getElementById('getTransaction').innerHTML = JSON.stringify(error)
    })
}
```

##### Verify the Contract Execution Results

- Create an account as a first

Click `Create account` and if the following structure is returned, the account creation is successful and the return value is the user's `KeyStore` file and needs to be securely saved.

```
{"account":"testaccount","crypto":{"cipher":"aes-128-ctr","ciphertext":"4cd010eba51ff45d9a752f38d64a4def7697a142570253cc381afa2b04288e68","cipherparams":{"iv":"46b469bb1c87751852857114b928e6ad"},"mac":"04051cce0379362c28d8027a19c8b79f03621602c2eff68d8b793f94ae6f58fb","kdf":"scrypt","kdfparams":{"dklen":32,"n":1024,"r":1,"p":8,"salt":"cf9dbed2413764c640018b9fccb6629ed38dad72b333c7d12e89994523ec7857"}},"id":"48a923c2-1c40-46aa-b0c1-8f24d8e1bc81","version":3}
```

- Writing a contract

Click the `Publish Contacts` button to indicate that the write contract was executed successfully if the following results are returned

```
{"errcode":0,"msg":"trx receive succ","result":{"trx":{"version":1,"cursor_num":286,"cursor_label":423110953,"lifetime":1537498176,"sender":"testaccount","contract":"john","method":"reguser","param":"dc0002da00046a6f686eda001b7b2270686f6e65223a22313130313230222c22616765223a31387d","sig_alg":1,"signature":"4149cb35eab48415082081aee0ab3766b7a6730b1a2213c96638540227a8616f17cdf773ba90e3c515183c3fc5631fa53b65dcf93eed320d53ec78a672738675"},"trx_hash":"eb79dc2d8a8461451ea55257fcbaa5897a9b9732e7cc3b0c8a8322ab4909789b"}}
```

- Reading a contract

Click the `Read Contacts` button and if the following results are returned, the read contract execution is successful

```
{"errcode":0,"msg":"success","result":{"contract":"john","object":"userreginfo","key":"john","value":"dc0001da001b7b2270686f6e65223a22313130313230222c22616765223a31387d"}}
```
At this point, one of our simple and complete dapp has been developed, and if you want to develop a more powerful dapp, you can view detailed interface documentation



## 3.3. Development tools

### 3.3.1. Wallet SDK

[Wallet SDK](https://github.com/bottos-project/bottos-js-crypto) already on Github

### 3.3.2. C++ Smart Contract Development SDK

[C++ Development SDK](https://github.com/bottos-project/contract-tool-cpp) already on Github

### 3.3.3. JavaScript Smart Contract Development SDK

[JavaScript Development SDK](https://github.com/bottos-project/contract-tool-js) already on Github

## 3.4. BCLI Command

### Bottos BCLI Usage Specification

 
### 3.4.1 BCLI Tool Briefly Description

Bottos BCLI realizes the human-computer interaction command line, and chiefly help to realize the accounts creation, information querying from the chain, balances transfer, wallet functions, etc., by interacting with the block chain based on RESTFUL API.

### 3.4.2 BCLI Tool Installation and Deployment

Do 'go build' command under the BCLI directory of BOTTOS code's directory, then the bcli executable file will be generated after a successful compilation.


### 3.4.3 BCLI Command Line Description

The Global Option Parameter Description

| Global Options | Parameters description |
| -------------- | :--------------------: |
| --servaddr     | The global restful address' configuration |



The global help information
​    
​    ./bcli --help
​    
​    NAME:
​    Bottos bcli tool - a tool that makes user communicate with bottos blockchain
​    
    USAGE:
    bcli [global options] command [command options] [arguments...]
    
    VERSION:
    0.0.1
    
    COMMANDS:
        getblkheader  get header block's information
        getblock      get block information
        gettable      get table information
        account       create or get account
        transfer      for user transferring bto
        transaction   get or push transactions
        contract      get or deploy contract
        p2p           for p2p connection
        delegate      for delegate operations
        wallet        For wallet operations
        genesis       for genesis node operations
        log           for log operations
        help, h       Shows a list of commands or help for one command
    
    GLOBAL OPTIONS:
    --servaddr value    (default: "127.0.0.1:8689")
    --walletport value  
    --help, -h          show help
    --version, -v       print the version

命令功能说明

| chief command | parameter list    | Parameter Description                                  |
| -------- | :---------: | :----------------------------------------------------------------: |
| ./bcli   | getinfo     | Get block header information                                      |
| ./bcli   | getblock    | Get latest block information                                      |
| ./bcli   | gettable    | Get contract table information                                    |
| ./bcli   | account     | Create/Get account's information, stake/unstake/claim BTO, etc.   |
| ./bcli   | transfer    | Transfer BTO                                                     |
| ./bcli   | transaction | Inquiry/Send transaction                                         |
| ./bcli   | contract    | Inquiry/Deploy contract and abi                                  |
| ./bcli   | p2p         | P2P commands                                                     |
| ./bcli   | delegate    | Register/Unregister producers，producer vote/cancel vote, etc.   |
| ./bcli   | wallet      | Create wallet/lock/unlock/inquiry wallet, etc.                   |
| ./bcli   | genesis     | Genesis node operations，set initial producers，transfer producing blocks rights，cancel the node's operation priviledges |
| ./bcli   | log         | log settings，eg. Open Debug log levels                    |


命令功能说明

| Command | Parameter list    | Parameter description                                                          |
| -------- | :---------: | :----------------------------------------------------------------: |
| ./bcli   | getblkheader     | Get block header information                                                      |
| ./bcli   | getblock    | Get specific block                                                  |
| ./bcli   | gettable    | Get table information of a contract                                                     |
| ./bcli   | account     | Create / get user's information, stake/unstake/claim balances, etc,.                          |
| ./bcli   | transfer    | BTO transferring                                                        |
| ./bcli   | transaction | Get / call a transaction                                                 |
| ./bcli   | contract    | Query/deploy contract and ABI                                                    |
| ./bcli   | p2p         | P2P commands are not supported                                                  |
| ./bcli   | delegate    | Register/cancel a delegate，vote for delegate/cancel vote for a delegate, etc.                          |
| ./bcli   | wallet      | Create /lock/unlock/query a wallet                                          |
| ./bcli   | genesis     | Operations relates to the genesis node, setting the original producers，transferring the authority of producing blocks，cancel the operation authority of node, etc,. |


#### 3.4.3.1. BCLI user account function commands

The BCLI user account function commands are chiefly be responsible for creating new accounts, gettting specific user information, staking or unstaking BTO, and claiming staking BTO, etc,.

Chief command help information

    ./bcli account --help
    
    NAME:
    Bottos bcli tool account - create or get account
    
    USAGE:
    Bottos bcli tool account command [command options] [arguments...]
    
    COMMANDS:
        create   create account
        get      get account information
        stake    stake of account
        unstake  unstake of account
        claim    claim of stake
    
    OPTIONS:
    --help, -h  show help

Function Description of command line

| chief command  | parameter list | parameter description     |
| -------------- | :------------: | :-----------------------: |
| ./bcli account | create         | create new account        |
| ./bcli account | get            | get account's information |
| ./bcli account | stake          | stake BTO                 |
| ./bcli account | unstake        | unstake BTO               |
| ./bcli account | claim          | claim parts of user's BTO |

##### Create a User Command Description

Help information

    ./bcli account create --help
    
    NAME:
        Bottos bcli tool account create - create account
    
    USAGE:
        Bottos bcli tool account create [command options] [arguments...]
    
    OPTIONS:
    --account value   acocunt name
    --pubkey value    account public key
    --referrer value  account referrer


Parameter Description

|  chief command             | parameter list    | Parameter Description|  mandatory  |
| --------              | :-----:      | :----:  | :----:    |
| bcli account create   | --username  | The created user name  |  Yes       |
|                       | --pubkey    | The new public key of the new creared user|  Yes       |
|                       | --referrer  | The referrer user，default will use inside default account，otherwise use the referrer to do the signature | No       |


Return Information

This will output the succeeded Transaction information sent by BCLI, chiefly include user name, public key, sender and signature (--referrer information, default is the inside bottos account), etc,.

Sample

    ./bcli account create --account user12345678 --pubkey 0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f

Outputs

    TrxHash: 7bdc7aca33233d1ed2407f2d217aa9580f30d2aaf68f60270dd24c934a0a1d29
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>
    
    Please create wallet for your new account.

##### Sample of getting user information

Help information

    ./bcli account get --help
    NAME:
        Bottos bcli tool account get - get account information
    
    USAGE:
        Bottos bcli tool account get [command options] [arguments...]
    
    OPTIONS:
        --account value  acocunt name

Parameter Description

|  chief command             | parameter list    | Parameter Description|  mandatory  |
| --------              | :-----:      | :----:  | :----:    |
| bcli account get      | --username  | user name  |  Yes       |

Return Information

This will return the BTO information of the account.

Sample

    ./bcli account get --account bottos

Outputs

    Account: bottos
    Balance: 935499000.00000000 BTO
    Pubkey: 0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f

    StakedBalance: 0.00000000 BTO
    UnStakingBalance: 0.00000000 BTO
    StakedSpaceBalance: 0.00000000 BTO
    StakedTimeBalance: 0.00000000 BTO
    UnStakingTimestamp: 0

    Resource: {
        "free_available_space": 0,
        "free_used_space": 0,
        "stake_available_space": 0,
        "stake_used_space": 0,
        "free_available_time": 0,
        "free_used_time": 0,
        "stake_available_time": 0,
        "stake_used_time": 0
     }

    UnClaimedBlockReward: 0.00000000 BTO
    UnClaimedVoteReward: 0.00000000 BTO
    UnClaimedTotalReward: 0.00000000 BTO

    Vote: N/A

    Contracts: N/A

##### Sample of user staking BTO

Help information

    ./bcli account stake --help
    
    NAME:
    Bottos bcli tool account stake - stake of account
    
    USAGE:
    Bottos bcli tool account stake [command options] [arguments...]
    
    OPTIONS:
        --account value  acocunt name
        --amount value   amount of bto
        --target value   target of stake:vote,space,time (default: "vote")

Parameter Description

|  chief command             | parameter list    | Parameter Description|  mandatory  |
| --------              | :-----:     | :----:  | :----:    |
| bcli account stake    | --account  | user name  |  Yes        |
|                       | --amount   | amount of staking BTO  |  Yes        |
|                       | --target   | Type：stake:vote,space,time (default: "vote")  stake parameters choices  |  No        |

Return Information

This will return the transaction information after the command successfully sent.

Sample

    ./bcli account stake --account user12345678 --amount 2

Output result

    TrxHash: 2921e27bad80060580d508d2726a830b8a3970b70b56f28e93ae866846cd7296
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

##### Sample of user unstaking BTO

Help information

    ./bcli account unstake --help
    
    NAME:
    Bottos bcli tool account unstake - unstake of account
    
    USAGE:
        Bottos bcli tool account unstake [command options] [arguments...]
    
    OPTIONS:
        --account value  acocunt name
        --amount value   amount of bto
        --source value   source of unStake:vote,space,time (default: "vote")



Parameter Description

|  chief command             | parameter list    | Parameter Description|  mandatory  |
| --------              | :-----:     | :----:  | :----:    |
| bcli account unstake  | --account  | user name  |  Yes        |
|                       | --amount   | amount of unstaking BTO  |  Yes        |
|                       | --source   | Type：stake:vote,space,time (default: "vote")  stake parameters choices  |  No        |


Return Information

This will return the transaction information after the command successfully sent.

Sample

    ./bcli account unstake --account user12345678 --amount 2

Output

    TrxHash: c1e99e03957c8222479513bef9916368754a4549312ef4481bdc687729d7698c
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

##### Sample of user claiming BTO

Help information

    ./bcli account claim --help
    
    NAME:
        Bottos bcli tool account claim - claim of stake
    
    USAGE:
        Bottos bcli tool account claim [command options] [arguments...]
    
    OPTIONS:
        --account value  acocunt name
        --amount value   amount of bto


Parameter Description

|  chief command             | parameter list    | Parameter Description|  mandatory  |
| --------              | :-----:     | :----:  | :----:    |
| bcli account claim    | --account  | user name  |  Yes        |
|                       | --amount   | Amount of claiming staked BTO  |  Yes        |

Return Information

This will return the transaction information after the command successfully sent.

Sample

    ./bcli account claim --account user12345678 --amount 2

Output

    TrxHash: b39e46a180c4d9d465efd77a42e08f9590726d761c70b7ae34c64e3359ab6ce4
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>


#### 3.4.3.2. BCLI contract function command

BCLI contract function command chiefly releaizes the deployment of the contract file and its ABI file onto block chain, also the function of querying the contract code (or file) and ABI information(or file) from block chain. 

Chief Help information

    ./bcli contract --help
    
    NAME:
        Bottos bcli tool contract - get or deploy contract
    
    USAGE:
        Bottos bcli tool contract command [command options] [arguments...]
    
    COMMANDS:
        deploy      contract deploy
        get         get contract
    
    OPTIONS:
        --help, -h  show help



Commandline Function Description

| chief command   | parameter list |                  Parameter Description                  |
| --------------- | :------------: | :-----------------------------------------------------: |
| ./bcli contract |     deploy     |          Deploy the ABI file and WASM contract          |
| ./bcli contract |      get       | Get specific contract and abi info , then save to files |

##### BCLI Contract Deployment Command

Help information

    ./bcli contract deploy --help
    NAME:
       Bottos bcli tool contract deploy - contract deploy
    
    USAGE:
       Bottos bcli tool contract deploy [command options] [arguments...]
    
    OPTIONS:
       --contract value  the contract's name
       --code value      the contract's wasm file path ( includes wasm file name )
       --filetype value  the contract's file type: wasm or js (default: "wasm")
       --abi value       the contract's abi file path ( includes abi file name )
       --account value   the account name whom deploy the code






Parameter Description

| chief command            | parameter list | Parameter Description         | mandatory |
| ------------------------ | :------------: | :---------------------------: | :-------: |
| bcli contract deploy     | --contract     | contract name                     | Yes       |
|                          | --code         | Contract file（.WASM）'s path     | Yes       |
|                          | --filetype     | contract file's type: wasm / js   | No        |
|                          | --abi          | Contract file（.abi）'s path      | Yes       |
|                          | --account      | the account who deploy the contract | Yes     |


Return Information

This will return the transaction information after the command successfully be  sent.

Sample

    ./bcli contract deploy --contract testvm1 --code testvm1/testVM1.wasm --abi testvm1/testVM1.abi --account tina123456789

Output
​  
​    TrxHash: 596441807df736fc15ae32a59a38bc9324620ca2945a0633c033e7d0370e3638

    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

Note： 
​    BOTTOS ABI file describes the Apis and structs needed by contract, for instances, in this case, the nodeclustermng.abi file's information is shown as following.
​    
​     "structs" represents for the definition of structs which be used in this contract
​    

    "actions" represents for all the contract methods nane and the corresponding struct names which will be used in this contract
    
    "tables" represents that the contract information will be written to the block chain after the contract is called(take the effect).  It represents for the inputting parameters from querying the block chain, which includes the keywords and the corresponding structs' information.
    
    Sample
    
    {
        "types": [],
        "structs": [
                {
                    "name": "NodeClusterReg",
                    "base": "",
                    "fields": {
                        "nodeIP": "string",
                        "clusterIP": "string",
                        "uuid": "string",
                        "capacity": "string"
                        }
                    },
                {
                    "name": "NodeClusterInfo",
                    "base": "",
                    "fields": {
                        "clusterIP": "string",
                        "uuid": "string",
                        "capacity": "string"
                        }
                    }
        ],
        "actions": [
                {
                    "action_name": "reg",
                    "type": "NodeClusterReg"
                }
        ],
        "tables": [
                {
                    "table_name": "nodeclusterinfo",
                    "index_type": "string",
                    "key_names":  [
                        "nodeIP"
                    ],
                    "key_types":  [
                        "string"
                    ],
                    "type": "NodeClusterInfo"
                }
        ]
    }


##### ##### BCLI Getting CODE file and ABI File

Help information

    ./bcli contract get --help
    NAME:
        Bottos bcli tool contract get - get contract
    
    USAGE:
        Bottos bcli tool contract get [command options] [arguments...]
    
    OPTIONS:
        --contract value  the contract's name
        --code value      the contract's wasm file path ( includes wasm file name )
        --abi value       the contract's abi file path ( includes abi file name )


Parameter Description

| chief command        | parameter list | Parameter Description                 | mandatory |
| -------------------- | :------------: | :-----------------------------------: | :-------: |
| bcli contract deploy | --account      | contract name                         | Yes       |
|                      | --code         | The path that save the contract       | Yes       |
|                      | --abi          | The path that save the abi(.abi) file | Yes       |
|                   | --contract | the contract owned by one account，and should be format of <contractname>@<account name> | Yes       |


Return Information

The output gives the contract raw data and abi file information, and save the contract and abi file to corresponding path.

Sample

    ./bcli contract get --account user12345678 --code ~/test.wasm --abi ~/test.abi --contract test1@user12345678

Output

============CONTRACTCODE===============

"0061736d01000000013d0960027f7f0060067f7f7f7f7f7f017f60027f7f017f60087f7f7f7f7f7f7f7f017f60037f7f7f017f6000006000017f60017f017f60047f7f7f7f017f025f0603656e760b67657442696e56616c7565000303656e760a6765744374784e616d65000203656e7608676574506172616d000203656e76066d656d736574000403656e76067072696e7473000003656e760b73657442696e56616c75650001030a090502060704020607080404017000000503010001074505066d656d6f727902000869734d6574686f640007077265677573657200080873617968656c6c6f000c185f474c4f42414c5f5f7375625f495f74636173652e63707000060afb2409f202004100420037028c4041004200370294404100420037029c40410042003702a440410042003702ac40410041003602b440410041003602b840410041003602bc40410041003602c040410041003602c440410041003602c840410041003602cc40410041003602d040410041003602d440410041003602d840410041003602dc40410041003602e040410041003602e440410041003602e840410041003602ec40410041003602f040410041003602f440410041003602f840410041003602fc404100410036028041410041003602844141004100360288414100410036028c414100410036029041410041003602944141004100360298414100410036029c41410041003602a041410041003602a441410041003602a841410041003602ac41410041003602b041410041003602b441410041003602b841410041003602bc41410041003602c041410041003602c441410041003602c841410041003602cc41410041003602d041410041003602d4410b5b01027f0240024020012d0000220320002d0000470d00200141016a2101200041016a21000340200341ff0171450d0220002d0000210220012d00002103200141016a2101200041016a210020032002460d000b0b41000f0b41010be00101047f4100410028020441f0006b220336020441002102200341c0006a4100413010031a200341386a4200370300200341206a41106a4200370300200341286a420037030020034200370320200341106a4100280290453602002003410029038845370308200341002903804537030002400240200341c0006a1009450d00200341d4006a21000340200341206a20026a200020026a2d000022013a0000200241016a210220010d000b2003200329036837033841004103200341206a2003200341c0006a100a1b21020c010b410221020b4100200341f0006a36020420020bf90401057f4100410028020441a0106b220536020441002104200541106a410041801010031a200541106a41801010022102200541003a0000200520023602082005410036020c2005200541106a3602040240200520054190106a100b450d0002400240024020052d0090104106470d00410021042005280298104103470d03200520054190106a100b450d0320052d0090104105470d01200528029810220141016a4116490d02200541013a00000c030b200541063a00000c020b200541063a00000c010b0240024020052802042203450d002005410c6a280200220220016a200541086a2802004d0d010b200541043a00000c010b02402001450d00200320026a210420002102200121030340200220042d00003a0000200241016a2102200441016a21042003417f6a22030d000b2005410c6a28020021020b41002104200020016a41003a00002005410c6a200220016a360200200520054190106a100b450d000240024020052d0090104105470d00200528029810220141016a4116490d01200541013a0000410021040c020b200541063a00000c010b0240024020052802042203450d002005410c6a280200220220016a200541086a2802004d0d010b200541043a0000410021040c010b02402001450d00200041146a2104200320026a2102200121030340200420022d00003a0000200441016a2104200241016a21022003417f6a22030d000b2005410c6a28020021020b2005410c6a200220016a36020041002104200020016a41146a41003a0000200520054190106a100b450d00024020052d0090104104470d00200041286a200529039810370300410121040c010b200541063a00000b4100200541a0106a36020420040baf0603037f017e047f410041002802044190106b220a36020441002104200a41106a410041801010031a200a41023a0012200a41dc013b0110024020002d00002203450d00200041016a2105410021090340200520096a2107200941016a2204210920072d00000d000b0b200a41da013a0013200a20043a0015200a2004410874418080fc07714110763a0014024002400240024002400240200441ffff03712205450d00200541066a22084180104b0d02200a20033a0016024020054101460d00410120056b2104200041016a2109200a41106a41077221070340200720092d00003a0000200741016a2107200941016a2109200441016a22040d000b0b200541076a4180104d0d010c020b410621080b200a41106a20086a220941cf013a0000200841096a2208418110490d010b41002109200a41086a41002800a845360200200a41002900a045370200200a41017221040340200420096a2107200941016a2205210920072d00000d000b200a200510040c010b200941026a20002903182206423886200642288642808080808080c0ff0083842006421886428080808080e03f8320064208864280808080f01f838484200642088842808080f80f832006421888428080fc07838420064228884280fe0383200642388884848422064208883c0000200941016a20063c0000200941036a20064210883c0000200941046a20064218883c0000200941056a20064220883c0000200941066a20064228883c0000200941076a20064230883c0000200941086a20064238883c00004100210441002105024020012d0000450d00200141016a2100410021090340200020096a2107200941016a2205210920072d00000d000b0b024020022d0000450d00200241016a2100410021090340200020096a2107200941016a2204210920072d00000d000b0b410121092001200520022004200a41106a200810050d0141002109200a410e6a41002d00be453a0000200a410c6a41002f00bc453b0100200a41086a41002800b845360200200a41002900b045370200200a41017221040340200420096a2107200941016a2205210920072d00000d000b200a200510040b410021090b4100200a4190106a36020420090bf20902047f017e0240024020002802042202450d00200028020c220341016a220420002802084d0d010b200041023a000041000f0b200220036a2d000021022000410c6a200436020002400240024002400240024002400240024002400240024002400240200241bb7e6a220241174b0d00024020020e18000101010101010203040501010101010101010101060107000b200141003a00000240200041046a2802002202450d002000410c6a2203280200220441026a2205200041086a2802004d0d080b200041073a000041000f0b200041063a000041000f0b200141013a00000240200041046a2802002202450d002000410c6a2203280200220441016a200041086a2802004d0d070b200041043a000041000f0b200141023a00000240200041046a2802002202450d002000410c6a2203280200220441026a200041086a2802004d0d070b200041043a000041000f0b200141033a00000240200041046a2802002202450d002000410c6a2203280200220441046a200041086a2802004d0d070b200041043a000041000f0b200141043a00000240200041046a2802002202450d002000410c6a2203280200220441086a200041086a2802004d0d070b200041043a000041000f0b200141053a00000240200041046a2802002202450d002000410c6a2203280200220441026a2205200041086a2802004d0d070b200041043a000041000f0b200141063a00000240200041046a2802002202450d002000410c6a2203280200220441026a2205200041086a2802004d0d070b200041043a000041000f0b200220046a22002d0000210220002d0001210020032005360200200141086a200220004108747222004118742000410874418080fc07717241107636020041010f0b200141086a200220046a2d00003a00002003200328020041016a36020041010f0b200141086a2200200220046a22022d00003a0000200141096a20022d00013a00002003200328020041026a360200200020002f010022014118742001410874418080fc0771724110763b010041010f0b200141086a2205200220046a22002d00003a0000200141096a20002d00013a00002001410a6a200041026a2d00003a00002001410b6a200041036a2d00003a00002003200328020041046a3602002005200528020022004118742000410874418080fc07717220004108764180fe03712000411876727236020041010f0b200141086a2205200220046a22002d00003a0000200141096a20002d00013a00002001410a6a200041026a2d00003a00002001410b6a200041036a2d00003a00002001410c6a200041046a2d00003a00002001410d6a200041056a2d00003a00002001410e6a200041066a2d00003a00002001410f6a200041076a2d00003a00002003200328020041086a360200200520052903002206423886200642288642808080808080c0ff0083842006421886428080808080e03f8320064208864280808080f01f838484200642088842808080f80f832006421888428080fc07838420064228884280fe0383200642388884848437030041010f0b200220046a22002d0000210220002d0001210020032005360200200141086a200220004108747222004118742000410874418080fc07717241107636020041010f0b200220046a22002d0000210220002d0001210020032005360200200141086a200220004108747222004118742000410874418080fc07717241107636020041010bdc0201057f4100410028020441f0006b220436020441002103200441e0006a41003602002004420037035820044200370350200441d0006a411410011a024002400240024020042d0050450d00200441d0006a41017221000340200020036a2102200341016a2201210320022d00000d000b2001450d00200441386a41106a4100360200200441386a41086a420037030020044200370338200441306a4200370300200441186a41106a4200370300200441186a41086a420037030020044200370318200441106a41002802904536020020044100290388453703082004410029038045370300200441386a100d450d01200441d0006a2004200441386a200441186a100e450d022004200429033042017c37033041004103200441186a2004200441386a100a1b21030c030b41c0c50041231004410521030c020b410221030c010b41f0c500410f1004410621030b4100200441f0006a36020420030be40201057f4100410028020441a0106b220536020441002104200541106a410041801010031a200541106a41801010022102200541003a0000200520023602082005410036020c2005200541106a3602040240200520054190106a100b450d0002400240024020052d0090104106470d00410021042005280298104101470d03200520054190106a100b450d0320052d0090104105470d01200528029810220141016a4116490d02200541013a00000c030b200541063a00000c020b200541063a00000c010b0240024020052802042203450d002005410c6a280200220220016a200541086a2802004d0d010b200541043a00000c010b02402001450d00200320026a210420002102200121030340200220042d00003a0000200241016a2102200441016a21042003417f6a22030d000b2005410c6a28020021020b200020016a41003a00002005410c6a200220016a360200410121040b4100200541a0106a36020420040be20401077f4100410028020441a0106b220736020441002109200741004180101003210441002108024020002d0000450d00200041016a210a410021070340200a20076a2106200741016a2208210720062d00000d000b0b024020012d0000450d00200141016a210a410021070340200a20076a2106200741016a2209210720062d00000d000b0b4100210a024020022d0000450d00200241016a2105410021070340200520076a2106200741016a220a210720062d00000d000b0b20002008200120092002200a200441801010002106200441003a0080102004418010360288102004410036028c1020042004360284100240024020044180106a20044190106a100b450d0002400240024020042d0090104106470d002004280298104102470d0320044180106a20044190106a100b450d0320042d0090104105470d01200428029810220a41016a4116490d02200441013a0080100c030b200441063a0080100c020b200441063a0080100c010b024002402004280284102207450d002004418c106a2802002209200a6a20044188106a2802004d0d010b200441043a0080100c010b0240200a450d00200720096a210720032109200a21080340200920072d00003a0000200941016a2109200741016a21072008417f6a22080d000b2004418c106a28020021090b410021072003200a6a41003a00002004418c106a2009200a6a36020020044180106a20044190106a100b450d01024020042d0090104104470d00200341186a2004290398103703004101210720060d024180c600411310040c010b200441063a0080100c010b410021070b4100200441a0106a36020420070b0bab01070041040b0420630000004180c5000b147573657264657461696c000000000000000000000041a0c5000b0c7061636b206661696c6564000041b0c5000b0f73617665206462206661696c6564000041c0c5000b244552524f523a20476574206d7920636f6e7472616374206e616d65206661696c65642e000041f0c5000b1067657444617461206661696c65642100004180c6000b1467657442696e56616c7565206661696c65642100"

============ABI===============

{
​	"types": [],
​	"structs": [
​              {
​              	"name": "UserInfo",
​              	"base": "",
​              	"fields": {
​              		"userName": "string",
​              		"userRole": "string",
​              		"rcvHelloNum": "uint64"
​                    }
​              	},
​              {
​              	"name": "SayHello",
​              	"base": "",
​              	"fields": {
​              		"userName": "string"
​                    }
​              	},
​              {
​              	"name": "UserDetail",
​              	"base": "",
​              	"fields": {
​              		"userRole": "string",
​              		"rcvHelloNum": "uint64"
​                    }
​              	}
​       ],
​	"actions": [
​              {
​              	"action_name": "reguser",
​              	"type": "UserInfo"
​              },
​              {
​              	"action_name": "sayhello",
​              	"type": "SayHello"
​              }
​       ],
​	"tables": [
​              {
​              	"table_name": "userinfo",
​              	"index_type": "string",
​              	"key_names":  [
​              		"userName"
​              	 ],
​              	"key_types":  [
​              		"string"
​              	 ],
​              	"type": "UserDetail"
​              }
​       ]
}


##### ##### BCLI get Contract TABLE Information

Help information

    ./bcli gettable --help
    NAME:
    bcli gettable - get table info
    
    USAGE:
        bcli gettable [command options] [arguments...]
    
    OPTIONS:
        --contract value  contract name
        --table value     table name
        --key value       Key value


Parameter Description

| chief command | parameter list | Parameter Description                                                                                 | mandatory |
| ------------- | :------------: | :---------------------------------------------------------------------------------------------------: | :-------: |
| bcli gettable | --contract      | the contract owned by one account，and should be format of <contractname>@<account name>                                                                                         | Yes       |
|               | --table        | Table name that is required to query block chain（refer to the description of 'table of abi file'）    | Yes       |
|               | --key          | Keyword name that is required to query block chain（refer to the description of 'table of abi file'）  | Yes       |

Return Information

This will return the Transaction information sent by BCLI.

Sample

./bcli gettable --table userdetail --contract lyp12345678 --key lyp

Output

{
​    "contract": "lyp12345678",
​    "object": "userdetail",
​    "key": "lyp",
​    "value": "dc0003da00036c7970cf0000000000000016c5001000000000000000000000000000000021"
}

Table data is : map[lyp:33 userrole:lyp rcvhellonum:22] 


#### 3.4.3.3. BCLI Candidate Node Voting Command

Bcli candidate node voting chiefly realize the functions of: register the node as the producer, cancel the producer node, let part/all the producer nodes' information, vote(vote one node as the producer), cancel vote, claim reward etc,.

Help information

    ./bcli delegate --help
    NAME:
        Bottos bcli tool delegate - for delegate operations

    USAGE:
        Bottos bcli tool delegate command [command options] [arguments...]

    COMMANDS:
        register     register delegate
        cancel       cancel delegate
        list         list delegates
        vote         Vote for delegate
        cancelvote   cancel vote for producers
        claimreward  claim reward for producers

    OPTIONS:
        --help, -h  show help

Commandline Function Description

| chief command   | parameter list | Parameter Description    |
| --------------- | :------------: | :----------------------: |
| ./bcli delegate | register       | register as the producer |
| ./bcli delegate | cancel         | cancel the producer  |
| ./bcli delegate | list           | watch the producer list  |
| ./bcli delegate | vote           | vote for the producer    |
| ./bcli delegate | cancelvote     | cancel vote              |
| ./bcli delegate | claimreward    | producer claim block reward|

##### BCLI Registing as Producer Command

Help information

    ./bcli delegate register --help
    NAME:
        Bottos bcli tool delegate register - register delegate

    USAGE:
        Bottos bcli tool delegate register [command options] [arguments...]

    OPTIONS:
        --account value      account name
        --signkey value      public sign key
        --location value     location
        --description value  description

Parameter Description

| chief command     | parameter list | Parameter Description                                              | mandatory |
| -----------------| :------------: | :----------------------------------------------------------------: | :-------: |
| bcli delegate register | --account      | user name                                                          | Yes       |
|                   | --signkey      | Public key defined by user（Default is the inside default value）  | Yes       |
|                   | --location     | The city name of voter                                             | No        |
|                   | --description  | The description defined by user                                    | No        |

Return Information

This will return the Transaction information sent by BCLI.

Sample

    ./bcli delegate register --account user12345678 --location "SHANGHAI" --description "Reg user12345678 as a producer"

Output

    TrxHash: 53e25c2b281251e44bf24e2f552b101daf60399b7a44adcc9810fd10908ff23e
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

Note：
The precondition before this command be used is: the genesis node must transfer the generating block authority in secceed. 

Please refer to the command ./bcli genesis blkprodtrans --sender user12345678 --actblknum 10

##### ##### BCLI Unregisting Producer Command

Help information

    ./bcli  delegate cancel  --help
    
    NAME:
        Bottos bcli tool delegate cancel - cancel delegate
    
    USAGE:
        Bottos bcli tool delegate cancel [command options] [arguments...]
    
    OPTIONS:
        --account value  account


Parameter Description

| chief command       | parameter list | Parameter Description | mandatory |
| ------------------- | :------------: | :-------------------: | :-------: |
| bcli delegate cancel | --account      | user name             | Yes       |


Return Information

This will return the Transaction information sent by BCLI.

Sample

    ./bcli delegate cancel --account user12345678

Output

    TrxHash: 3ff592e51ff483d7a6409aab2f54b52d7bd721ce009b73ac59544443074d8802
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

##### ##### BCLI Listing Current Producer Nodes Command

Help information

    ./bcli delegate list --help
    NAME:
    Bottos bcli tool delegate list - list delegates
    
    USAGE:
        Bottos bcli tool delegate list [command options] [arguments...]
    
    OPTIONS:
        --limit value  (default: 100)
        --start value  (default: 0)


Parameter Description

| chief command      | parameter list | Parameter Description                                | mandatory |
| ------------------ | :------------: | :--------------------------------------------------: | :-------: |
| bcli delegate list | --limit        | Output the head N records                            | No        |
|                    | --limit        | Output from head N record and stop within the limits | No        |


Return Information

This will return the Transaction information sent by BCLI.

Sample

    ./bcli delegate list

Output

    [
        {
            "account_name": "delegatecreate2",
            "active": true,
            "description": "",
            "location": "",
            "public_key": "04cc788ad88378837658b150f33440bf531aea0acc13a6921814b1e01927fd812ddb5ade669c784f34af3350b9188c8b63bb114b5afde4f64bbbab0ccd1f925458",
            "transit_votes": "50000000000",
            "votes": "50000000000"
        },
        {
            "account_name": "delegatecreate3",
            "active": true,
            "description": "",
            "location": "",
            "public_key": "0458e35c99eb4cb431653b0682bd51ebfcff1869a41f8eadb915b67e82d72f71f7dd5154108954dc818140f8991e186b55d774fd7b156914b4baa1d352d2d7765b",
            "transit_votes": "50000000000",
            "votes": "50000000000"
        },
        {
            "account_name": "delegatecreate4",
            "active": true,
            "description": "",
            "location": "",
            "public_key": "043e3f77eb8154dbeaf28379abdf88dba44b2528268ab63f5b726a3ffd4619c7f7003dc761a47e09ef6edb9a615684caa3f859fbe39e6f15fb5305e24419d941b7",
            "transit_votes": "50000000000",
            "votes": "50000000000"
        },
        .....
        ....
        .... (略)
    ]


##### BCLI Producer Voting Command

Help information

    ./bcli delegate vote --help
    NAME:
    Bottos bcli tool delegate vote - Vote for producers
    
    USAGE:
        Bottos bcli tool delegate vote [command options] [arguments...]
    
    OPTIONS:
        --voter value     voter account
        --delegate value  delegate account


Parameter Description

| chief command      | parameter list | Parameter Description                                   | mandatory |
| ------------------ | :------------: | :-----------------------------------------------------: | :-------: |
| bcli delegate vote | --voter        | the voter                                               | Yes       |
|                    | --delegate     | vote to which producer node（must vote to the nodes 
​                                        which has been already registerd as the producer node） | Yes       |

Return Information

This will return the Transaction information sent by BCLI.

Sample

    ./bcli delegate vote --voter bottos --delegate user12345678

Output

    TrxHash: bb6dde5aba1db736495e864a4fa085640cbeb7d88aef11958f764a1423ba3f90
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

##### BCLI Producer Cancel Voting Command

Help information

    ./bcli delegate cancelvote --help
    NAME:
    Bottos bcli tool delegate cancelvote - cancel vote for producers
    
    USAGE:
        Bottos bcli tool delegate cancelvote [command options] [arguments...]
    
    OPTIONS:
        --voter value     voter account
        --delegate value  delegate account


Parameter Description

| chief command            | parameter list | Parameter Description                         | mandatory |
| ------------------------ | :------------: | :-------------------------------------------: | :-------: |
| bcli delegate cancelvote | --voter        | Thevoter                                      | Yes       |
|                          | --delegate     | cancel vote to which producer node（must vote 
​                                              to the nodes which has been already registerd 
​                                              as the producer node）                         | Yes       |

Return Information

This will return the Transaction information sent by BCLI.

Sample

    ./bcli delegate cancelvote --voter bottos --delegate user12345678

Output

    TrxHash: 86a503abd101f3473d5e121fa3e7665ff0f274fc5739ea649bf070177ffb2091
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

##### BCLI Producer claim block reward

Help information
    ./bcli delegate claimreward -h
    NAME:
        Bottos bcli tool delegate claimreward - claim reward for producers

    USAGE:
        Bottos bcli tool delegate claimreward [command options] [arguments...]

    OPTIONS:
        --account value  account name

Parameter Description

| chief command  | parameter list| Parameter Description | mandatory|
| -------------- | :------: | :------: | :------: |
| ./bcli delegate claimreward| --account| producer account name| YES |

Return Information

This will return the Transaction information sent by BCLI.

Sample

    ./bcli delegate claimreward --account delegatecreate2

Output

    TrxHash: de8dcdbcd92c88250801a96a4db9260455c16c595abb7328b5e0a638695a0bdb

    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

#### 3.4.3.4. BCLI Block Information Getting Command

The BCLI block information chiefly includes: Getting current block information, block head information.

##### ##### BCLI Getting Block Header Information command

Help information

    ./bcli getblkheader --help
    NAME:
        bcli getblkheader - get header block's information

    USAGE:
        bcli getblkheader [arguments...]


Parameter Description

| chief command         | parameter list | Parameter Description | mandatory |
| --------------        | :------------: | :-------------------: | :-------: |
| ./bcli getblkheader   | (Null)         | (Null)                | (Null)    |
|                       | (Null)         | (Null)                | (Null)    |


Return Information

The output gives the latest block header of realtime.

Sample

    ./bcli getblkheader

Output

    ==Chain Info==

    {
        "head_block_num": 1077,
        "head_block_hash": "f6173c548f2d2bc25d86232cb2d451c7b8d6ba3763477a212a33af4237eae6e7",
        "head_block_time": 1548323109,
        "head_block_delegate": "bottos",
        "cursor_label": 938141415,
        "last_consensus_block_num": 1077,
        "chain_id": "4b97b92d2c78bcffe95ebd3067565c73a2931b39d5eb7234b11816dcec54761a",
        "head_block_version": 65536
    }

##### BCLI Getting Latest block Information Command

Help information

    ./bcli getblock --help
    NAME:
        bcli getblock - get block information

    USAGE:
        bcli getblock [command options] [arguments...]

    OPTIONS:
        --num value    get latest block by number: if this section is not set, then get the latest block, otherwise get the specific block of the number (default: 0)
        --hash value   get specific block by hash
        --start value  get specific block from start num(do not use with --num or --hash) (default: 0)
        --end value    get specific block to end num (do not use with --num or --hash) (default: 0)

Parameter Description

| chief command   | parameter list | Parameter Description | mandatory |
| --------------- | :------------: | :-------------------: | :-------: |
| ./bcli getblock | --num     | get the specific block according to block number     | No    |
|                 | --hash     | get the specific block according to block hash      | No    |
|                 | --start     | Get several blocks according to block number duration from "start" number. The most blocks to be quired are 10 blocks.    | No    |
|                 | --end     | Get several blocks according to block number duration until "end" number. The most blocks to be quired are 10 blocks.    | No    |


Return Information

    The output gives the latest block information of realtime. If no options are given(according to above options), the latest block information will be given then.

Sample

    ./bcli getblock
    
    Output
    
    ==Block Info==

    {
        "block_version": 65536,
        "prev_block_hash": "dcf00f755695521d5342c4f9d5889490d2da754076a941a824ef4a1c2019bd94",
        "block_num": 1136,
        "block_hash": "e2d1dd86e473eb46ecf20522049f2ade4c3f89875b888c19d617d284ddf3f1a5",
        "cursor_block_label": 3723751845,
        "block_time": 1548323286,
        "trx_merkle_root": "0000000000000000000000000000000000000000000000000000000000000000",
        "delegate": "bottos",
        "delegate_sign": "fa6f1c0666db6bbb82c75f5bb45f7e6e892804a270304c2d9d653a17da4ef5477f5bc50896ae7f7d5dcf743f1a0726d177209288acdb61d2b3a519a8b13c6464",
        "trxs": null
    }


#### 3.4.3.5. BCLI Genesis Node Functions Command

The BCLI genesis node chiefly includes: Add original producers，transfer generating block autority, cancel the operation authority of genesis node.

Help information

    ./bcli genesis --help
    
    NAME:
        Bottos bcli tool genesis - for genesis node operations
    
    USAGE:
        Bottos bcli tool genesis command [command options] [arguments...]
    
    COMMANDS:
        setdelegate      set delegate
        unsetdelegate    unset delegate
        blkprodtrans     for genesis node transfering the permission of producing blocks
        cancelprevilige  cancel genesis node permission
        settransitvote   set transit vote
        newstkaccount    transfer erc20
    
    OPTIONS:
        --help, -h  show help

Commandline Function Description

| chief command  | parameter list  |                    Parameter Description                     |
| -------------- | :-------------: | :----------------------------------------------------------: |
| ./bcli genesis |   setdelegate   |     The original procuders be designated in genesis node     |
| ./bcli genesis |  blkprodtrans   |         transfer the authority of generating blocks          |
| ./bcli genesis | cancelprevilige |        cancel the operation authority of genesis node        |
| ./bcli genesis |  unsetdelegate  |          genesis node cancel vote for one producer           |
| ./bcli genesis | settransitvote  |     genesis node vote for producer in transition period      |
| ./bcli genesis |  newstkaccount  | New genesis account and transfer amount of BTO in transition period |

##### BCLI Genesis Node Adding Original Producer Functions Command

Help information

    ./bcli genesis setdelegate --help
    NAME:
        Bottos bcli tool genesis setdelegate - set delegate

    USAGE:
        Bottos bcli tool genesis setdelegate [command options] [arguments...]

    OPTIONS:
        --sender value       sender account
        --account value      account name
        --signkey value      public sign key
        --location value     location
        --description value  description

Parameter Description

| chief command              | parameter list | Parameter Description                               | mandatory |
| -------------------------- | :------------: | :-------------------------------------------------: | :-------: |
| ./bcli genesis setdelegate | --sender       | The signer（user name must be regietered at first，  default value will be inside bottos account）        | No        |
|                            | --account      | The producer that will be added                      | Yes       |
|                            | --signkey      | user's public key                                    | No        |
|                            | --location     | The city designated by user                          | No        |
|                            | --description  | The description defined by user                      | No        |

Return Information

This will return the Transaction information sent by BCLI.

Sample

    ./bcli genesis setdelegate --sender bottos --account user12345678

Output

    TrxHash: e453df77a6f1a2049e79dd9853e8f16945968ffe8e3c168e5fe29788fb8dc898
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

##### BCLI Genesis Node Transfer the Authority Function Command

Help information

    ./bcli genesis blkprodtrans --help
    NAME:
    Bottos bcli tool genesis blkprodtrans - for genesis node transfering the permission of producing blocks
    
    USAGE:
        Bottos bcli tool genesis blkprodtrans [command options] [arguments...]
    
    OPTIONS:
        --sender value     sender account
        --actblknum value  the threshold number of active block for which genesis node transfering the permission of producing blocks after exceeding it (default: 0)


Parameter Description

| chief command               | parameter list | Parameter Description                                | mandatory |
| --------------------------- | :------------: | :--------------------------------------------------: | :-------: |
| ./bcli genesis blkprodtrans | --sender       | The signer（user name must be regietered at first，default value will be inside bottos account）        | No        |


Return Information

This will return the Transaction information sent by BCLI.

Sample

     ./bcli genesis blkprodtrans --sender bottos --actblknum 2000

Output
​    
    TrxHash: 29267535acadefb100113915652a4ba9d9b00dafbefbe61bc9f1f5fdd24249c0
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>


##### BCLI Cancel the Genesis Node Operation Authority Command

Help information

    ./bcli genesis cancelprevilige --help
    NAME:
    Bottos bcli tool genesis cancelprevilige - cancel genesis node permission
    
    USAGE:
        Bottos bcli tool genesis cancelprevilige [command options] [arguments...]
    
    OPTIONS:
        --sender value  sender account


Parameter Description

| chief command                  | parameter list | Parameter Description                                     | mandatory |
| ------------------------------ | :------------: | :-------------------------------------------------------: | :-------: |
| ./bcli genesis cancelprevilige | --sender       | The signer（the user name must be registered at first, the default value is the bottos account）                 | No        |

Return Information

This will return the Transaction information sent by BCLI.

Sample

      ./bcli genesis cancelprevilige --sender bottos

Output

    TrxHash: 42e93f4a6f3a631d469449e418a624ede196b2e4d096b29bd1ccaaca1e83ee10
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

##### BCLI Genesis Node Cancel Vote for one Producer

Help information

    ./bcli genesis unsetdelegate --h
    NAME:
        Bottos bcli tool genesis unsetdelegate - unset delegate
    
    USAGE:
        Bottos bcli tool genesis unsetdelegate [command options] [arguments...]
    
    OPTIONS:
        --sender value   sender account
        --account value  account name


Parameter Description

| chief command                     | parameter list  | Parameter Description                 | mandatory |
| ---------------------------- | :-------: | :----------------------: | :------: |
| ./bcli genesis unsetdelegate | --sender  | sender should be bottos     | Yes       |
| ./bcli genesis unsetdelegate | --account | The producer which has been voted before | Yes       |

Return Information

This will return the Transaction information sent by BCLI.

Sample

    ./bcli genesis unsetdelegate --sender bottos --account lyp12345678

Output

    TrxHash: 602ceed3970de1948a3a0d76ee8e5b82dc29a7ec741d576327938d883d06cc18
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

##### BCLI Genesis Node Vote for Producer in Transition Period

Help information

    ./bcli genesis settransitvote --h
    NAME:
        Bottos bcli tool genesis settransitvote - set transit vote
    
    USAGE:
        Bottos bcli tool genesis settransitvote [command options] [arguments...]
    
    OPTIONS:
        --sender value   sender account
        --account value  account name
        --vote value     election votes (default: 0)

Parameter Description

| chief command                      | parameter list  | Parameter Description             | mandatory |
| ----------------------------- | :-------: | :------------------: | :------: |
| ./bcli genesis settransitvote | --sender  | sender should be bottos | Yes       |
| ./bcli genesis settransitvote | --account | voute for the producer's name   | Yes       |
| ./bcli genesis settransitvote | --vote    | amount of votes             | Yes       |

Return Information

This will return the Transaction information sent by BCLI.

Sample

    ./bcli genesis settransitvote --sender bottos --account lyp12345678 --vote 100

Output

    TrxHash: 545d8ce9032756dd9305fd2ce14cce5c18aaa39f94eff1791fbc1fe41bf9e4a0
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

##### BCLI Genesis Node new account, transfer and stake amount of BTO

Help information

```
./bcli genesis newstkaccount -h
NAME:
   Bottos bcli tool genesis newstkaccount - transfer erc20

USAGE:
   Bottos bcli tool genesis newstkaccount [command options] [arguments...]

OPTIONS:
   --sender value       sender account
   --account value      account name
   --pubkey value       account public key
   --transfer value     the amount of bto
   --stake-space value  the amount of bto
   --stake-time value   the amount of bto
   --stake-vote value   the amount of bto
```

Parameter Description

| chief command                | parameter list| Parameter Description    | mandatory |
| ---------------------------- | ------------- | ------------------------------- | -------- |
| ./bcli genesis newstkaccount | --sender      | sender should be bottos       | YES    |
| ./bcli genesis newstkaccount | --account     | new account name              | YES      |
| ./bcli genesis newstkaccount | --pubkey      | public key of account         | YES     |
| ./bcli genesis newstkaccount | --transfer    | total amount of transfer BTO  | YES    |
| ./bcli genesis newstkaccount | --stake-space | the amount of stake space | YES    |
| ./bcli genesis newstkaccount | --stake-time  | the amount of stake time  | YES       |
| ./bcli genesis newstkaccount | --stake-vote  | the amount of stake vote  | YES      |

Return Information

This will return the Transaction information sent by BCLI.

Sample

    ./bcli genesis newstkaccount --account delegatecreate5  --transfer 490000 --stake-space 100000 --stake-time 100000 --stake-vote 100000 --sender bottos --pubkey 04ecec203a98be1d27d38d189a8f16f65a24e6ba813e139fdd82bf84c44bef36ffe5813f5cd9a8ab34b4a0c8f490beda68d81b22897f436a24a1ca1cec7c064e06

f1017b6303171b1b919a986f98dc191d3a3af54fbbcae6f30340436e234ea0b0

Output

    TrxHash: f1017b6303171b1b919a986f98dc191d3a3af54fbbcae6f30340436e234ea0b0

    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

query account info：
```
./bcli account get --account delegatecreate5
Account: delegatecreate5
    Balance: 1900000.00000000 BTO
    Pubkey: 04ecec203a98be1d27d38d189a8f16f65a24e6ba813e139fdd82bf84c44bef36ffe5813f5cd9a8ab34b4a0c8f490beda68d81b22897f436a24a1ca1cec7c064e06

    StakedBalance: 100000.00000000 BTO
    UnStakingBalance: 0.00000000 BTO
    StakedSpaceBalance: 100000.00000000 BTO
    StakedTimeBalance: 100000.00000000 BTO
    UnStakingTimestamp: 0

    Resource: {
        "free_available_space": 569,
        "free_used_space": 231,
        "stake_available_space": 151142399536,
        "stake_used_space": 464,
        "free_available_time": 200,
        "free_used_time": 200,
        "stake_available_time": 28799999900,
        "stake_used_time": 100
     }

    UnClaimedBlockReward: 0.00000000 BTO
    UnClaimedVoteReward: 0.00000000 BTO
    UnClaimedTotalReward: 0.00000000 BTO

    Vote: N/A

    Contracts: N/A
```


#### 3.4.3.6. BCLI Transferring Function Command

BCLI transfer functions are responsible for transferring BTO from user designated by 'from' to user designated by 'to' account.

##### BCLI transferring Command

Help information

    ./bcli transfer --help
    NAME:
    bcli transfer - for user transfering bto
    
    USAGE:
        bcli transfer [command options] [arguments...]
    
    OPTIONS:
        --from value    the from user account (default: "bottos")
        --to value      the [to] user account (default: "bottos")
        --amount value  the amount of bto (default: "0")


Parameter Description

| chief command   | parameter list | Parameter Description        | mandatory |
| --------------- | :------------: | :--------------------------: | :-------: |
| ./bcli transfer | --from         | transferring user            | No        |
|                 | --to           | target user                  | No        |
|                 | --amount       | BTO amount to be transferred | No        |

Return Information

This will return the Transaction information sent by BCLI.

Sample

    ./bcli transfer --from bottos --to user12345678 --amount 2

Output

    TrxHash: 33004bf950b3af9c2b515654e570755baa8db9e40a57a826812a0f71129a49d2
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>


#### 3.4.3.7. BCLI Transaction Committing and Querying Commands

BCLI Transaction committing and querying commands take the responsibilities of committing a raw transaction defined by user himself to the blockchain, or querying an existing contract by the TrxHash.

Help information

    ./bcli transaction --help
    
    NAME:
    Bottos bcli tool transaction - get or push transactions
    
    USAGE:
    Bottos bcli tool transaction command [command options] [arguments...]
    
    COMMANDS:
        get   get tx details
        push  push transaction
    
    OPTIONS:
    --help, -h  show help


Commandline Function Description

| chief command      | parameter list | Parameter Description                                |
| ------------------ | :------------: | :--------------------------------------------------: |
| ./bcli transaction | get            | Get the specific transaction information via TrxHash |
| ./bcli transaction | push           | Push a Transaction                                   |


##### BCLI Transaction Querying Command

Help information

    ./bcli transaction get --help
    
    NAME:
        Bottos bcli tool transaction get - get tx details
    
    USAGE:
        Bottos bcli tool transaction get [command options] [arguments...]
    
    OPTIONS:
        --trxhash value 

Parameter Description

| chief command          | parameter list | Parameter Description  | mandatory |
| ---------------------- | :------------: | :--------------------: | :-------: |
| ./bcli transaction get | --trxhash      | Transaction hash index | Yes       |

Return Information

This will return the Transaction information of the designated Txhash sent by BCLI.

Sample

    ./bcli transaction get --trxhash 8a403642ea7b51595d1a1454b43b83ba62420629581c3d2f0d2143342aa89c9f

Output

    {
        "ResourceReceipt": null,
        "Transaction": {
            "contract": "bottos",
            "cursor_label": 384655640,
            "cursor_num": 1390,
            "lifetime": 1548324148,
            "method": "transfer",
            "param": {
                "from": "bottos",
                "memo": "",
                "to": "accountcreate5",
                "value": 10000000000
            },
            "sender": "bottos",
            "sig_alg": 1,
            "signature": "97a3a4d4e103ed60e94cb79ba83fa0bae7eb623feceee6222dfd06156cd705b35ee5d85a07ab8b2e1ca95267408d4bf0b9d78fc7aa063e7d4a5ba67a1953b1c3",
            "version": 65536
        },
        "TrxHash": "8a403642ea7b51595d1a1454b43b83ba62420629581c3d2f0d2143342aa89c9f"
    }

    <<<Transaction Status>>> : commited
    

##### BCLI Transaction Pushing Command

Help information

    ./bcli transaction push --help
    NAME:
        Bottos bcli tool transaction push - push transaction
    
    USAGE:
        Bottos bcli tool transaction push [command options] [arguments...]
    
    OPTIONS:
        --sender value    acocunt name
        --contract value  contract name
        --method value    method name
        --param value     param value
        --sign value      sign value


Parameter Description

| chief command           | parameter list | Parameter Description                                           | mandatory |
| ----------------------- | :------------: | :-------------------------------------------------------------: | :-------: |
| ./bcli transaction push | --sender       | The signer（default value is the bottos account）               | No        |
| ./bcli transaction push | --contract     | the contract name owned by one account, should be format of <contractname>@<account name>                                                  | Yes       |
| ./bcli transaction push | --method       | contract's method name                                          | Yes       |
| ./bcli transaction push | --param        | parameter key value pair                                        | Yes       |
| ./bcli transaction push | --sign         | public key defined by user（default value is defined by inside) | No        |

Return Information

This will return the Transaction information of the designated Txhash sent by BCLI.

Sample

    ./bcli transaction push --sender lyp12345678 --contract test1@lyp12345678 --method reguser --param

Output

    "userName:lyp, userRole:lyp, rcvHelloNum:22, lyp:33"
    0 : {userName string} , KEY:  userName , VAL:  lyp
    1 : {userRole string} , KEY:  userRole , VAL:  lyp
    2 : {rcvHelloNum uint64} , KEY:  rcvHelloNum , VAL:  22
    3 : {lyp uint128} , KEY:  lyp , VAL:  33
    
    TrxHash: cb9a695f9f8dfa02e81caf58fc9def571d892b95fd168a9c2f7eb701ee802ed3
    
    This transaction is sent. Please check its result by command : bcli transaction get --trxhash  <hash>

#### 3.4.3.8. BCLI Wallet Command

Wallet functions take the chief responsibilities for user to push the Transactions of actions: create wallet, bind account, unlok the wallet, lock the wallet, query wallet, etc,.

Help information

    ./bcli wallet --help
    
    NAME:
    Bottos bcli tool wallet - For wallet operations
    
    USAGE:
    Bottos bcli tool wallet command [command options] [arguments...]
    
    COMMANDS:
        generatekey  generate key pairs
        create       create wallet
        lock         lock wallet
        unlock       unlock wallet: only one account can be unlocked at same time(if one account is unlocked, the another previous unlocked account will be locked itself.)
        list         list wallet
        listkey      listkey of wallet
        listkey      listkey of wallet
    
    OPTIONS:
    --help, -h  show help


Commandline Function Description

| chief command | parameter list | Parameter Description                                          |
| ------------- | :------------: | :------------------------------------------------------------: |
| ./bcli wallet | generatekey    | Create a new public and private key pair                       |
| ./bcli wallet | create         | Create wallet                                                  |
| ./bcli wallet | lock           | Lock wallet                                                    |
| ./bcli wallet | unlock         | Unlock wallet                                                  |
| ./bcli wallet | list           | List all wallet                                                |
| ./bcli wallet | listkey        | List the wallet and its public key according to the account（Wallet must be unlocked firstly） |

##### BCLI Create Wallet's Public and Private Key Command

Help information
./bcli wallet generatekey --help

    NAME:
        Bottos bcli tool wallet generatekey - generate key pairs
    
    USAGE:
        Bottos bcli tool wallet generatekey [arguments...]


Parameter Description

| chief command             | parameter list | Parameter Description | mandatory |
| ------------------------- | :------------: | :-------------------: | :-------: |
| ./bcli wallet generatekey | (Null)         | （Null）              | （Null）  |

Return Information

This will output a new generated public and private key pair.

Sample

     ./bcli wallet generatekey

Output
{
​    "private_key": "b8b890ebc315a8e1c3a6f7b78977d68ca1e9274c986314ccbe967b964cf68b66",
​    "public_key": "0485fccecf8c8e6260d8558e1a61adca3a888127e34ba0d052dfeb1c31d419bf0494482e7e8a447d63394cff713fc00aa8e64c24b73a8173661a91884b71407bce"
}

##### BCLI Creating Wallet Command

Help information

    ./bcli wallet create --help
    
    NAME:
    Bottos bcli tool wallet create - create wallet
    
    USAGE:
    Bottos bcli tool wallet create [command options] [arguments...]
    
    OPTIONS:
    --account value  account name


Parameter Description

| chief command        | parameter list | Parameter Description          | mandatory |
| -------------------- | :------------: | :----------------------------: | :-------: |
| ./bcli wallet create | --account      | The user name binded by wallet | Yes       |
|                      |  --type   | Wallet use type，normal：for transfer、vot etc；delegate：for Signature block |    No    |


Return Information

This will return the user's keystore information file, which will be saved under path of /home/bottos/bot,  format as <user>.keystore of the file.

Sample

     ./bcli wallet create --account user12345678

Output

Please input your password for your wallet: 

Please input your private key for your wallet: 

{
​    "wallet_name": "user12345678.keystore"
}

Note：
In this case, user should input the wallet password and his used private key by manual.

##### BCLI Lock Wallet Command

Help information

    ./bcli wallet lock --help
    
    NAME:
    Bottos bcli tool wallet lock - lock wallet
    
    USAGE:
    Bottos bcli tool wallet lock [command options] [arguments...]
    
    OPTIONS:
    --account value  account name
    --type value     type of restful for wallet [ normal | delegate ] (default: "normal")


Parameter Description

| chief command      | parameter list | Parameter Description                       | mandatory |
| ------------------ | :------------: | :----------------------------:              | :-------: |
| ./bcli wallet lock | --account      | The user name binded by wallet              | Yes       |
| ./bcli wallet lock | --type         | Create a wallet in normal or delegate mode  | Not       |

Return Information

This will output the wallet locked state flag.

Sample

./bcli wallet lock --account user12345678

Output

./bcli wallet lock --account user12345678
{
​    "lock": true
}

##### BCLI Unlock the wallet command line

Help information
​    
​    ./bcli wallet unlock --help
​    
​    NAME:
​    Bottos bcli tool wallet unlock - unlock wallet
​    
    USAGE:
    Bottos bcli tool wallet unlock [command options] [arguments...]
    
    OPTIONS:
    --account value  account name
    --type value     type of restful for wallet [ normal | delegate ] (default: "normal")

Parameter Description

| chief command      | parameter list | Parameter Description                       | mandatory |
| ------------------ | :------------: | :----------------------------:              | :-------: |
| ./bcli wallet lock | --account      | The user name binded by wallet              | Yes       |
| ./bcli wallet lock | --type         | Create a wallet in normal or delegate mode  | Not       |

Return Information

This will output the wallet unlocked state flag.

Sample

     ./bcli wallet unlock --account user12345678

Output

    Please input your password for your wallet: 
    
    {
        "unlock": true
    }

Note：
In this case, user should input the wallet password and his used private key from generating wallet by manual.


##### BCLI Watching All Wallet List Command

Help information
​    
​    ./bcli wallet list --help
​    
​    NAME:
​    Bottos bcli tool wallet list - list wallet
​    
    USAGE:
    Bottos bcli tool wallet list [arguments...]

Parameter Description

| chief command      | parameter list | Parameter Description | mandatory |
| ------------------ | :------------: | :-------------------: | :-------: |
| ./bcli wallet list | (Null)         | （Null）              | （Null）  |

Return Information

This will output the wallet unlocked state flag.

Sample

     ./bcli wallet list

Output

    [
        {
            "account_name": "user12345678",
            "public_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
            "wallet_path": "/home/bottos/bot/user12345678.keystore"
        }
    ]

##### BCLI Watching wallet's Public Key Command

Note：
​    This command must be used after the wallet be under the unlocked state.

Help information
​    
​    ./bcli wallet listkey --help
​    
​    NAME:
​    Bottos bcli tool wallet listkey - listkey of wallet
​    
    USAGE:
        Bottos bcli tool wallet listkey [command options] [arguments...]
    
    OPTIONS:
        --account value  account name


Parameter Description

| chief command         | parameter list | Parameter Description          | mandatory |
| --------------------- | :------------: | :----------------------------: | :-------: |
| ./bcli wallet listkey | --account      | The user name binded by wallet | （Null）  |

Return Information

This will output the public and private key pair of the wallet's binded account.

Sample

    ./bcli wallet listkey --account user12345678

Output

{
​    "account_name": "user12345678",
​    "private_key": "b799ef616830cd7b8599ae7958fbee56d4c8168ffd5421a16025a398b8a4be45",
​    "public_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f"
}

Note:
This command requires user to unlock account's wallet first, otherwise the command returns the empty result such as '{}'.

##### BCLI Log Function Command

Help information

./bcli log setconfigitem --h
NAME:
   Bottos bcli tool log - for log operations

USAGE:
   Bottos bcli tool log command [command options] [arguments...]

COMMANDS:
​     setconfigitem  set log config item. If you need change the log confiration in your configuration, please also input the --serveraddr <LogRESTHost>:<LogRESTPort> firstly in this command

OPTIONS:
   --help, -h  show help

Parameter Description

| chief command         | parameter list | Parameter Description          | mandatory |
| ------------------------- | :------: | :----------------------------: | :------: |
| ./bcli log  setconfigitem | --key    | log parameters, choose one to set：minlevel | maxlevel | levels | maxrolls | Yes |
| ./bcli log  setconfigitem | --value  | the value setting accourding to the log parameter       | Yes       |

Return Information

The command will return the set result.

Sample

    ./bcli log  setconfigitem --key minlevel --value debug

Output

    {
        "errcode": 0
    }
    setconfigitem successfully.
#### 3.4.3.9. BCLI P2P Command

P2P functions take the chief responsibilities for user to connect the bottos net : disconnect the bottos net, query node's status, query node's peers, etc,.

Help information

```
 ./bcli p2p --help
NAME:
   Bottos bcli tool p2p - for p2p connection

USAGE:
   Bottos bcli tool p2p command [command options] [arguments...]

COMMANDS:
     connect     connect address or port
     disconnect
     status      p2p status
     peers       peers information

OPTIONS:
   --help, -h  show help

```

##### ##### BCLI Listing Current Node Peer

Help information

```
./bcli p2p peers --help
NAME:
   Bottos bcli tool p2p peers - peers information

USAGE:
   Bottos bcli tool p2p peers [command options] [arguments...]

OPTIONS:
   --limit value  (default: 100)
   --start value  (default: 0)
```

Parameter Description

| chief command  | parameter list |                Parameter Description                 | mandatory |
| -------------- | :------------: | :--------------------------------------------------: | :-------: |
| bcli p2p peers |    --limit     |              Output the head N records               |    No     |
|                |    --start     | Output from head N record and stop within the limits |    No     |



Return Information

This will return the peer information sent by BCLI.

Sample

```
./bcli p2p peers

```

Output

```
{
    "data": [
        {
            "addr": "127.0.0.1",
            "chain_id": "4b97b92d2c78bcffe95ebd3067565c73a2931b39d5eb7234b11816d    cec54761a",
            "head_block_num": 1215,
            "last_consensus_block_num": 1215,
            "port": "9871",
            "version": 197632
        },
        {
            "addr": "127.0.0.1",
            "chain_id": "4b97b92d2c78bcffe95ebd3067565c73a2931b39d5eb7234b11816d     cec54761a",
            "head_block_num": 1215,
            "last_consensus_block_num": 1215,
            "port": "9872",
            "version": 197632
        },
        
    ],
    "peerCount": 2
}

```





# 4.Run Bottos Locally


## 4.1. Setup Environment

### 4.1.1. Basic environment preparation

#### 4.1.1.1. Operating System

UBUNTU16.04 LTS (or higher) is recommended

##### Building a development environment

###### Golang environment Installation

Note: In this specification we use the Operating System in version of [Ubuntu Server 16.04 LTS](https://www.ubuntu.com/download/server)

The python of version 2.7.* needs be pre-installed on your Operating System.

- Download golang source code

```
wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz
```

- Extract golang package into directory of /usr/local

```
sudo tar -zxvf go1.11.linux-amd64.tar.gz -C /usr/local
```

- Add the directory `/usr/local/go/bin` into system PATH environment variable

```
export PATH=$PATH:/usr/local/go/bin
```

- Check if the golang was installed successfully

```
go env
```

If the following results occur, the configuration is successful

```
GOARCH="amd64"
GOBIN="/home/bottos/go/bin"
GOCACHE="/home/bottos/.cache/go-build"
GOEXE=""
GOFLAGS=""
GOHOSTARCH="amd64"
GOHOSTOS="linux"
GOOS="linux"
GOPATH="/home/bottos/go"
GOPROXY=""
GORACE=""
GOROOT="/usr/lib/go1.10"
GOTMPDIR=""
GOTOOLDIR="/usr/lib/go1.10/pkg/tool/linux_amd64"
GCCGO="gccgo"
CC="gcc"
CXX="g++"
CGO_ENABLED="1"
GOMOD=""
CGO_CFLAGS="-g -O2"
CGO_CPPFLAGS=""
CGO_CXXFLAGS="-g -O2"
CGO_FFLAGS="-g -O2"
CGO_LDFLAGS="-g -O2"
PKG_CONFIG="pkg-config"
GOGCCFLAGS="-fPIC -m64 -pthread -fmessage-length=0 -fdebug-prefix-map=/tmp/go-build892316758=/tmp/go-build -gno-record-gcc-switches"
```

- Configure the `GOPATH` working directory

Enter the directory corresponding to  `GOPATH`  in the return results of the ' go env ' above and create the appropriate working directory

Note:`The exact catalogue here depends on the real situation of the individual.`

```
mkdir /home/bottos/go
cd /home/bottos/go
mkdir bin pkg src src/github.com src/golang.org
```

At this point, the golang environment has been successfully set up.


#### 4.1.1.2. Node base version package installation

Bottos release packages' URL is under path of https://github.com/bottos-project/bottos/releases , it is recommended that users download the latest release package to test or verify it.

In this sample, the version of package is v3.4.

Enter the following command to install the tool and bottos to get the specific release version package.

```
apt-get update && apt-get install -y wget vim
wget https://github.com/bottos-project/bottos/releases/download/tag_bottos3.4/bottos_ubuntu_v3.4.tar.gz
```

Unpack the downloaded version package:

(After unpack the release package, the folder corresponding to the release version will be generated in the current directory. In this sample the generated folder is bottos_v3.4，the release package is bottos_ubuntu_v3.4.tar.gz)

```
tar zvxf bottos_ubuntu_v3.4.tar.gz
```

Release package file description

    bottos        Node master program
    bcli          Node supporting tools, details can be found in the bcli user description document on the official website
    config.toml   The node configuration file is described in detail in the next section
    genesis.toml  This file is used to uniquely identify an identified chain
    Other 2 toml files  The file is prepared for the node to connect to the test network, which the user does not need to care about.

### 4.1.2. Single node developing environment

Refer to the documentation for a single-node developing environment： [Single node developing environment](./resource_en/Single_Node_mode_developing_environment.MD)

### 4.1.3. Multi-Nodes developing environment

For multi-nodes developing environment please refer to： [multi-nodes developing environment](./resource_en/Multi-Nodes_Developping_environment.MD)

## 4.2. Prepare the Bottos Version

### 4.2.1. Download the released version (recommended)

> [Bottos Chain Release Version](https://github.com/bottos-project/bottos/releases), path in https://github.com/bottos-project/bottos/releases

&nbsp;

### 4.2.2. Download the source code and compile the version



#### 4.2.2.1. Prepare the compile environment

##### 4.2.2.1.1. Golang installation

> [Golang locale installation](./Set_up_the_Golang_Developping_environment.md)

##### 4.2.2.1.2. MinGW program installation (Windows ONLY)
> The program can be downloaded from [MinGW official website address](http://www.mingw.org/) and requires no less than version 8.1.0 of MinGW.

#### 4.2.2.2. Download the source code

> [Bottos Chain Source Code](https://github.com/bottos-project/bottos), path in https://github.com/bottos-project/bottos


#### 4.2.2.3. Compile the source code

##### 4.2.2.3.1. Compile in Linux (Ubuntu/MacOS)

- Compile the bottos chain executable program.
```
    user:bottos user$ make bottos
    build/vmlib.sh
    build/bottos.sh
    go build
    Done building.
    Run "./bottos --help" for help.
```
- Compile the bcli human-machine command executable program.
```
    user:bottos user$ make bcli
    build/bcli.sh go install
    Done building.
    Run "build/bin/bcli" to launch command line tool.
```
- Compile wallet wallet executable program.
```
    user:bottos user$ make wallet
    build/wallet.sh go install
    Done building.
    Run "build/bin/wallet" to launch wallet.
```
- Compile all executable files at once, either by making all or by using the makeall.sh script.

```
    user:bottos user$ make all
    build/vmlib.sh
    build/bottos.sh
    go build
    Done building.
    Run "./bottos --help" for help.
    build/bcli.sh go install
    Done building.
    Run "build/bin/bcli" to launch command line tool.
    build/wallet.sh go install
    Done building.
    Run "build/bin/wallet" to launch wallet.
```

##### 4.2.2.3.1. Compile in Windows

Execute the makeall.sh script in the source root directory, which will generate bottos executable programs in the current directory, and bcli and wallet executables in the build/bin directory, as shown below:

![](../common/windows_compile.png)

## 4.3. Ready to run environment

### 4.3.1. Start the local single-node environment

Start the Bottos single node with the following instructions

```
    ./bottos --delegate bottos --enable-wallet
```

> Parameter meaning:
> `--delegate`: Specifies that the account for the block producer is bottos
> `--enable-wallet`: Specifies that the wallet service should be started with the chain


The node starts successfully if the following information is returned

```
CommitBlock by p2p: lib: 1
InsertBlock: number:1, delegate:bottos, trxn:0, time=1537948299, hash: 566fb29ab982c128bf6c71297bc4e7d558e0f86ae89a7f3955ea46b04689fb5a, prevHash=caf2bae84f70412354211dd5028142eca6901b06b9a65dfbe9df065bcf56e291
CommitBlock by p2p: lib: 2
InsertBlock: number:2, delegate:bottos, trxn:0, time=1537948302, hash: 8abe6aef22249ab58d6c7cd3970f909571c4e818f3757d9de7d86870bfc7465b, prevHash=566fb29ab982c128bf6c71297bc4e7d558e0f86ae89a7f3955ea46b04689fb5a
```

&nbsp;

### 4.3.2. Join an existing test network


Connect the single node started the Bottos test network. The following configuration needs to be done：


Modify file `config-testnet.toml`

- P2PServAddr: Changes to the current node's extranet IP

```
P2PServAddr = "192.168.1.1"   // Changes to the current node's extranet IP
```

Then run the following command to connect the current node to the test network

`Note`：If the project directory exists the directory of `datadir`, we need to run the following commands to delete it at first.

```
rm -rf datadir
```

Start node and connect the node to Bottos test network

```
./bottos --config="./config-testnet.toml" --genesis="./genesis-testnet.toml"
```

Wait a moment and if a large amount of the following printed information appears, it indicates that the automatic synchronization block has been successfully connected to the test network

```
CommitBlock by p2p: lib: 1
InsertBlock: number:1, delegate:bottos, trxn:0, time=1537888767, hash: 03f6c7aa72314be76902b6c2d4b86b7afbb07d2b4b4dec67caf6fc51e125e9ed, prevHash=98128aa21d634eda9cb0152314b06480d4c51b0bf18ea6d39f5189388e1bf4ee
CommitBlock by p2p: lib: 2
InsertBlock: number:2, delegate:bottos, trxn:0, time=1537888770, hash: c87a1c59aaa87f890169a1016931b3a9e539e72e475c0861623ed36fbd00c1b4, prevHash=03f6c7aa72314be76902b6c2d4b86b7afbb07d2b4b4dec67caf6fc51e125e9ed
CommitBlock by p2p: lib: 3
InsertBlock: number:3, delegate:bottos, trxn:0, time=1537888773, hash: 3bcf9ecf116891b226b2c6b31578d5f1ee867a75b667752286eeaf3d237e684b, prevHash=c87a1c59aaa87f890169a1016931b3a9e539e72e475c0861623ed36fbd00c1b4
CommitBlock by p2p: lib: 4
```

## 4.4. Experience basic operations

And you can download mobile wallet to experience Bottos Chain. ([Android Wallet](http://share.wali.fun/79813218418): http://share.wali.fun/79813218418)


### 4.4.1. Create the Wallet

Prepare your wallet account, password, and private key

For example, to create a bottos wallet, the private key takes the bottos private key in config.toml

```
cd to bottos project directory:

     cd ~/bottos-node/bottos/

Create bottos wallet:

     ./bcli wallet create --account bottos
```
This creates the bottos wallet, which creates a bottos.keystore file containing the private key and password, and stores it in the bot directory.

```
root@node:~/bottos-node/bottos#bcli wallet create --account bottos

Please input your password for your wallet:

Please input your password again for your wallet:

Please input your private key for your wallet:

{
    "wallet_name": "bottos.keystore"
}

Create wallet done. Now unlock the wallet within 300 seconds.
{
    "unlock": true
}
```

### 4.4.2. Create Account

Perform the following actions under the project code path：

```
cd to bottos project directory

    cd bottos-node/bottos/

Generate a pair of public and private keys and save them please

    ./bcli wallet  generatekey

Enter your password to unlock your wallet

    ./bcli wallet unlock --account bottos

Create the account name test001 using the public key saved above, and the referrals is 'bottos'

    ./bcli account create --account test1234567890  --pubkey 0411c2d1679d2b40e9bb7060eab34edc5e6fa69d4142728fad131d141fa6c61452b747c88dd0bc9584024a58787646a06e7c798211eed24f4e4687732747fbe79c --referrer bottos
```

example：A successful execution returns a hash of the transaction

```
root@node:~/bottos-node/bottos# ./bcli wallet  generatekey
public_key: 0411c2d1679d2b40e9bb7060eab34edc5e6fa69d4142728fad131d141fa6c61452b747c88dd0bc9584024a58787646a06e7c798211eed24f4e4687732747fbe79c
private_key: 8529d2c8a51df6105a46a5363cc2378f95060c39ac5212e2d5c6ba436de0d7dd
root@node:~/bottos-node/bottos# ./bcli account create --account test1234567890 --pubkey 0411c2d1679d2b40e9bb7060eab34edc5e6fa69d4142728fad131d141fa6c61452b747c88dd0bc9584024a58787646a06e7c798211eed24f4e4687732747fbe79c --referrer bottos
Create account: test1234567890 Succeed
Trx:
{
    "version": 1,
    "cursor_num": 299,
    "cursor_label": 1590795549,
    "lifetime": 1540264573,
    "sender": "bottos",
    "contract": "bottos",
    "method": "newaccount",
    "param": {
        "name": "test1234567890",
        "pubkey": "0411c2d1679d2b40e9bb7060eab34edc5e6fa69d4142728fad131d141fa6c61452b747c88dd0bc9584024a58787646a06e7c798211eed24f4e4687732747fbe79c"
    },
    "param_bin": "dc0002da000774657374303031da008230343131633264313637396432623430653962623730363065616233346564633565366661363964343134323732386661643133316431343166613663363134353262373437633838646430626339353834303234613538373837363436613036653763373938323131656564323466346534363837373332373437666265373963",
    "sig_alg": 1,
    "signature": "7234c464012a560296683bd6f4992f1bc82526824e8b6f400b75502d261f31db4f20d95419d538ce43b82ecaf6297f0b107a911075b9290be8320b820e1941cc"
}
TrxHash: cde9db1ec6ed4622104acc81cac94c9765b9de3e997b1b4f46b1e83ed94163da

Please create wallet for your new account.
```

### 4.4.3. Stake

Users need to stake a certain number of BTO in order to have sufficient authority to vote on the production node or to make transactions such as transfer or other contracts.

For users who have not staked BTO:

Users will not be able to perform voting operations (voting will fail), and the number of times they will perform contract transactions is very limited (free quota) : after 3 times of operation of transfer or other contracts, they will lose the operation permission on the same day (the same number of permissions will be restored on the next day).


For users who have staked BTO:


Open to users will vote more certain amount and the power of use of resources (depending on the stake count how many), if operating within 1 days more than the staking right number of operation (after voting, transfer or other contracts), the user also has a certain operation permissions (lines) for free, if after 1 days use these lines, then the day will lose operation permissions (the next day will return to a certain number of times permissions).

Operation mode of stake:

See section 4.4.5

### 4.4.4. Claim

In order to claim the staked BTO, the unstake operation should be done at first (in section 4.4.5, "unstake" operation shall be adopted on the mobile phone APP).

After the unstaking operation is completed, the user shall wait for 3 days before "claim his/her BTO", then the BTO will immediately return to the user's account after the claim operation.

### 4.4.5. Vote Resources

There are two ways to stake resources:

General users use mobile wallet to stake the resources of this account:

1. Login or import users;

2. In the "asset details" interface, click the BTO asset line to enter the pledge interface;

3. Click the "stake" button, enter the "stake number" in the "stake BTO number", and select "space" or "time" according to the need of the "pledge target";


4. Enter the password for pledge operation.

If you are a developer, you can also use the BCLI command line to pledge;


\# ./bcli account stake --account bottostest --amount 100 --target space


\# ./bcli account stake --account bottostest --amount 100 --target time

Directions: each account has a free push transaction limit of 3 push transactions every 24 hours (the measurement standard of a single push transaction is the amount of resources consumed by the transfer transaction)


### 4.4.6. Space Resources

Space resources include network resources and storage resources consumption, free space limit of 800Bytes. After the user stakes BTO to space, every vote/cancelvote and any transaction and transaction will consume certain space resources. It should be noted that when the user's space resources are used up, there will be 3 transactions, 800 Bytes of space and 400 microseconds of time. When any of the three transactions and space and time resources are consumed over, the quota will be stopped (vote will not be executed in the case of occupying free quota), and the quota will be restored the next day.


### 4.4.7. Time Resources

The time resource contains the total transaction time cost, typically 400 microseconds of time for free  per day.(Accordingly, the space resource is 800 Bytes for free per day). After the user stakes BTO to space, every vote/cancelvote and any transaction and transaction will consume certain space resources. It should be noted that when the user's space resources are used up, there will be 3 transactions, 800Bytes of space and 400 microseconds of time. When any of the three transactions and space and time resources are exhausted, the quota will be stopped (a vote cannot be executed if only the free quota is left) and the quota will be restored the next day.

&nbsp;

### 4.4.8. Experience the BTO transfer

Do the following under the bottos project path：

```
cd to bottos project path:
    cd bottos-node/bottos/

Enter your password to unlock your wallet
    ./bcli wallet unlock --account bottos

Bottos transfers 1000 BTO to test001:

    ./bcli transfer --from bottos --to test1234567890 --amount 1000
```

example：A successful execution returns a hash of the transaction

```
root@node:~/bottos-node/bottos# ./bcli wallet unlock --account bottos

Please input your password for your wallet:

{
    "unlock": true
}
root@node:~/bottos-node/bottos# ./bcli transfer --from bottos --to test1234567890 --amount 1000
Transfer Succeed
    From: bottos
    To: test1234567890
    Amount: 10000000000000000000
Trx:
{
    "version": 1,
    "cursor_num": 158,
    "cursor_label": 413395567,
    "lifetime": 1540265785,
    "sender": "bottos",
    "contract": "bottos",
    "method": "transfer",
    "param": {
        "from": "bottos",
        "to": "test1234567890",
        "value": 100000000000
    },
    "param_bin": "dc0003da0006626f74746f73da000774657374303031c500200000000000000000000000000000000000000000000000008ac7230489e80000",
    "sig_alg": 1,
    "signature": "fd719d1222cca73e19c7b8693d660527e885b29fec6deed57ac15a71e2e5c2824c15171a5ba3f475c81ed5ef747244674e84339daf12ff0d4df72e05c79cd6a7"
}
TrxHash: 83d5042570b666f2eba9e5cdbbab735444c93f4cb41a64e3b132dbba7fda6b43
```


# 5.Supernode startup guide


## 5.1. Basis of preparation

## 5.2. Safe lifting

### 5.2.1. Start the Wallet service

```
# ./wallet 
Start wallet REST service. Listen IP: 127.0.0.1  Port: 6869
```

### 5.2.2. Create a block signature wallet

```
bcli wallet create --account bottos --type delegate

Please input your password for your wallet: 

Please input your password again for your wallet: 

Please input your private key for your wallet: 

{
    "wallet_name": "bottos_sign.keystore"
}

Create wallet done. Now unlock the wallet within 300 seconds.
{
    "unlock": true
}
```


If the wallet is already created, unlock it first

```
# ./bcli wallet unlock --account bottos --type delegate
```

### 5.2.3. Configure for config.toml

The producer signature in config.toml is configured in "public - private key" way by default

```
[Delegate.Signature]
Type = "key"
PrivateKey = "b799ef616830cd7b8599ae7958fbee56d4c8168ffd5421a16025a398b8a4be45"
PublicKey = "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f"
URL = ""
```
So we need change above parts into:

```
[Delegate.Signature]
Type = "wallet"
PublicKey = "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f"
URL = "http://127.0.0.1:6869/v1/wallet/signhash"
```
### 5.2.4. Start
```
# ./bottos --delegate delegatexx --delegate-signkey 0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f

InsertBlock, number:1, time:2018-11-22 08:07:54, delegate:bottos, trxn:0, hash:5f920c93c55096a936ee33c07563526a7f0c03cf5cd430dcbfaeae33beedb782, prevHash:caf2bae84f70412354211dd5028142eca6901b06b9a65dfbe9df065bcf56e291
InsertBlock, number:2, time:2018-11-22 08:07:57, delegate:bottos, trxn:0, hash:f435792b875d60c0c7ba7d8b420f93b939e776ca255faf8214fc1f8a3225969b, prevHash:5f920c93c55096a936ee33c07563526a7f0c03cf5cd430dcbfaeae33beedb782
```



# 6.Resource repository


## 6.1. C++ Contract Development SDK

[C++ Contract Development SDK](https://github.com/bottos-project/contract-tool-cpp) already on Github

## 6.2. JavaScript Contract Development SDK

[JavaScript Contract Development SDK](https://github.com/bottos-project/contract-tool-js) already on Github

## 6.3. Wallet Development SDK

[Wallet SDK](https://github.com/bottos-project/bottos-js-crypto) already on Github

## 6.4. Common REST API

### Block 

#### Get Block Header Information

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

####  Get the block information

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

### Transaction

#### Get hash for signature

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

#### Send the transaction information

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

#### Query Transaction Information

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

#### Query Transaction Status

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
| status    | string     | query transaction status result.<br />”committed“：Transaction has successfully committed；<br />”not found“：Transaction execute failed；<br />”packed“：Transaction has packed；<br/>”pending“：Transaction submitted but not processed；<br />”sending“：Transaction has been submitted and processed in the cache pool |

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

### Accounts

#### Query Accounts Brief Information

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

#### Query Accounts Detail Information

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

### Contract 

#### Query Contract ABI

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

#### Query contract code

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

### Producer

#### Query All Producers

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

### Transaction Data

#### Query Data Based on Keywords

**API Function**

> API Description： Query data based on keywords
>
> **APIAddress**
>
> URL: /v1/common/query
>
> **Response Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter | Mandatory | Type   | Default Value | Description              |
| --------- | --------- | ------ | ------------- | ------------------------ |
| contract  | TRUE      | string | Null          | Contract name            |
| object    | TRUE      | string | Null          | Contract table name      |
| key       | TRUE      | string | Null          | The keyword for querying |

**Response Fields：**

| Parameter | Type       | Description                                               |
| --------- | ---------- | --------------------------------------------------------- |
| errcode   | uint32     | Error code，0-Succeed，others refer to error code chapter |
| msg       | string     | response description                                      |
| result    | jsonObject | response result                                           |
| contract  | string     | Contract name                                             |
| object    | string     | Contract table name                                       |
| key       | string     | The keyword for querying                                  |
| value     | uint32     | Queried value                                             |

**Fields Changes**

- Null

  **API Sample**

> Address：<http://127.0.0.1:8689/v1/common/query>

- Request:

  ```
  {
  	"contract":"bottostoken",
  	"object":"DTO",
  	"key":"aaa"
  }
  ```

- Response:

  ```
   HTTP/1.1 200 OK
  {
    "errcode": 0,
    "msg": "",
    "result": {
          "contract": "bottostoken",
          "object": "DTO",
          "key": "aaa",
          "value": "dc0001cf000000ba43b74000"
    }
  }
  ```

#### Serialization Of Business Data

**API Function**

> API Description: Serialize the business data, and the JSON converts to a hexadecimal string as the Parm field value in the "Send the transaction information request".
>
> **APIAddress**
>
> URL: /v1/common/jsontobin
>
> **Response Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter | Mandatory | Type   | Default Value | Description              |
| --------- | --------- | ------ | ------------- | ------------------------ |
| contract  | TRUE      | string | Null          | Contract name            |
| object    | TRUE      | string | Null          | Contract table name      |
| key       | TRUE      | string | Null          | The keyword for querying |

**Response Fields：**

| Parameter | Type       | Description                                               |
| --------- | ---------- | --------------------------------------------------------- |
| errcode   | uint32     | Error code，0-Succeed，others refer to error code chapter |
| msg       | string     | response description                                      |
| result    | jsonObject | response result                                           |
| contract  | string     | Contract name                                             |
| object    | string     | Contract table name                                       |
| key       | string     | The keyword for querying                                  |
| value     | uint32     | Queried value                                             |

**Fields Changes**

- Null

  **API Sample**

> Address：<<http://127.0.0.1:8689/v1/common/jsontobin>

- Request:

  ```
  {
  	"account_name": "testtest",
  	"public_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f"
  }
  ```

- Response:

  ```
   HTTP/1.1 200 OK
  {
    "errcode": 0,
    "msg": "",
    "result": {
          "contract": "bottostoken",
          "object": "DTO",
          "key": "aaa",
          "value": "dc0001cf000000ba43b74000"
    }
  }
  ```

## 6.5. Wallet API

### One-Step to create wallet

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





### Generate Public Private Key Pairs

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

### Create Account

**API Function**

> API Description: Create account, When calling this interface, you need to start the bottos node program; start the wallet service separately, this function is not available.
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



### Create Wallet by Manual

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



### Open/Unlock wallet

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



### Close/Lock Wallet

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



### Query wallets' list

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



### Query Public Key

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



### Sign for Transaction

**API Function**

> API Description: Sign for transaction
>
> **API Address**
>
> URL:  /v1/wallet/signtransaction
>
> **Result Format**
>
> JSON
>
> **Request Format**
>
> POST

**Request Parameter：**

| Parameter     | Mandatory | Type   | Default Value | Description                                            |
| -------- | ---- | ------ | ------ | ----------------------------------------------- |
| sender   | TRUE | string | Null     | Account name who send the transaction         |
| contract | TRUE | string | Null     | Contract name                                 |
| method   | TRUE | string | Null     | Contract method                                      |
| param    | TRUE | string | Null     | Business structured data，after the bpl serialization, it converts to hexadecimal string |
| sig_alg | FALSE | int | 1 | Signature algorithm type, currently only supports one type, and may be extended later |
| type | FALSE | string | "normal" | Signature wallet usage type, normal: for transfer, voting, etc.; delegate: for producers to issue block signatures (for general producers) |
| push_url | FALSE | string | "127.0.0.1:8689" | Receive server address information of the transaction, format: IP address or domain name + port number (default 8689), <br/> * Optional main network service node: mainnetservice1.bottos.org:8689; mainnetservice2.bottos.org:8689 
* Optional test network service node: testnetservice1.bottos.org:8689; testnetservice2.bottos.org:8689 |

**Response Field:**

| Parameter    | Type       | Description                                       |
| ------- | ---------- | ------------------------------------------ |
| errcode | uint32     | Error code, 0-succeed, others refer to error code chapter       |
| msg     | string     | Response description                                   |
| result  | jsonObject | Response result，See the "Send Transaction information" request field specifically |

**Field change**

- Null

  **API Sample**

> Address : <http://127.0.0.1:6869/v1/wallet/signtransaction>

- Request : 

  ```
  {
  	"sender": "bottosreferrer1",
  	"contract": "bottos",
  	"method": "newaccount",
  	"param": "dc0002da000a626f74746f7374657374da008230343931363362623834633739393438316131633630616331323265393431663566306233653639346435326439626530613862316561343730666361636266323564623439306330336334376564356465393862653735623435376333383730386465376539653935653461306263653634356539633033353861386435393638",
  	"sig_alg": 1,
  	"type": "normal",
  	"push_url": "testnetservice2.bottos.org:8689"
  }
  ```

- Response : 

  ```
   HTTP/1.1 200 OK
  {
      "errcode": 0,
      "msg": "success",
      "result": {
          "version": 65792,
          "cursor_num": 709915,
          "cursor_label": 2189965103,
          "lifetime": 1551089224,
          "sender": "bottosreferrer1",
          "contract": "bottos",
          "method": "newaccount",
          "param": "dc0002da000a626f74746f7374657374da008230343931363362623834633739393438316131633630616331323265393431663566306233653639346435326439626530613862316561343730666361636266323564623439306330336334376564356465393862653735623435376333383730386465376539653935653461306263653634356539633033353861386435393638",
          "sig_alg": 1,
          "signature": "2157bebc67481effcedcfacdf59da4ffc06976c443dedb7c511d7663a3126fe44191ae9c8f4605ea64566a4893d87a7cee3cc9f19c966fc214c6b6ee3c562f85"
      }
  }
  ```

### Sign for HASH

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
