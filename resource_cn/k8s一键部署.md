 #### 1. 使用docker-compose管理单台主机上的多个生产节点容器

  * 进入 ./docker/
    ```bash
    $ cd ./docker
    ```

  * 获取image，以下两种方法都可以
      1. 自动从dockerhub上拉取（需要提前手动push到dockerhub）
      ```
      $ docker pull yaoya12345/bottos:v1.2
      ```
      2. 本地编译
      ```
      $ docker build -t yaoya12345/bottos:v1.2 .
      ```

  * 生成docker-compose.yml
    ```
    $ ./makeDockerComposeYml.sh --delegateNum=$DELEGATE_NODE_NUM --mongodb=true|false --image=$IMAGE_NAME
    ``` 

  * 管理容器基本指令
      ```
      # 初始化
      $ docker-compose up -d

      # 停止
      $ docker-compose stop

      # 继续执行
      $ docker-compose start

      # 终止
      $ docker-compose down
      ```


#### 2. 使用kubernetes管理多台主机上的多个生产节点pod

  * 测试环境
    * 宿主机：
      * 操作系统：win10
      * 处理器：Intel Core i5-7200U CPU @ 2.50GHz 2.71GHz
      * 系统类型：64位操作系统，基于X64的处理器
      * 内存：16G
    * 虚拟机：
      * 虚拟工具：VMWare Workstation 15 Pro
      * 操作系统：Ubuntu 18.04.1
      * server01：
        * 处理器：2
        * 内存：4GB
        * 硬盘：25G
      * server02：
        * 处理器：2
        * 内存：5.8G
        * 硬盘：20G
      * server03：
        * 处理器：1
        * 内存：3.0G
        * 硬盘：20G
  
  * kubernetes集群的搭建
    * 详见教程：https://blog.csdn.net/yaoya_2015/article/details/95461747

    * nfs服务器搭建好之后，需要更改./kubernetes/nfs-pv.yaml中的相关ip
      ```
      $ vim ./kubernetes/nfs-pv.yaml

        ...
        ...
        nfs:
          path: ...
          server: $YOUR_NFS_HOST_IP
      ```

  
  * 启动
    ```
    # 1. 进入 ./kubernetes
    $ cd ./kubernetes

    # 2. 创建pv
    $ kubectl create -f ./nfs-pv.yaml

    # 3. 创建pvc
    $ kubectl create -f ./nfs-pvc.yaml

    # 4. 生成genesis-delegateX.yaml文件
    $ ./makeK8sYaml.sh --delegateNum=29 --mongodb=true --image=yaoya12345/bottos:v1.2

    # 5. 启动节点
    $ kubectl create -f ./genesis-delegateX.yaml
    ```

  * 管理集群基本指令
    ```
    # 获取集群系统pod信息
    $ kubectl -n kube-system get pods
    
    # 查看集群信息
    $ kubectl cluster-info

    # 获取节点信息
    $ kubectl get nodes

    # 获取pod信息
    $ kubectl get pods

    # 获取service信息
    $ kubectl get svc

    # 查看pod运行log
    $ kubectl logs $POD_NAME
    ```
  
  * 现在的策略：
    * k8s自动调度pod到相应的服务器上
    * 所有数据会持久化在nfs服务器上的 `/home/bottos/k8s/save_data/` 下

