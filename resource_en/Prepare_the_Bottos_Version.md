
Prepare Bottos Chain executable programs
-------------

------

# 1. Download the released version (recommended)

> [Bottos Chain Release Version](https://github.com/bottos-project/bottos/releases), path in https://github.com/bottos-project/bottos/releases

&nbsp;

# 2. Download the source code and compile the version



## 2.1. Prepare the compile environment

### 2.1.1. Golang installation

> [Golang locale installation](./Set_up_the_Golang_Developping_environment.md)

### 2.1.2. MinGW program installation (Windows ONLY)
> The program can be downloaded from [MinGW official website address](http://www.mingw.org/) and requires no less than version 8.1.0 of MinGW.

## 2.2. Download the source code

> [Bottos Chain Source Code](https://github.com/bottos-project/bottos), path in https://github.com/bottos-project/bottos


## 2.3. Compile the source code

### 2.3.1. Compile in Linux (Ubuntu/MacOS)

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

### 2.3.1. Compile in Windows

Execute the makeall.sh script in the source root directory, which will generate bottos executable programs in the current directory, and bcli and wallet executables in the build/bin directory, as shown below:

![](../common/windows_compile.png)

