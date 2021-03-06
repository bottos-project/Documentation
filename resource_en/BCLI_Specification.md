# Bottos BCLI Usage Specification

### 
### 1 BCLI Tool Briefly Description

Bottos BCLI realizes the human-computer interaction command line, and chiefly help to realize the accounts creation, information querying from the chain, balances transfer, wallet functions, etc., by interacting with the block chain based on RESTFUL API.

### ### 2 BCLI Tool Installation and Deployment

Do 'go build' command under the BCLI directory of BOTTOS code's directory, then the bcli executable file will be generated after a successful compilation.


### 3 BCLI Command Line Description

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


#### 1. BCLI user account function commands

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


#### 2. BCLI contract function command

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


#### 3. BCLI Candidate Node Voting Command

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

#### 4. BCLI Block Information Getting Command

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


#### 5. BCLI Genesis Node Functions Command

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


#### 6. BCLI Transferring Function Command

BCLI transfer functions are responsible for transferring BTO from user designated by 'from' to user designated by 'to' account.

##### ##### BCLI transferring Command

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


#### 7. BCLI Transaction Committing and Querying Commands

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

#### 8. BCLI Wallet Command

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
#### 9. BCLI P2P Command

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



