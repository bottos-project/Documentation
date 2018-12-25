

![](./common/cover.jpg)

<div style="page-break-after: always;"></div>

<!-- TOC -->

- [1. Bottos Introduction](#1-bottos-introduction)
  - [1.1. Project Brief](#11-project-brief)
  - [1.2. System Architecture](#12-system-architecture)
  - [1.3. Network Structure](#13-network-structure)
- [2. Getting Started](#2-getting-started)
  - [2.1. Browser Bottos Chain](#21-browser-bottos-chain)
    - [2.1.1. Bottos Chain Overview](#211-bottos-chain-overview)
    - [2.1.2. Activities on Bottos Chain](#212-activities-on-bottos-chain)
    - [2.1.3. Locations of Super Nodes](#213-locations-of-super-nodes)
  - [2.2. Run Bottos Chain on Local Machine](#22-run-bottos-chain-on-local-machine)
  - [2.3. Prepare the Bottos Version](#23-prepare-the-bottos-version)
  - [2.4. Ready to run environment](#24-ready-to-run-environment)
    - [2.4.1. Start the local single-node environment](#241-start-the-local-single-node-environment)
    - [2.4.2. Join an existing test network](#242-join-an-existing-test-network)
  - [2.5. Experience basic operations](#25-experience-basic-operations)
    - [2.5.1. Create the Wallet](#251-create-the-wallet)
    - [2.5.2. Create Account](#252-create-account)
    - [2.5.3. Experience the BTO transfer](#253-experience-the-bto-transfer)
- [3. The advanced operation](#3-the-advanced-operation)
  - [3.1. Stake](#31-stake)
  - [3.2. Claim](#32-claim)
  - [3.3. Vote Resources](#33-vote-resources)
  - [3.4. Space Resources](#34-space-resources)
  - [3.5. Time Resources](#35-time-resources)
- [4. Developing Guide](#4-developing-guide)
  - [4.1. Set up Environment](#41-set-up-environment)
    - [4.1.1. Basic environment preparation](#411-basic-environment-preparation)
      - [4.1.1.1. Operating System](#4111-operating-system)
      - [4.1.1.2. Node base version package installation](#4112-node-base-version-package-installation)
    - [4.1.2. Single node developing environment](#412-single-node-developing-environment)
    - [4.1.3. Multi-Nodes developing environment](#413-multi-nodes-developing-environment)
  - [4.2. Smart Contract](#42-smart-contract)
    - [4.2.1. Introduction to Smart Contract (also includes the introduction to contract writing rules and ABI)](#421-introduction-to-smart-contract-also-includes-the-introduction-to-contract-writing-rules-and-abi)
    - [4.2.2. C++ intelligent contract developing example](#422-c-intelligent-contract-developing-example)
    - [4.2.3. JavaScript intelligent contract developing example](#423-javascript-intelligent-contract-developing-example)
  - [4.3. BCLI Command](#43-bcli-command)
  - [4.4. DAPP Development](#44-dapp-development)
    - [4.4.1. JavaScript contract development example](#441-javascript-contract-development-example)
  - [4.5. Development tools](#45-development-tools)
    - [4.5.1. Wallet SDK](#451-wallet-sdk)
    - [4.5.2. C++ Smart Contract Development SDK](#452-c-smart-contract-development-sdk)
    - [4.5.3. JavaScript Smart Contract Development SDK](#453-javascript-smart-contract-development-sdk)
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



# 1. Bottos Introduction

## 1.1. Project Brief
[Project Brief](./resource_en/Project_Brief.md)

## 1.2. System Architecture
[System Architecture](./resource_en/System_Architecture.md)

## 1.3. Network Structure
[Bottos Network Structure](./resource_en/Bottos_Network.md)


# 2. Getting Started
This chapter is an introduction to show you how to run the Bottos Chain, and how to use the basic instructions like register/transfer etc.

And you can download mobile wallet to experience Bottos Chain. ([Android Wallet](https://dapp.botfans.org/wallet/BottosWallet.apk): https://dapp.botfans.org/wallet/BottosWallet.apk)



## 2.1. Browser Bottos Chain

[Bottos Browser](http://explorer.bottos.org) link is http://explorer.bottos.org

### 2.1.1. Bottos Chain Overview
![](./common/bottos_browser.png)

### 2.1.2. Activities on Bottos Chain
![](./common/activities.png)


### 2.1.3. Locations of Super Nodes
![](./common/supernodes.png)


## 2.2. Run Bottos Chain on Local Machine

## 2.3. Prepare the Bottos Version
[Prepare the Bottos version](./resource_en/Prepare_the_Bottos_Version.md)

## 2.4. Ready to run environment

### 2.4.1. Start the local single-node environment

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

### 2.4.2. Join an existing test network


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



## 2.5. Experience basic operations

### 2.5.1. Create the Wallet

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

### 2.5.2. Create Account

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

### 2.5.3. Experience the BTO transfer

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




# 3. The advanced operation
## 3.1. Stake

Users need to stake a certain number of BTO in order to have sufficient authority to vote on the production node or to make transactions such as transfer or other contracts.

For users who have not staked BTO:

Users will not be able to perform voting operations (voting will fail), and the number of times they will perform contract transactions is very limited (free quota) : after 3 times of operation of transfer or other contracts, they will lose the operation permission on the same day (the same number of permissions will be restored on the next day).


For users who have staked BTO:


Open to users will vote more certain amount and the power of use of resources (depending on the stake count how many), if operating within 1 days more than the staking right number of operation (after voting, transfer or other contracts), the user also has a certain operation permissions (lines) for free, if after 1 days use these lines, then the day will lose operation permissions (the next day will return to a certain number of times permissions).


Operation mode of stake:

See section 3.3

## 3.2. Claim

In order to claim the staked BTO, the unstake operation should be done at first (in section 3.3, "unstake" operation shall be adopted on the mobile phone APP).

After the unstaking operation is completed, the user shall wait for 3 days before "claim his/her BTO", then the BTO will immediately return to the user's account after the claim operation.

## 3.3. Vote Resources

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


## 3.4. Space Resources

Space resources include network resources and storage resources consumption, free space limit of 800Bytes. After the user stakes BTO to space, every vote/cancelvote and any transaction and transaction will consume certain space resources. It should be noted that when the user's space resources are used up, there will be 3 transactions, 800 Bytes of space and 400 microseconds of time. When any of the three transactions and space and time resources are consumed over, the quota will be stopped (vote will not be executed in the case of occupying free quota), and the quota will be restored the next day.


## 3.5. Time Resources

The time resource contains the total transaction time cost, typically 800 Bytes per day for free. After the user stakes BTO to space, every vote/cancelvote and any transaction and transaction will consume certain space resources. It should be noted that when the user's space resources are used up, there will be 3 transactions, 800Bytes of space and 400 microseconds of time. When any of the three transactions and space and time resources are exhausted, the quota will be stopped (a vote cannot be executed if only the free quota is left) and the quota will be restored the next day.

&nbsp;



# 4. Developing Guide

## 4.1. Set up Environment 
### 4.1.1. Basic environment preparation

#### 4.1.1.1. Operating System

UBUNTU16.04 LTS (or higher) is recommended

[Set_up_the_Golang_Developping_environment.md](./resource_en/Set_up_the_Golang_Developping_environment.md)

#### 4.1.1.2. Node base version package installation

Enter the following command to install the tool and bottos to specify the release version package.

```
apt-get update && apt-get install -y wget vim
wget https://github.com/bottos-project/bottos/releases/download/tag_bottos3.4/bottos_ubuntu_v3.4.tar.gz
```
Note：
Please focus on https://github.com/bottos-project/bottos/releases information, timely access to the latest version of the package.

Unpack the downloaded version package: 

(After unpack the release package, the folder bottos_v3.4 will be generated in the current directory)
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

Refer to the documentation for a single-node developing environment： [Single node developing environment](./resource_cn/Single_Node_mode_developing_environment.MD)

### 4.1.3. Multi-Nodes developing environment

For multi-nodes developing environment please refer to： [multi-nodes developing environment](./resource_cn/Multi-Nodes_Developping_environment.MD)


## 4.2. Smart Contract
### 4.2.1. Introduction to Smart Contract (also includes the introduction to contract writing rules and ABI)

### 4.2.2. C++ intelligent contract developing example

[Writting Smart Contracts Using C++](./resource_en/Development_and_deployment_of_Smart_Contract(C++_Version).md)

### 4.2.3. JavaScript intelligent contract developing example

[Writting Smart Contracts Using JavaScript](./resource_en/Development_and_deployment_of_Smart_Contract(JavaScript_Version).md)

## 4.3. BCLI Command

[BCLI Specification](./resource_en/BCLI_Specification.md)


## 4.4. DAPP Development

### 4.4.1. JavaScript contract development example

[DApp developing and debugging (JavaScript version)](./resource_en/DApp_developing_and_debugging(Java_Script_Version).md)



## 4.5. Development tools

### 4.5.1. Wallet SDK

[Wallet SDK](https://github.com/bottos-project/bottos-js-crypto) already on Github

### 4.5.2. C++ Smart Contract Development SDK

[C++ Development SDK](https://github.com/bottos-project/contract-tool-cpp) already on Github

### 4.5.3. JavaScript Smart Contract Development SDK

[JavaScript Development SDK](https://github.com/bottos-project/contract-tool-js) already on Github



# 5. Supernode startup guide

## 5.1. Basis of preparation


## 5.2. Safe lifting
[Advanced configuration of production node block signatures](./resource_en/Advanced_configuration_of_production_node_block_signatures.md)



# 6. Resource repository

## 6.1. C++ Contract Development SDK

[C++ Contract Development SDK](https://github.com/bottos-project/contract-tool-cpp) already on Github

## 6.2. JavaScript Contract Development SDK

[JavaScript Contract Development SDK](https://github.com/bottos-project/contract-tool-js) already on Github

## 6.3. Wallet Development SDK

[Wallet SDK](https://github.com/bottos-project/bottos-js-crypto) already on Github

## 6.4. Common REST API

[Common REST API](./resource_en/Common_REST_Interface.md) already on Github

## 6.5. Wallet API

[Wallet REST API](./resource_en/Wallet_REST_Interface.md) already on Github