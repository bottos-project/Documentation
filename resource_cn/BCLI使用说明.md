# BCLI 使用说明

### 一、BCLI工具简述

Bottos BCLI 实现了一组人机交互命令行，主要基于RESTFUL API和链进行交互及实现创建用户，查链，转账，钱包等基于主链的人机交互行功能。

### 二、BCLI工具安装和使用

在BOTTOS代码的BCLI目录下执行go build，编译成功后将会产生bcli可执行文件。


### 三、BCLI命令行说明

全局选项说明

| 全局选项名 | 参数说明            |
| ---------- | :-----------------: |
| --servaddr | 配置全局restful地址 |



全局帮助信息
​    
    ./bcli --help
        
        NAME:
        Bottos bcli tool - a tool that makes user communicate with bottos blockchain
    
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

| 主命令行 | 参数列表    | 参数说明                                                           |
| -------- | :---------: | :----------------------------------------------------------------: |
| ./bcli   | getinfo     | 获取块头信息                                                       |
| ./bcli   | getblock    | 获取指定BLOCK信息                                                  |
| ./bcli   | gettable    | 获取合约表信息                                                     |
| ./bcli   | account     | 创建/获取用户信息，质押/解质押/回收质押等                          |
| ./bcli   | transfer    | BTO转账功能                                                        |
| ./bcli   | transaction | 查询/发起 transaction                                              |
| ./bcli   | contract    | 查询/部署合约和ABI                                                 |
| ./bcli   | p2p         | P2P命令行暂不支持                                                  |
| ./bcli   | delegate    | 注册/解注册生产者，生产者投票/取消投票等                           |
| ./bcli   | wallet      | 钱包创建/锁定/解锁/查询等                                          |
| ./bcli   | genesis     | 创世节点操作相关，设置初始生产者，移交出块权利，取消节点操作权限等 |
| ./bcli   | log         | log 开关，开启Debug log等日志级别                                  |




#### 1. BCLI用户账户功能命令行

用户账户功能命令行主要负责创建新用户，获取指定用户信息，质押和解质押BTO，以及回收质押等。

总体命令行帮助信息

    ./bcli account --help
    
    NAME:
        Bottos bcli tool account - create or get account
    
    USAGE:
        Bottos bcli tool account command [command options] [arguments...]
    
    COMMANDS:
        create   create account
        get      get account info
        stake    stake of account
        unstake  unstake of account
        claim    claim of stake
    
    OPTIONS:
    --help, -h  show help

命令功能说明

| 主命令行       | 参数列表 | 参数说明        |
| -------------- | :------: | :-------------: |
| ./bcli account | create   | 创建新用户      |
| ./bcli account | get      | 获取用户信息    |
| ./bcli account | stake    | 质押BTO         |
| ./bcli account | unstake  | 解质押BTO       |
| ./bcli account | claim    | 回收部分质押BTO |

##### 创建用户命令说明

帮助信息

    ./bcli account create --help
    
    NAME:
        Bottos bcli tool account create - create account
    
    USAGE:
        Bottos bcli tool account create [command options] [arguments...]
    
    OPTIONS:
    --account value   acocunt name
    --pubkey value    account public key
    --referrer value  account referrer


参数说明

|  主命令行  		     | 参数列表    | 参数说明|  必选参数  |
| --------   		    | :-----:      | :----:  | :----:    |
| bcli account create   | --account  | 创建的用户名  |  是       |
|                       | --pubkey    | 新建用户的公钥，不填则使用内置缺省pubkey|  是       |
|                       | --referrer  | 引荐人，不填则使用缺省内置账户进行签名，否则使用引荐人做签名|  是    |

返回信息

该命令成功后将返回BCLI成功发送的Transaction信息，主要内容包含用户名，公钥，发起者及签名（--referrer信息，缺省为内置bottos用户）等。

示例

    ./bcli account create --account user12345678 --pubkey 0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f --referrer bottos

输出结果

Push transaction done for creating account user12345678
Trx: 
{
​    "version": 1,
​    "cursor_num": 139,
​    "cursor_label": 3010882075,
​    "lifetime": 1542956731,
​    "sender": "bottos",
​    "contract": "bottos",
​    "method": "newaccount",
​    "param": {
​        "name": "user12345678",
​        "pubkey": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f"
​    },
​    "param_bin": "dc0002da000c757365723132333435363738da008230343534663163323232336435353361613665653533656131636365613862376266373862386361393966336666363232613362623365363264656463373132303839303333643630393164373732393635343762633037313032326361323833386339653836646563323936363763663734306535633965363534623631323766",
​    "sig_alg": 1,
​    "signature": "faed90881a57b7068c4ed5e4dad6e87706fc6ef6265f18e0a0e10ce5f11c64001e48e6cbce8f423d3f39618686070e1b3f639911a7f063d752f8953cf76ffe6f"
}
TrxHash: 7bdc7aca33233d1ed2407f2d217aa9580f30d2aaf68f60270dd24c934a0a1d29

Please create wallet for your new account.

##### 获取用户信息命令示例

帮助信息

    ./bcli account get --help
    NAME:
        Bottos bcli tool account get - get account information
    
    USAGE:
        Bottos bcli tool account get [command options] [arguments...]
    
    OPTIONS:
        --account value  acocunt name

参数说明

|  主命令行  		     | 参数列表    | 参数说明|  必选参数  |
| --------   		    | :-----:      | :----:  | :----:    |
| bcli account get      | --account  | 用户名  |  是       |

返回信息

该命令成功后将返回用户所持有的BTO及质押和解质押信息。

示例

    ./bcli account get --account bottos

输出结果

    Account: bottos
    Balance: 999770000.00000000 BTO
    Pubkey: 0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f
    
    StakedBalance: 0.00000000 BTO
    UnStakingBalance: 0.00000000 BTO
    StakedSpaceBalance: 0.00000000 BTO
    StakedTimeBalance: 0.00000000 BTO
    UnStakingTimestamp: 0
    
    AvailableSpaceBalance: 0
    UsedSpaceBalance: 0
    AvailableTimeBalance: 0
    UsedTimeBalance: 0
    
    UnClaimedReward: 0.00000000 BTO
    
    Vote: N/A
    
    Contracts: N/A

##### 用户质押BTO命令示例

帮助信息

    ./bcli account stake --h
    NAME:
        Bottos bcli tool account stake - stake of account

    USAGE:
        Bottos bcli tool account stake [command options] [arguments...]

    OPTIONS:
        --account value  acocunt name
        --amount value   amount of bto
        --target value   target of stake:vote,space,time (default: "vote"

参数说明

|  主命令行  		     | 参数列表    | 参数说明|  必选参数  |
| --------   		    | :-----:     | :----:  | :----:    |
| bcli account stake    | --account  | 用户名  |  是        |
|                       | --amount   | 质押BTO个数  |  是        |
|                       | --target   | 资源配置类型：vote,space,time (缺省: "vote"), stake 参数选择  |  否        |

返回信息

该命令成功后将返回BCLI成功发送的Transaction信息。

示例

    ./bcli account stake --account user12345678 --amount 2

输出结果

Push transaction done:
Trx: 
{
​    "version": 1,
​    "cursor_num": 234,
​    "cursor_label": 2675151514,
​    "lifetime": 1542957016,
​    "sender": "user12345678",
​    "contract": "bottos",
​    "method": "stake",
​    "param": {
​        "amount": "2.00000000"
​    },
​    "param_bin": "dc0001c50020000000000000000000000000000000000000000000000000000000000bebc200",
​    "sig_alg": 1,
​    "signature": "43175b7d8b6bcec0c8864588f07da2e1a54bd181bdf91a5582fe42bb09408088300611d39dff061099d5b177a2d9fa2839b97ecc2599864ef31ba1be80c22a09"
}
TrxHash: 2921e27bad80060580d508d2726a830b8a3970b70b56f28e93ae866846cd7296


##### 用户解质押BTO命令示例

帮助信息

    ./bcli account unstake --help
    
    NAME:
        Bottos bcli tool account unstake - unstake of account
    
    USAGE:
        Bottos bcli tool account unstake [command options] [arguments...]
    
    OPTIONS:
        --account value  acocunt name
        --amount value   amount of bto



参数说明

|  主命令行  		     | 参数列表    | 参数说明|  必选参数  |
| --------   		    | :-----:     | :----:  | :----:    |
| bcli account unstake  | --account  | 用户名  |  是        |
|                       | --amount   | 解质押BTO个数  |  是        |


返回信息

该命令成功后将返回BCLI成功发送的Transaction信息。

示例

    ./bcli account unstake --account user12345678 --amount 2

输出结果

Push transaction done:
Trx: 
{
​    "version": 1,
​    "cursor_num": 265,
​    "cursor_label": 510868978,
​    "lifetime": 1542957109,
​    "sender": "user12345678",
​    "contract": "bottos",
​    "method": "unstake",
​    "param": {
​        "amount": "2.00000000"
​    },
​    "param_bin": "dc0001c50020000000000000000000000000000000000000000000000000000000000bebc200",
​    "sig_alg": 1,
​    "signature": "0a48ec205a83dc2fed6c381723fd2a66ab331ef133238f13f061bd8490fd3156055cb5362bd0dc5159ad762c8431118bbc2bf0d811058dd22a9059edd1d2c468"
}
TrxHash: c1e99e03957c8222479513bef9916368754a4549312ef4481bdc687729d7698c

##### 用户回收质押BTO命令示例

帮助信息

    ./bcli account claim --help
    
    NAME:
        Bottos bcli tool account claim - claim of stake
    
    USAGE:
        Bottos bcli tool account claim [command options] [arguments...]
    
    OPTIONS:
        --account value  acocunt name
        --amount value   amount of bto


参数说明

|  主命令行  		     | 参数列表    | 参数说明|  必选参数  |
| --------   		    | :-----:     | :----:  | :----:    |
| bcli account claim    | --account  | 用户名  |  是        |
|                       | --amount   | 回收质押BTO个数  |  是        |

返回信息

该命令成功后将返回BCLI成功发送的Transaction信息。

示例

    ./bcli account claim --account user12345678 --amount 2

输出结果

    Push transaction done:
    Trx: 
    {
        "version": 1,
        "cursor_num": 287,
        "cursor_label": 2457219411,
        "lifetime": 1542957175,
        "sender": "user12345678",
        "contract": "bottos",
        "method": "claim",
        "param": {
            "Amount": "2.00000000"
        },
        "param_bin": "dc0001c50020000000000000000000000000000000000000000000000000000000000bebc200",
        "sig_alg": 1,
        "signature": "cbcd3bed6a6fbae41fcde494e762b7b2a4b23302b3e8d860e19511067d16312120d6e1655f75e4182d06640cb2fc5095e624f4647dc89856a26c1a901d9b9a3f"
    }
    TrxHash: b39e46a180c4d9d465efd77a42e08f9590726d761c70b7ae34c64e3359ab6ce4



#### 2. BCLI 合约功能命令行

BCLI合约功能命令行主要实现用户主动部署一个合约及ABI文件到主链，以及从主链获取合约code（或文件） 文件和ABI（或文件）功能。

总体帮助信息如下

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



命令功能说明

| 主命令行        | 参数列表 | 参数说明                      |
| --------------- | :------: | :---------------------------: |
| ./bcli contract | deploy   | 部署ABI文件以及WASM合约       |
| ./bcli contract | get      | 获取指定合约和ABI信息并存文件 |

##### BCLI 合约部署命令行

帮助信息

    ./bcli contract deploycode --help
    NAME:
        Bottos bcli tool contract deploycode - contract  deploycode
    
    USAGE:
        Bottos bcli tool contract deploycode [command options] [arguments...]
    
    OPTIONS:
        --contract value  the contract's name
        --code value      the contract's wasm file path ( includes wasm file name )
        --filetype value  the contract's file type: wasm or js (default: "wasm")
        --abi value       the contract's abi file path ( includes abi file name )
        --account value   the account name whom deploy the code


参数说明

| 主命令行                 | 参数列表   | 参数说明                  | 必选参数 |
| ------------------------ | :--------: | :-----------------------: | :------: |
| bcli contract deploycode | --contract | 合约名                    | 是       |
|                          | --code     | 合约文件（.WASM）所在路径 | 是       |
|                          | --filetype | 合约文件类型：wasm/js     | 否       |
|                          | --abi      | 合约文件（.abi）          | 是       |
|                          | --account  | 部署合约的账户            | 是       |


返回信息

该命令成功后将返回BCLI成功发送的Transaction信息。

示例

    ./bcli contract deploy --account tina123456789 --code testvm1/testVM1.wasm --abi testvm1/testVM1.abi --contract testvm1

输出结果
​     
​    

    Push transaction done for deploying contract user12345678
    Trx: 
    {
        "version": 197632,
        "cursor_num": 467,
        "cursor_label": 2953320580,
        "lifetime": 1542957715,
        "sender": "tina123456789",
        "contract": "bottos",
        "method": "deploycontract",
        "param": {
            "name": "testvm1",
            "vm_type": 1,
            "vm_version": 1,
            "contract_code": "0061736d01000000013d0960027f7f0060067f7f7f7f7f7f017f60027f7f017f60087f7f7f7f7f7f7f7f017f60037f7f7f017f6000006000017f60017f017f60047f7f7f7f017f025f0603656e760b67657442696e56616c7565000303656e760a676574..."
        },
        "param_bin": "dc0004da000c757365723132333435363738cc01cc01c514320061736d01000000013d0960027f7f0060067f7f7f7f7f7f017f60027f7f017f60087f7f7f7f7f7f7f7f017f60037f7f7f017f6000006000017f60017f017f60047f7f7f7f017f025f0603...",
        "sig_alg": 1,
        "signature": "345d5fede2a45b27713ee961ef3287c35bf438d11711faf9c169cf41813b28963c74e23296f0065f491cad6b816e07e15ccba07896b316813ec266561ede22d6"
    }
    TrxHash: 596441807df736fc15ae32a59a38bc9324620ca2945a0633c033e7d0370e3638

注：
​    BOTTOS ABI 文件是对合约一些方法所需的接口和结构以及参数的信息描述，例如本例中try.abi文件内容如下。
​    

    "structs" 代表本合约所有方法需要使用到的所有结构体定义；
    "actions" 代表本合约所有合约支持的所有合约方法名以及所需的对应结构名
    "tables" 代表查询合约被调用后（生效后）合约信息会写入链上，tables代表查询链上的某条信息所需要的入参，包含关键字和所对应的结构信息。
    
    具体示例如下。
    
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



##### BCLI获取合约CODE文件和ABI文件

帮助信息

    ./bcli contract get --help
    NAME:
        Bottos bcli tool contract get - get contract
    
    USAGE:
        Bottos bcli tool contract get [command options] [arguments...]
    
    OPTIONS:
        --account value  we use the account name as the default contract name
        --code value     the contract's wasm file path ( includes wasm file name )
        --abi value      the contract's abi file path ( includes abi file name )

参数说明

| 主命令行          | 参数列表  | 参数说明                        | 必选参数 |
| ----------------- | :-------: | :-----------------------------: | :------: |
| bcli contract get | --account | 合约账户名                      | 是       |
|                   | --code    | 要保存的合约路径名              | 是       |
|                   | --abi     | 要保存的abi描述文件（.abi）路径 | 是       |


返回信息

该命令成功后将返回合约文件码流和ABI文件信息，以及保存对应内容到目的合约文件路径及ABI文件路径。

示例

    ./bcli contract get --account user12345678 --code ~/test.wasm --abi ~/test.abi

输出结果

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


##### BCLI获取合约TABLE信息

帮助信息

    ./bcli gettable --help
    NAME:
    bcli gettable - get table info
    
    USAGE:
        bcli gettable [command options] [arguments...]
    
    OPTIONS:
        --account value  contract name (default: "usermng")
        --table value     table name
        --key value       Key value


参数说明

| 主命令行      | 参数列表  | 参数说明                                          | 必选参数 |
| ------------- | :-------: | :-----------------------------------------------: | :------: |
| bcli gettable | --account | 合约账户名                                        | 是       |
|               | --table   | 要向链上查询的TABLE名   （参考ABI文件TABLE描述）  | 是       |
|               | --key     | 要向链上查询的key关键字值（参考ABI文件TABLE描述） | 是       |

返回信息

该命令成功后将返回BCLI发送的Transaction信息。

示例

./bcli gettable --table userdetail --account lyp12345678 --key lyp

输出结果

{
​    "contract": "lyp12345678",
​    "object": "userdetail",
​    "key": "lyp",
​    "value": "dc0003da00036c7970cf0000000000000016c5001000000000000000000000000000000021"
}

Table data is : map[lyp:33 userrole:lyp rcvhellonum:22] 



#### 3. BCLI 候选节点选举功能命令行

BCLI候选节点功能选举命令行主线实现候选节点之：注册节点为生产节点，解注册生产节点，列举所有（部分）生产节点信息，投票（投某节点成为生产节点），取消投票等。

总体帮助信息如下

    ./bcli delegate --help
    NAME:
        Bottos bcli tool delegate - for delegate operations
    
    USAGE:
        Bottos bcli tool delegate command [command options] [arguments...]
    
    COMMANDS:
        reg         reg delegate
        unreg       unreg delegate
        list        list delegates
        vote        Vote for producers
        cancelvote  cancel vote for producers
    
    OPTIONS:
        --help, -h  show help


命令功能说明

| 主命令行        | 参数列表   | 参数说明       |
| --------------- | :--------: | :------------: |
| ./bcli delegate | reg        | 注册为生产者   |
| ./bcli delegate | unreg      | 解注册生产者   |
| ./bcli delegate | list       | 查看生产者列表 |
| ./bcli delegate | vote       | 选举生产者     |
| ./bcli delegate | cancelvote | 取消选举       |


##### BCLI注册生产节点命令行

帮助信息

    ./bcli delegate reg --help
    NAME:
    Bottos bcli tool delegate reg - reg delegate
    
    USAGE:
        Bottos bcli tool delegate reg [command options] [arguments...]
    
    OPTIONS:
        --account value      account name
        --signkey value      public sign key (default: "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f")
        --location value     location
        --description value  description


参数说明

| 主命令行          | 参数列表      | 参数说明                           | 必选参数 |
| ----------------- | :-----------: | :--------------------------------: | :------: |
| bcli delegate reg | --account     | 用户名                             | 是       |
|                   | --signkey     | 用户自定义公钥（缺省为内置缺省值） | 是       |
|                   | --location    | 投票地理城市名                     | 否       |
|                   | --description | 用户自定义描述                     | 否       |

返回信息

该命令成功后将返回BCLI发送的Transaction信息。

示例

    ./bcli delegate reg --account user12345678 --location "SHANGHAI" --description "Reg user12345678 as a producer" --signkey 0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f

输出结果

    Push transaction done:
    Trx: 
    {
        "version": 1,
        "cursor_num": 777,
        "cursor_label": 2376139732,
        "lifetime": 1542958645,
        "sender": "user12345678",
        "contract": "bottos",
        "method": "regdelegate",
        "param": {
            "name": "user12345678",
            "pubkey": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
            "location": "SHANGHAI",
            "description": "Reg user12345678 as a producer"
        },
        "param_bin": "dc0004da000c757365723132333435363738da008230343534663163323232336435353361613665653533656131636365613862376266373862386361393966336666363232613362623365363264656463373132303839303333643630393164373732393635343762633037313032326361323833386339653836646563323936363763663734306535633965363534623631323766da00085348414e47484149da0015526567206c797020617320612070726f6475636572",
        "sig_alg": 1,
        "signature": "10cc7d00a994fc566db1b48582a75f877c89a12e12e8609e0fe9e26dd2ea3bf02b70aeec871c1df5fe61f70e7f278fd539436eb28d870bd057b3ac0ac8f863e3"
    }
    TrxHash: 53e25c2b281251e44bf24e2f552b101daf60399b7a44adcc9810fd10908ff23e

注：
此命令执行前提：创世节点必须成功移交出块权利。
参考命令./bcli genesis blkprodtrans --sender user12345678 --actblknum 10

##### BCLI解注册生产节点命令行

帮助信息

    ./bcli  delegate unreg  --help
    
    NAME:
        Bottos bcli tool delegate unreg - unreg delegate
    
    USAGE:
        Bottos bcli tool delegate unreg [command options] [arguments...]
    
    OPTIONS:
        --account value  account


参数说明

| 主命令行            | 参数列表  | 参数说明 | 必选参数 |
| ------------------- | :-------: | :------: | :------: |
| bcli delegate unreg | --account | 用户名   | 是       |


返回信息

该命令成功后将返回BCLI发送的Transaction信息。

示例

    ./bcli delegate unreg --account user12345678

输出结果

    Push transaction done:
    Trx: 
    {
        "version": 1,
        "cursor_num": 823,
        "cursor_label": 1889557398,
        "lifetime": 1542958783,
        "sender": "user12345678",
        "contract": "bottos",
        "method": "unregdelegate",
        "param": {
            "name": "user12345678"
        },
        "param_bin": "dc0001da000c757365723132333435363738",
        "sig_alg": 1,
        "signature": "e34d3cffa5a00d6014dd7bdc3550e8cfec5cc5aebe02563634a0ebfd53292b007c230c6245ebfaf9e56a72708f5403ab09d9ff3b6d4912a71c7f6006fc8efd3f"
    }
    TrxHash: 3ff592e51ff483d7a6409aab2f54b52d7bd721ce009b73ac59544443074d8802

##### BCLI列举当前生产节点列表

帮助信息

    ./bcli delegate list --help
    NAME:
    Bottos bcli tool delegate list - list delegates
    
    USAGE:
        Bottos bcli tool delegate list [command options] [arguments...]
    
    OPTIONS:
        --limit value  (default: 100)
        --start value  (default: 0)


参数说明

| 主命令行           | 参数列表 | 参数说明                   | 必选参数 |
| ------------------ | :------: | :------------------------: | :------: |
| bcli delegate list | --limit  | 输出前N条记录              | 否       |
|                    | --limit  | 从第几条开始输出和统计条数 | 否       |


返回信息

该命令成功后将返回BCLI发送的Transaction信息。

示例

    ./bcli delegate list

输出结果

    [
        {
            "account_name": "adhil11111",
            "active": false,
            "desc": "",
            "last_confirmed_block_num": 6358,
            "last_slot": 1147647,
            "location": "",
            "report_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
            "total_missed": 0
        },
        {
            "account_name": "albireo2222",
            "active": false,
            "desc": "",
            "last_confirmed_block_num": 6377,
            "last_slot": 1147667,
            "location": "",
            "report_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
            "total_missed": 0
        },
        .....
        ....
        .... (略)


##### BCLI生产者投票命令行

帮助信息

    ./bcli delegate vote --help
    NAME:
    Bottos bcli tool delegate vote - Vote for producers
    
    USAGE:
        Bottos bcli tool delegate vote [command options] [arguments...]
    
    OPTIONS:
        --voter value     voter account
        --delegate value  delegate account


参数说明

| 主命令行           | 参数列表   | 参数说明                                             | 必选参数 |
| ------------------ | :--------: | :--------------------------------------------------: | :------: |
| bcli delegate vote | --voter    | 投票者                                               | 是       |
|                    | --delegate | 要投给哪个生产节点（必须投给已注册为生产节点的节点） | 是       |

返回信息

该命令成功后将返回BCLI发送的Transaction信息。

示例

    ./bcli delegate vote --voter bottos --delegate user12345678

输出结果

    Push transaction done:
    Trx: 
    {
        "version": 1,
        "cursor_num": 868,
        "cursor_label": 4033954626,
        "lifetime": 1542958918,
        "sender": "bottos",
        "contract": "bottos",
        "method": "votedelegate",
        "param": {
            "voteop": 1,
            "voter": "bottos",
            "delegate": "user12345678"
        },
        "param_bin": "dc0003cc01da0006626f74746f73da000c757365723132333435363738",
        "sig_alg": 1,
        "signature": "ef3d453cec3c0d23386dcb098118dbd7d5da07e444201a4c25fd2da999c14dd9610fe7a8cf8cbbc6acf3a5f12ad83f4e96e1f21ef53ce8a91861c30dc3aec286"
    }
    TrxHash: bb6dde5aba1db736495e864a4fa085640cbeb7d88aef11958f764a1423ba3f90

##### BCLI生产者取消投票命令行

帮助信息

    ./bcli delegate cancelvote --help
    NAME:
    Bottos bcli tool delegate cancelvote - cancel vote for producers
    
    USAGE:
        Bottos bcli tool delegate cancelvote [command options] [arguments...]
    
    OPTIONS:
        --voter value     voter account
        --delegate value  delegate account


参数说明

| 主命令行                 | 参数列表   | 参数说明                                               | 必选参数 |
| ------------------------ | :--------: | :----------------------------------------------------: | :------: |
| bcli delegate cancelvote | --voter    | 投票者                                                 | 是       |
|                          | --delegate | 要取消投给哪个生产节点（必须填写注册为生产节点的节点） | 是       |

返回信息

该命令成功后将返回BCLI发送的Transaction信息。

示例

    ./bcli delegate cancelvote --voter bottos --delegate user12345678

输出结果

    Push transaction done:
    Trx: 
    {
        "version": 1,
        "cursor_num": 889,
        "cursor_label": 3870258141,
        "lifetime": 1542958981,
        "sender": "bottos",
        "contract": "bottos",
        "method": "votedelegate",
        "param": {
            "voteop": 0,
            "voter": "bottos",
            "delegate": "user12345678"
        },
        "param_bin": "dc0003cc00da0006626f74746f73da000c757365723132333435363738",
        "sig_alg": 1,
        "signature": "6556f31964e9b9499024de66535fe7bc36a56cf4c26bea7e7353984be2857efe47eb0baa135cb6c8adda0af10b7f3904da41ba0aad92274023acc942e944a79d"
    }
    TrxHash: 86a503abd101f3473d5e121fa3e7665ff0f274fc5739ea649bf070177ffb2091

#### 4. BCLI 块信息获取命令行

BCLI块信息获取主要包括： 获取当前块信息，块头信息。

##### BCLI块头信息获取命令行

帮助信息

    ./bcli getinfo --help
    NAME:
        bcli getinfo - get chian info
    
    USAGE:
        bcli getinfo [arguments...]


参数说明

| 主命令行       | 参数列表 | 参数说明 | 必选参数 |
| -------------- | :------: | :------: | :------: |
| ./bcli getinfo | (无)     | (无)     | (无)     |
|                | (无)     | (无)     | (无)     |


返回信息

该命令成功后将返回实时最新块头信息。

示例

    ./bcli getinfo

输出结果

    ==Chain Info==
    
    {
        "head_block_num": 7047,
        "head_block_hash": "34460313889fc988137e42394009df8880e5e82118fcae4579fc0e33d913309e",
        "head_block_time": 1536569883,
        "head_block_delegate": "sulafat",
        "cursor_label": 3641913502,
        "last_consensus_block_num": 7026,
        "chain_id": "5c7c2ea85df042747b38b183c84c8313b499177ed4abbf29d0947f4908934941"
    }

##### BCLI最新块信息获取命令行

帮助信息

    ./bcli getblock --help
    NAME:
        bcli getblock - get block info
    
    USAGE:
        bcli getblock [command options] [arguments...]
    
    OPTIONS:
        --num value   get block by number (default: 100)
        --hash value  get block by hash

参数说明

| 主命令行        | 参数列表 | 参数说明 | 必选参数 |
| --------------- | :------: | :------: | :------: |
| ./bcli getblock | (无)     | (无)     | (无)     |
|                 | (无)     | (无)     | (无)     |


返回信息

    该命令成功后将返回实时最新块信息。

示例

    ./bcli getblock
    
    输出结果
    
    ==Block Info==
    
    {
        "prev_block_hash": "6de5f9fb40511d307a55f5838e936a4d8c211177a0750287010bc7e67935954f",
        "block_num": 100,
        "block_hash": "e97df19ae9b73ba46b5f5681b159f87a56a4aa8426dc0407f6ea4ed12fb1857d",
        "cursor_block_label": 800163197,
        "block_time": 1536548940,
        "trx_merkle_root": "0000000000000000000000000000000000000000000000000000000000000000",
        "delegate": "vega1111111",
        "delegate_sign": "fa3504d657168fb9b16ae9ee3d281ead80adb43fbb3859213198f856732b12c33459b2ff820af6fdf15c9dce7dde9a29fe0446a09568b1a34a3909cd64a73815",
        "trxs": null
    }


#### 5. BCLI 创世节点功能命令行

BCLI创世节点功能命令行主要包括： 添加初始生产者， 移交出块权利，撤销创世节点特权操作权限。

总体帮助信息如下

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


命令功能说明

| 主命令行       | 参数列表        | 参数说明                     |
| -------------- | :-------------: | :--------------------------: |
| ./bcli genesis | setdelegate     | 创世节点上指定初始生产者     |
| ./bcli genesis | blkprodtrans    | 创世节点移交出块权利         |
| ./bcli genesis | cancelprevilige | 创世节点取消操作权限         |
| ./bcli genesis | unsetdelegate   | 创世节点上取消指定初始生产者 |
| ./bcli genesis | settransitvote  | 过渡期为生产者节点投票       |
| ./bcli genesis | newstkaccount   |                              |



##### BCLI创世节点添加初始生产者功能命令行

帮助信息

    ./bcli genesis setdelegate --help
    NAME:
    Bottos bcli tool genesis setdelegate - set delegate
    
    USAGE:
        Bottos bcli tool genesis setdelegate [command options] [arguments...]
    
    OPTIONS:
        --sender value       sender account
        --account value      account name
        --signkey value      public sign key (default: "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f")
        --location value     location
        --description value  description

参数说明

| 主命令行                   | 参数列表      | 参数说明                                               | 必选参数 |
| -------------------------- | :-----------: | :----------------------------------------------------: | :------: |
| ./bcli genesis setdelegate | --sender      | 发起签名者（必须为已注册用户名，缺省为内置bottos用户） | 否       |
|                            | --account     | 要被添加的初始生产者用户名                             | 是       |
|                            | --signkey     | 用户的公钥                                             | 是       |
|                            | --location    | 用户指定的城市名                                       | 否       |
|                            | --description | 用户指定的描述                                         | 否       |

返回信息

该命令成功后将返回BCLI提交的Transaction信息。

示例

    ./bcli genesis setdelegate --sender bottos --account user12345678 --signkey 0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f

输出结果

    Push transaction done:
    Trx: 
    {
        "version": 1,
        "cursor_num": 917,
        "cursor_label": 2298802669,
        "lifetime": 1542959065,
        "sender": "bottos",
        "contract": "bottos",
        "method": "setdelegate",
        "param": {
            "name": "user12345678",
            "pubkey": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
            "location": "",
            "description": ""
        },
        "param_bin": "dc0004da000c757365723132333435363738da008230343534663163323232336435353361613665653533656131636365613862376266373862386361393966336666363232613362623365363264656463373132303839303333643630393164373732393635343762633037313032326361323833386339653836646563323936363763663734306535633965363534623631323766da0000da0000",
        "sig_alg": 1,
        "signature": "3b8273581b51f3b0a14eaa3a85d7635502573250bac1c2cb20b152e841a92cac2f566bf14052ddc7d2a12ac610f423322d5a01adac644d7f235a97d19ab25fb0"
    }
    TrxHash: e453df77a6f1a2049e79dd9853e8f16945968ffe8e3c168e5fe29788fb8dc898



##### BCLI创世节点移交出块权利功能命令行

帮助信息

    ./bcli genesis blkprodtrans --help
    NAME:
    Bottos bcli tool genesis blkprodtrans - for genesis node transfering the permission of producing blocks
    
    USAGE:
        Bottos bcli tool genesis blkprodtrans [command options] [arguments...]
    
    OPTIONS:
        --sender value     sender account
        --actblknum value  the threshold number of active block for which genesis node transfering the permission of producing blocks after exceeding it (default: 0)


参数说明

| 主命令行                    | 参数列表 | 参数说明                                               | 必选参数 |
| --------------------------- | :------: | :----------------------------------------------------: | :------: |
| ./bcli genesis blkprodtrans | --sender | 发起签名者（必须为已注册用户名，缺省为内置bottos用户） | 否       |


返回信息

该命令成功后将返回BCLI提交的Transaction信息。

示例

     ./bcli genesis blkprodtrans --sender bottos --actblknum 2000

输出结果

    ./bcli genesis blkprodtrans --sender bottos --actblknum 2000
    
    Push transaction done:
    Trx: 
    {
        "version": 1,
        "cursor_num": 35,
        "cursor_label": 3383839142,
        "lifetime": 1542961120,
        "sender": "bottos",
        "contract": "bottos",
        "method": "blkprodtrans",
        "param": {
            "actblknum": 2000
        },
        "param_bin": "dc0001cf00000000000007d0",
        "sig_alg": 1,
        "signature": "07cfe2ba53d8f9f2da43956e49f05a48dbb11bb5040a11b6135f129ec7f978f942faecb4891889a0089f0c033f3a0988474b995a5c79eb0b2d3b34cff3ea3ad9"
    }
    TrxHash: 29267535acadefb100113915652a4ba9d9b00dafbefbe61bc9f1f5fdd24249c0



##### BCLI撤销创世节点特权操作权限功能命令行

帮助信息

    ./bcli genesis cancelprevilige --help
    NAME:
    Bottos bcli tool genesis cancelprevilige - cancel genesis node permission
    
    USAGE:
        Bottos bcli tool genesis cancelprevilige [command options] [arguments...]
    
    OPTIONS:
        --sender value  sender account


参数说明

| 主命令行                       | 参数列表 | 参数说明                                               | 必选参数 |
| ------------------------------ | :------: | :----------------------------------------------------: | :------: |
| ./bcli genesis cancelprevilige | --sender | 发起签名者（必须为已注册用户名，缺省为内置bottos用户） | 否       |

返回信息

该命令成功后将返回BCLI提交的Transaction信息。

示例

    ./bcli genesis cancelprevilige --sender bottos

输出结果

    Push transaction done:
    Trx: 
    {
        "version": 1,
        "cursor_num": 48,
        "cursor_label": 2570198302,
        "lifetime": 1542961159,
        "sender": "bottos",
        "contract": "bottos",
        "method": "cancelgsperm",
        "param": "",
        "param_bin": "",
        "sig_alg": 1,
        "signature": "03a29fe460d6e74a718d0c352caf24788afda6bdfada63ffd717af3fe41adca145dc0a1bce349872d7a06951e8e4308449b694de1632ca253e201da31792cccb"
    }
    TrxHash: 42e93f4a6f3a631d469449e418a624ede196b2e4d096b29bd1ccaaca1e83ee10

##### BCLI创世节点上取消指定初始生产者

帮助信息

    ./bcli genesis unsetdelegate --h
    NAME:
        Bottos bcli tool genesis unsetdelegate - unset delegate
    
    USAGE:
        Bottos bcli tool genesis unsetdelegate [command options] [arguments...]
    
    OPTIONS:
        --sender value   sender account
        --account value  account name


参数说明

| 主命令行                     | 参数列表  | 参数说明                 | 必选参数 |
| ---------------------------- | :-------: | :----------------------: | :------: |
| ./bcli genesis unsetdelegate | --sender  | sender需要指定bottos     | 是       |
| ./bcli genesis unsetdelegate | --account | 之前被投过票的某个生产者 | 是       |

返回信息

该命令成功后将返回BCLI提交的Transaction信息。

示例

./bcli genesis unsetdelegate --sender bottos --account lyp12345678

输出结果

Push transaction done:
Trx: 
{
​    "version": 197632,
​    "cursor_num": 1150,
​    "cursor_label": 1151977351,
​    "lifetime": 1545210346,
​    "sender": "bottos",
​    "contract": "bottos",
​    "method": "unsetdelegate",
​    "param": {
​        "name": "lyp12345678"
​    },
​    "param_bin": "dc0001da000b6c79703132333435363738",
​    "sig_alg": 1,
​    "signature": "c909e76c9c4176fc487e6054537a7e077930b3d3ce15718b83306f1a6763e6365fe71d9516abc85917c091cd2925eb9910f6b1afd0b5795e0564bae9c2279672"
}
TrxHash: 602ceed3970de1948a3a0d76ee8e5b82dc29a7ec741d576327938d883d06cc18

##### BCLI创世节点上过渡期为生产者投票

帮助信息

    ./bcli genesis settransitvote --h
    NAME:
        Bottos bcli tool genesis settransitvote - set transit vote
    
    USAGE:
        Bottos bcli tool genesis settransitvote [command options] [arguments...]
    
    OPTIONS:
        --sender value   sender account
        --account value  account name
        --vote value     election votes (default: 0)

参数说明

| 主命令行                      | 参数列表  | 参数说明             | 必选参数 |
| ----------------------------- | :-------: | :------------------: | :------: |
| ./bcli genesis settransitvote | --sender  | sender需要指定bottos | 是       |
| ./bcli genesis settransitvote | --account | 投票给某个生产者名   | 是       |
| ./bcli genesis settransitvote | --vote    | 投票数量             | 是       |

返回信息

该命令成功后将返回BCLI提交的Transaction信息。

示例
./bcli genesis settransitvote --sender bottos --account lyp12345678 --vote 100

输出结果

Push transaction done:
Trx: 
{
​    "version": 197632,
​    "cursor_num": 1202,
​    "cursor_label": 4128090569,
​    "lifetime": 1545210505,
​    "sender": "bottos",
​    "contract": "bottos",
​    "method": "settransitvote",
​    "param": {
​        "name": "lyp12345678",
​        "vote": 100
​    },
​    "param_bin": "dc0002da000b6c79703132333435363738cf0000000000000064",
​    "sig_alg": 1,
​    "signature": "f8d84ac9485044ead68a7d32cc902a757b7422b1a626ced59faa0f210edcb5e76f4ef87281f2a43f6cbd861adf8ff3b6cd31371ec26cf7f50c557ff4a62a1929"
}
TrxHash: 545d8ce9032756dd9305fd2ce14cce5c18aaa39f94eff1791fbc1fe41bf9e4a0

#### 6. BCLI 转账功能命令行

BCLI转账功能负责由FROM用户向TO用户进行BTO转账。

##### BCLI转账命令行

帮助信息

    ./bcli transfer --help
    NAME:
    bcli transfer - for user transfering bto
    
    USAGE:
        bcli transfer [command options] [arguments...]
    
    OPTIONS:
        --from value    the from user account (default: "bottos")
        --to value      the [to] user account (default: "bottos")
        --amount value  the amount of bto (default: "0")


参数说明

| 主命令行        | 参数列表 | 参数说明    | 必选参数 |
| --------------- | :------: | :---------: | :------: |
| ./bcli transfer | --from   | 转账者      | 否       |
|                 | --to     | 转账目的人  | 否       |
|                 | --amount | 转账BTO个数 | 否       |

返回信息

该命令成功后将返回BCLI提交的Transaction信息。

示例

    ./bcli transfer --from bottos --to user12345678 --amount 2

输出结果

    Push transaction done
    From: bottos
    To: bottos
    Amount: 2.00000000
    Memo: 
Trx: 
{
​    "version": 1,
​    "cursor_num": 971,
​    "cursor_label": 4055218391,
​    "lifetime": 1542966310,
​    "sender": "bottos",
​    "contract": "bottos",
​    "method": "transfer",
​    "param": {
​        "from": "bottos",
​        "to": "user12345678",
​        "value": "2.00000000",
​        "memo": ""
​    },
​    "param_bin": "dc0004da0006626f74746f73da0006626f74746f73c50020000000000000000000000000000000000000000000000000000000000bebc200da0000",
​    "sig_alg": 1,
​    "signature": "8b883beaa3f7f6980d0d432264aaa77c4a7f22fca6c26dda0c53de649f379ab3629af968c117562361bb7d1b4495a9b5068919e6a9b0b3538fe96372521054dd"
}

#### 7. BCLI Transaction 提交和查询命令行

BCLI Transaction 提交和查询命令行负责提交一个用户自定义的Transaction到链上，或根据TrxHash值查询一个已存在的合约信息。

总体帮助信息如下

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


命令功能说明

| 主命令行           | 参数列表 | 参数说明                             |
| ------------------ | :------: | :----------------------------------: |
| ./bcli transaction | get      | 获取指定TRXHASH对应的transaction信息 |
| ./bcli transaction | push     | 提交一个Transaction                  |


##### BCLI Transaction查询命令行

帮助信息

    ./bcli transaction get --help
    
    NAME:
        Bottos bcli tool transaction get - get tx details
    
    USAGE:
        Bottos bcli tool transaction get [command options] [arguments...]
    
    OPTIONS:
        --trxhash value 

参数说明

| 主命令行               | 参数列表  | 参数说明               | 必选参数 |
| ---------------------- | :-------: | :--------------------: | :------: |
| ./bcli transaction get | --trxhash | Transaction hash索引值 | 是       |

返回信息

该命令成功后将返回指定Trxhash对应的Transaction信息。

示例

    ./bcli transaction get --trxhash 86cbc8bd54d85fc817f3675103e62c5693fe7ef1520f2218f57c6406be05b46b

输出结果

    {
        "contract": "bottos",
        "cursor_label": 117036287,
        "cursor_num": 7762,
        "lifetime": 1536572206,
        "method": "transfer",
        "param": null,
        "sender": "bottos",
        "sig_alg": 1,
        "signature": "3aa45652b368827fd5480721de1588ed08c2289de2cfa97ce352d65c8f1acc6e4f04b2c8492caacedb61097dea2728019d4c40c932d763ed7e26d051ca27a188",
        "version": 1
    }
    
    <<<Transaction Status>>> : commited

##### BCLI Transaction提交命令行

帮助信息

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


参数说明

| 主命令行                | 参数列表   | 参数说明                           | 必选参数 |
| ----------------------- | :--------: | :--------------------------------: | :------: |
| ./bcli transaction push | --sender   | 签名发起者（缺省为内置bottos用户） | 否       |
| ./bcli transaction push | --contract | 合约名                             | 是       |
| ./bcli transaction push | --method   | 合约方法名                         | 是       |
| ./bcli transaction push | --param    | 参数键值对                         | 是       |
| ./bcli transaction push | --sign     | 用户自定义公钥（缺省为内置缺省值） | 否       |

返回信息

该命令成功后将返回指定Trxhash对应的Transaction信息。

示例

./bcli transaction push --sender lyp12345678 --contract lyp12345678 --method reguser --param

输出结果

"userName:lyp, userRole:lyp, rcvHelloNum:22, lyp:33"
0 : {userName string} , KEY:  userName , VAL:  lyp
1 : {userRole string} , KEY:  userRole , VAL:  lyp
2 : {rcvHelloNum uint64} , KEY:  rcvHelloNum , VAL:  22
3 : {lyp uint128} , KEY:  lyp , VAL:  33

Push transaction done:
Trx: 
{
​    "version": 1,
​    "cursor_num": 2844,
​    "cursor_label": 1803934300,
​    "lifetime": 1543468945,
​    "sender": "lyp12345678",
​    "contract": "lyp12345678",
​    "method": "reguser",
​    "param": "dc0004da00036c7970da00036c7970cf0000000000000016c5001000000000000000000000000000000021",
​    "param_bin": "dc0004da00036c7970da00036c7970cf0000000000000016c5001000000000000000000000000000000021",
​    "sig_alg": 1,
​    "signature": "984d8b69595e6311ddbfa6214a0610ab13d79839427c441f54073d3aff9b7c27366f6c48508921a3d1c7535d5174134c201daaf4f5ea5f8e578ef804f7737305"
}
TrxHash: cb9a695f9f8dfa02e81caf58fc9def571d892b95fd168a9c2f7eb701ee802ed3


#### 8. BCLI钱包命令行

钱包功能主要为用户提交Transaction提供钱包创建，绑定用户，解锁钱包，锁定钱包，查询钱包等功能。

帮助信息

    ./bcli wallet --help
    
    NAME:
    Bottos bcli tool wallet - For wallet operations
    
    USAGE:
    Bottos bcli tool wallet command [command options] [arguments...]
    
    COMMANDS:
        generatekey  generate key pairs
        create       create wallet
        lock         lock wallet
        unlock       unlock wallet
        list         list wallet


​    
    OPTIONS:
    --help, -h  show help


命令功能说明

| 主命令行      | 参数列表    | 参数说明           |
| ------------- | :---------: | :----------------: |
| ./bcli wallet | generatekey | 创建一对新公私钥对 |
| ./bcli wallet | create      | 创建钱包           |
| ./bcli wallet | lock        | 锁定钱包           |
| ./bcli wallet | unlock      | 解锁钱包           |
| ./bcli wallet | list        | 列出所有钱包       |

##### BCLI 创建钱包公私钥命令行

帮助信息
./bcli wallet generatekey --help

    NAME:
        Bottos bcli tool wallet generatekey - generate key pairs
    
    USAGE:
        Bottos bcli tool wallet generatekey [arguments...]


参数说明

| 主命令行                  | 参数列表 | 参数说明 | 必选参数 |
| ------------------------- | :------: | :------: | :------: |
| ./bcli wallet generatekey | (无)     | （无）   | （无）   |

返回信息

该命令成功后将返回一对新生成的公私钥对。

示例

     ./bcli wallet generatekey

输出结果
{
​    "private_key": "b8b890ebc315a8e1c3a6f7b78977d68ca1e9274c986314ccbe967b964cf68b66",
​    "public_key": "0485fccecf8c8e6260d8558e1a61adca3a888127e34ba0d052dfeb1c31d419bf0494482e7e8a447d63394cff713fc00aa8e64c24b73a8173661a91884b71407bce"
}

##### BCLI 创建钱包命令行

帮助信息

    ./bcli wallet create --help
    
    NAME:
    Bottos bcli tool wallet create - create wallet
    
    USAGE:
    Bottos bcli tool wallet create [command options] [arguments...]
    
    OPTIONS:
    --account value  account name


参数说明

| 主命令行             | 参数列表  | 参数说明         | 必选参数 |
| -------------------- | :-------: | :--------------: | :------: |
| ./bcli wallet create | --account | 钱包绑定的用户名 | 是       |

返回信息

该命令成功后将返回用户的钱包文件keystore信息，路径位于/home/bottos/bot下， 文件格式为 用户.keystore 文件。

示例

     ./bcli wallet create --account user12345678

输出结果

Please input your password for your wallet: 

Please input your private key for your wallet: 

{
​    "wallet_name": "user12345678.keystore"
}

注：
本例中需要用户手工输入钱包密码和使用的私钥。

##### BCLI 锁定钱包命令行

帮助信息

    ./bcli wallet lock --help
    
    NAME:
    Bottos bcli tool wallet lock - lock wallet
    
    USAGE:
    Bottos bcli tool wallet lock [command options] [arguments...]
    
    OPTIONS:
    --account value  account name
    --type value     type of restful for wallet [ normal | delegate ] (default: "normal")


参数说明

| 主命令行           | 参数列表  | 参数说明                       | 必选参数 |
| ------------------ | :-------: | :----------------------------: | :------: |
| ./bcli wallet lock | --account | 钱包绑定的用户名               | 是       |
| ./bcli wallet lock | --type    | normal 或 delegate方式创建钱包 | 否       |

返回信息

该命令成功后将返回钱包锁定状态标志。

示例

./bcli wallet lock --account user12345678

输出结果

./bcli wallet lock --account user12345678
{
​    "lock": true
}

##### BCLI 解锁钱包命令行

帮助信息
​    
    ./bcli wallet unlock --help
    
    NAME:
    Bottos bcli tool wallet unlock - unlock wallet
    
    USAGE:
    Bottos bcli tool wallet unlock [command options] [arguments...]
    
    OPTIONS:
    --account value  account name
    --type value     type of restful for wallet [ normal | delegate ] (default: "normal")

参数说明

| 主命令行             | 参数列表  | 参数说明                       | 必选参数 |
| -------------------- | :-------: | :----------------------------: | :------: |
| ./bcli wallet unlock | --account | 钱包绑定的用户名               | 是       |
| ./bcli wallet unlock | --type    | normal 或 delegate方式创建钱包 | 否       |

返回信息

该命令成功后将返回钱包锁定状态标志。

示例

     ./bcli wallet unlock --account user12345678

输出结果

    Please input your password for your wallet: 
    
    {
        "unlock": true
    }

注：
本例要求用户输入当时创建钱包时的密码。


##### BCLI 查看所有钱包命令行

帮助信息
​    
    ./bcli wallet list --help
    
    NAME:
    Bottos bcli tool wallet list - list wallet
    
    USAGE:
    Bottos bcli tool wallet list [arguments...]

参数说明

| 主命令行           | 参数列表 | 参数说明 | 必选参数 |
| ------------------ | :------: | :------: | :------: |
| ./bcli wallet list | (无)     | （无）   | （无）   |

返回信息

该命令成功后将返回钱包锁定状态标志。

示例

     ./bcli wallet list

输出结果

    [
        {
            "account_name": "user12345678",
            "public_key": "0454f1c2223d553aa6ee53ea1ccea8b7bf78b8ca99f3ff622a3bb3e62dedc712089033d6091d77296547bc071022ca2838c9e86dec29667cf740e5c9e654b6127f",
            "wallet_path": "/home/bottos/bot/user12345678.keystore"
        }
    ]

##### BCLI 日志功能命令行

帮助信息

./bcli log setconfigitem --h
NAME:
   Bottos bcli tool log - for log operations

USAGE:
   Bottos bcli tool log command [command options] [arguments...]

COMMANDS:
​     setconfigitem  set log config item. If you need change the log confiration in your configuration, please also input the --serveraddr <LogRESTHost>:<LogRESTPort> firstly in this command

OPTIONS:
   --help, -h  show help

参数说明

| 主命令行                  | 参数列表 | 参数说明                       | 必选参数 |
| ------------------------- | :------: | :----------------------------: | :------: |
| ./bcli log  setconfigitem | --key    | 日志参数，选其一设置：minlevel | maxlevel | levels | maxrolls | 是 |
| ./bcli log  setconfigitem | --value  | 按日志参数，填写对应项值       | 是       |

返回信息

该命令成功后将返回执行结果。

示例

    ./bcli log  setconfigitem --key minlevel --value debug

输出结果

    {
        "errcode": 0
    }
    setconfigitem successfully.