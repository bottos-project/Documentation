
Advanced configuration of production node block signatures
-----------

# 1. Start the Wallet service

```
# ./wallet 
Start wallet REST service. Listen IP: 127.0.0.1  Port: 6869
```

# 2. Create a block signature wallet

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

# 3. Configure for config.toml

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
# 4. Start
```
# ./bottos --delegate bottos
InsertBlock, number:1, time:2018-11-22 08:07:54, delegate:bottos, trxn:0, hash:5f920c93c55096a936ee33c07563526a7f0c03cf5cd430dcbfaeae33beedb782, prevHash:caf2bae84f70412354211dd5028142eca6901b06b9a65dfbe9df065bcf56e291
InsertBlock, number:2, time:2018-11-22 08:07:57, delegate:bottos, trxn:0, hash:f435792b875d60c0c7ba7d8b420f93b939e776ca255faf8214fc1f8a3225969b, prevHash:5f920c93c55096a936ee33c07563526a7f0c03cf5cd430dcbfaeae33beedb782
```

