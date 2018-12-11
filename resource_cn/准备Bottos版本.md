

准备Bottos Chain可执行程序
-------------

------

# 1. 下载已发布版本（推荐）

> [Bottos Chain发布的Release版本](https://github.com/bottos-project/bottos/releases)  的路径为  https://github.com/bottos-project/bottos/releases

&nbsp;

# 2. 下载源码并编译版本



## 2.1. 准备编译环境

### 2.1.1. Golang语言环境安装

> [Golang语言环境安装](./Golang语言环境安装.md)

### 2.1.2. MinGW程序安装(Windows ONLY)

> 相应程序可以在 [MinGW官网地址](http://www.mingw.org/ )下载，要求不低于MinGW 8.1.0版本。

## 2.2. 下载源码

> [Bottos Chain源码](https://github.com/bottos-project/bottos)  的路径为  https://github.com/bottos-project/bottos


## 2.3. 编译源码

### 2.3.1. Linux环境编译(Ubuntu/MacOS)

- 编译bottos链可执行文件。
```
    user:bottos user$ make bottos
    build/vmlib.sh
    build/bottos.sh
    go build
    Done building.
    Run "./bottos --help" for help.
```
- 编译bcli人机命令可执行文件。
```
    user:bottos user$ make bcli
    build/bcli.sh go install
    Done building.
    Run "build/bin/bcli" to launch command line tool.
```
- 编译wallet钱包可执行文件。
```
    user:bottos user$ make wallet
    build/wallet.sh go install
    Done building.
    Run "build/bin/wallet" to launch wallet.
```
- 一次编译所有可执行文件，可以执行make all或者使用makeall.sh脚本。
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

### 2.3.1. Windows环境编译


执行源码根目录下的 makeall.sh 脚本，将会在当前目录生成 bottos 可执行文件，以及在build/bin目录下生成人机命令bcli和钱包wallet可执行程序，如下图：

![](../common/windows_compile.png)

