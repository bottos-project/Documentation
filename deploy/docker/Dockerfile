
ARG UBUNTU_VERSION=18.04

FROM ubuntu:$UBUNTU_VERSION

ARG BOTTOS_VERSION=3.7.1
ARG MONGO_VERSION=4.0

# update apt get source
RUN echo "deb http://mirrors.163.com/ubuntu/ bionic main restricted universe multiverse" > /etc/apt/sources.list && echo "deb http://mirrors.163.com/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb http://mirrors.163.com/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb http://mirrors.163.com/ubuntu/ bionic-proposed main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb http://mirrors.163.com/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb-src http://mirrors.163.com/ubuntu/ bionic main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb-src http://mirrors.163.com/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb-src http://mirrors.163.com/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb-src http://mirrors.163.com/ubuntu/ bionic-proposed main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb-src http://mirrors.163.com/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list

# mkdir
# pre-install
RUN mkdir -p /Bottos /Bottos/bin /Bottos/configs /Bottos/datadir /Bottos/log /Bottos/mongodb/data/db /Bottos/mongodb/log  /Bottos/scripts /Bottos/sharedData /Bottos/temp /root/bot && apt-get update && apt-get -y upgrade && apt-get install -y wget net-tools curl

WORKDIR /Bottos

# install mongo
RUN wget -O ./mongodb.tgz -c http://downloads.mongodb.org/linux/mongodb-linux-x86_64-ubuntu1804-v$MONGO_VERSION-latest.tgz && tar xzvf ./mongodb.tgz -C ./temp --strip-components 2 && cp ./temp/mongod ./temp/mongo ./bin && rm ./mongodb.tgz ./temp/* 

# install bottos
# set permission
RUN wget -O bottos.tar.gz -c https://github.com/bottos-project/bottos/releases/download/v$BOTTOS_VERSION/bottos_mainnet_V${BOTTOS_VERSION}.tar.gz && tar xzvf ./bottos.tar.gz --strip-components 1 -C ./bin && rm ./bottos.tar.gz && chmod -R +x ./bin ./scripts

# copy local scripts to image
COPY ./scripts ./scripts

EXPOSE 8689 9868 6869 6870
VOLUME ["./configs","./log","./sharedData","./datadir","./mongodb","/root/bot"]
