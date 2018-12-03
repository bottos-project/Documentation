# Install and Run Bottos

> Difference: Single-node is generally used to start a single node locally for contract development and testing, and is not connected to other nodes, generally can retain the default configuration. Multiple nodes are connected to the Bottos main network or to the test network. It can also be used to form a small private network of its own. Generally need to do some basic configuration.

## Start a single node

- Come into `GOPATH` directory

```
cd  ~/go/src/github.com/
```

- Download and extract the file bottos.tar.gz

```
wget https://github.com/bottos-project/bottos/releases/download/tag_bottos3.2/bottos.tar.gz
tar zxvf bottos
cd bottos
```

- Start a Bottos Single Node

```
./bottos --delegate=bottos
```

- `--delegate`: The designated block producer's account

If the following information is returned, the node starts successfully

```
CommitBlock by p2p: lib: 1
InsertBlock: number:1, delegate:bottos, trxn:0, time=1537948299, hash: 566fb29ab982c128bf6c71297bc4e7d558e0f86ae89a7f3955ea46b04689fb5a, prevHash=caf2bae84f70412354211dd5028142eca6901b06b9a65dfbe9df065bcf56e291
CommitBlock by p2p: lib: 2
InsertBlock: number:2, delegate:bottos, trxn:0, time=1537948302, hash: 8abe6aef22249ab58d6c7cd3970f909571c4e818f3757d9de7d86870bfc7465b, prevHash=566fb29ab982c128bf6c71297bc4e7d558e0f86ae89a7f3955ea46b04689fb5a
```
  1）Create Your Wallet

​      You need prepare the wallet account, password and private key.

As an example, we create a Bottos 's account's wallet, and takes the private key from config.toml in item of Bottos [Delegate.Signature].

```
cd to project code's directory
cd ~/bottos-node/bottos/
Create the bottos wallet:
 ./bcli wallet create --account bottos
```

​     In this way, the Bottos wallet is created and a 'bottos.keystore' file containing the private key and password is created and stored in the bot directory.

```
root@JD-7:~/bottos-node/bottos#bcli wallet create --account bottos

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

​     2）Create Your Account

Under the project code path, do the following:

```
cd to project code's directory
cd bottos-node/bottos/
Generate a pair of public private keys (saved)
./bcli wallet  generatekey
Enter your password to unlock wallet
./bcli wallet unlock --account bottos

Create a user with an account named test001, from which the public key is saved above, and the referrer account is 'Bottos'

./bcli account create --account test1234567890  --pubkey 0411c2d1679d2b40e9bb7060eab34edc5e6fa69d4142728fad131d141fa6c61452b747c88dd0bc9584024a58787646a06e7c798211eed24f4e4687732747fbe79c --referrer bottos
```

​     example: the command returns the hash of the transaction if the execution be in succeed.

```
root@JD-7:~/bottos-node/bottos# ./bcli wallet  generatekey
public_key: 0411c2d1679d2b40e9bb7060eab34edc5e6fa69d4142728fad131d141fa6c61452b747c88dd0bc9584024a58787646a06e7c798211eed24f4e4687732747fbe79c
private_key: 8529d2c8a51df6105a46a5363cc2378f95060c39ac5212e2d5c6ba436de0d7dd
root@JD-7:~/bottos-node/bottos# ./bcli account create --account test1234567890 --pubkey 0411c2d1679d2b40e9bb7060eab34edc5e6fa69d4142728fad131d141fa6c61452b747c88dd0bc9584024a58787646a06e7c798211eed24f4e4687732747fbe79c --referrer bottos
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

 3）Transfer the Balance

  Under the project code path, do the following：

```
cd to project code's directory
cd bottos-node/bottos/
Enter your password to unlock wallet:
./bcli wallet unlock --account bottos
Transfer: Bottos transfer to test001 1000BTO
./bcli transfer --from bottos --to test1234567890 --amount 1000
```

example: the hash of the transaction will be returned if the execution be in succeed.

```
root@JD-7:~/bottos-node/bottos# ./bcli wallet unlock --account bottos 

Please input your password for your wallet: 

{
    "unlock": true
}
root@JD-7:~/bottos-node/bottos# ./bcli transfer --from bottos --to test1234567890 --amount 1000
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


## Connect to a test network

Connect the single node initiated above to the Bottos test network. The following configuration is required.


Edit the `config-testnet.toml` file

- P2PServAddr: Change this into you node's external IP

```
P2PServAddr = "192.168.1.1"   //Change this into you node's external IP
```

Then run the following command to connect the current node to the test network

' Note ': If there is a ' datadir ' cache directory under the project directory, we first need to run the following command to remove the cache.

```
rm -rf datadir
```

Start node and connect it to test network

```
./bottos --config="./config-testnet.toml" --genesis="./genesis-testnet.toml"
```

Wait a while and if a large number of the following print information appears, the block is automatically synchronized. That is to say it has been successfully connected to the test network

```
CommitBlock by p2p: lib: 1
InsertBlock: number:1, delegate:bottos, trxn:0, time=1537888767, hash: 03f6c7aa72314be76902b6c2d4b86b7afbb07d2b4b4dec67caf6fc51e125e9ed, prevHash=98128aa21d634eda9cb0152314b06480d4c51b0bf18ea6d39f5189388e1bf4ee
CommitBlock by p2p: lib: 2
InsertBlock: number:2, delegate:bottos, trxn:0, time=1537888770, hash: c87a1c59aaa87f890169a1016931b3a9e539e72e475c0861623ed36fbd00c1b4, prevHash=03f6c7aa72314be76902b6c2d4b86b7afbb07d2b4b4dec67caf6fc51e125e9ed
CommitBlock by p2p: lib: 3
InsertBlock: number:3, delegate:bottos, trxn:0, time=1537888773, hash: 3bcf9ecf116891b226b2c6b31578d5f1ee867a75b667752286eeaf3d237e684b, prevHash=c87a1c59aaa87f890169a1016931b3a9e539e72e475c0861623ed36fbd00c1b4
CommitBlock by p2p: lib: 4
```

