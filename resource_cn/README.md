# cpp智能合约自动部署工具

## 1. 必要信息写入配置文件
* 配置文件位置

    `
    $HOME/github.com/bottos-project/deploy/cpp_contract_deploy/config/deploy.config
    `

* 配置文件中选项说明

    * walletport=6869 # 钱包服务所用的端口
    * nodeurl=118.184.212.181:8689 # 节点服务的路径
    * account=irvingyao2019 # 部署用的账户
    * privkey=b2325c91a8b301635cbf80d5dbf11d50fe295ef1c885dbff41e7ebb159991bef # 部署用的账户对应的私钥
    * passwd=Bottos2019 # 部署用的账户对应本地钱包的密码
    * contractdir=/home/irving/irvingyao/bottos_contract/cpp/contract-tool-cpp/testDbSaveAndRead # 你的合约目录
    * cppfile=dbSaveRead.cpp # 合约目录下cpp文件的名字
    * hppfile=dbSaveRead.hpp # 合约目录下hpp文件的名字
    * contractname=testirving # 部署到链上的合约的名字


## 2. 执行部署脚本
* 部署脚本位置

    `
    $HOME/github.com/bottos-project/deploy/cpp_contract_deploy/tool/deploy.sh
    `

* 直接执行
    `
    cd ./contract-tool-cpp/too/ && ./deploy.sh
    `

