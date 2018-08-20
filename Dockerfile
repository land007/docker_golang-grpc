FROM land007/golang:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN apt-get install -y build-essential git

RUN cd /tmp && wget https://github.com/google/protobuf/releases/download/v3.6.1/protobuf-all-3.6.1.tar.gz
RUN cd /tmp && tar -zxvf protobuf-all-3.6.1.tar.gz
RUN cd /tmp/protobuf-3.6.1 && ./configure && make && make install

RUN go get -u google.golang.org/grpc
RUN go get -u github.com/golang/protobuf/protoc-gen-go


#docker stop golang-grpc ; docker rm golang-grpc ; docker run -it --privileged --name golang-grpc land007/golang-grpc:latest
