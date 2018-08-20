FROM land007/golang:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN apt-get install -y git

RUN go get -u google.golang.org/grpc
RUN go get -u github.com/golang/protobuf/protoc-gen-go

#docker stop golang-grpc ; docker rm golang-grpc ; docker run -it --privileged --name golang-grpc land007/golang-grpc:latest
