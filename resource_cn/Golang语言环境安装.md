# Golang语言环境安装
----------

> 注: 本文测试采用[Ubuntu Server 16.04 LTS](https://www.ubuntu.com/download/server) 版本64位操作系统




系统需要安装2.7系列版本的Python环境

- 下载go源码（要求1.11或更高版本）

```
wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz
```

- 将go解压到/usr/local目录下

```
sudo tar -zxvf go1.11.linux-amd64.tar.gz -C /usr/local
```

- 将`/usr/local/go/bin`目录添加至PATH环境变量

```
export PATH=$PATH:/usr/local/go/bin
```

- 检查Go语言环境是否安装成功

```
go env
```

如果出现如下结果，说明配置成功

```
GOARCH="amd64"
GOBIN="/home/bottos/go/bin"
GOCACHE="/home/bottos/.cache/go-build"
GOEXE=""
GOFLAGS=""
GOHOSTARCH="amd64"
GOHOSTOS="linux"
GOOS="linux"
GOPATH="/home/bottos/go"
GOPROXY=""
GORACE=""
GOROOT="/usr/lib/go1.11"
GOTMPDIR=""
GOTOOLDIR="/usr/lib/go1.11/pkg/tool/linux_amd64"
GCCGO="gccgo"
CC="gcc"
CXX="g++"
CGO_ENABLED="1"
GOMOD=""
CGO_CFLAGS="-g -O2"
CGO_CPPFLAGS=""
CGO_CXXFLAGS="-g -O2"
CGO_FFLAGS="-g -O2"
CGO_LDFLAGS="-g -O2"
PKG_CONFIG="pkg-config"
GOGCCFLAGS="-fPIC -m64 -pthread -fmessage-length=0 -fdebug-prefix-map=/tmp/go-build892316758=/tmp/go-build -gno-record-gcc-switches"
```

- 配置`GOPATH`工作目录

进入上述`go env`的返回结果中`GOPATH`所对应的目录,并创建相应的工作目录

注:`这里的具体目录根据个人真实情况而定`

```
mkdir /home/bottos/go
cd /home/bottos/go
mkdir bin pkg src src/github.com src/golang.org
```

至此，Go环境搭建成功
