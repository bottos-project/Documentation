# Write Smart contracts using JavaScript

`Note:`This set of tutorials is based on the Node.js development environment, if you do not have installed on your computer, please install your own node.js environment.

## Initialize the project

Download the Contract Integration Development Framework `CONTRACT-TOOL-JS` and initialize the project

```
sudo npm i contract-tool-js -g
contract-tool-js init MyDapp
cd MyDapp
```

The following project structure can be generated through the appeal initialization step:

```
- config
    - config.js //Mainly store the configuration Files
    - keystore.json  // KeyStore key file for the person who placed the deployment contract
- contract
    - abi.json  // ABI structure for placing smart contracts
    - contract.js // Intelligent Contract Code
- tools  
    - deploy.js  // Contract Deployment Files
- test  
    - test.js  // Contract Test Files
```

## Smart Contract and ABI Develop

Smart contracts are developed under the `Contract` directory

`contract/contract.js`: Write our smart Contract code in this file

`contract/abi.json` Write the `ABI` profile corresponding to the smart contract in the this file

Bottos currently only supports single contract documents, with the following points of attention:

```
1. Third-party dependencies that cannot be installed using 'npm'
2. Only contract file deployments are supported under one account, and multi-contract file deployments are not supported
```

The ABI file description template is as follows:

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

There are several types of fields:

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

## Deploying smart Contracts and ABI

With the completion of smart contracts and ABI development, we need to deploy smart contracts and ABI files to the chain.
`Note:` You can create an account through Bottos official wallet to get KeyStore.


- Paste the `keystore` of the deployment account into `Config/keystore.json`
- You need to configure the password `keystore_pwd` for your KeyStore account in `config/config.js`
- Run the command to deployment contract and the ABI file

```
npm run deployContract  // Deploying smart Contracts
npm run deployAbi  // Deploying ABI Files
```

## Test Smart Contracts

Write the smart Contract test code in the `Test/test.js` file, and then run the command to test the smart contract

```
npm test
```

## Related built-in libraries

**Storage**

- Storage.set(table,key,value)
- Storage.get(contract,table,key)

**Lib**

- Lib.getParams()
- Lib.getPack(obj:object)
- Lib.getUnpack(packstr:string)


## References

- [Write Smart contracts using JavaScript](http://doc.bottos.org:4000/%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6/Development/%E4%BD%BF%E7%94%A8JavaScript%E7%BC%96%E5%86%99%E6%99%BA%E8%83%BD%E5%90%88%E7%BA%A6.html)
- [bottos-sdk-js API Document](https://github.com/bottos-project/bottos-sdk-js/wiki/API-Document)
- Official Development documentation:http://www.bottos.org/