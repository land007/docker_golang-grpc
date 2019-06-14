FROM land007/golang:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN cd /tmp && wget https://github.com/google/protobuf/releases/download/v3.6.1/protobuf-all-3.6.1.tar.gz && tar -zxvf protobuf-all-3.6.1.tar.gz && rm -f protobuf-all-3.6.1.tar.gz && \
	cd /tmp/protobuf-3.6.1 && ./configure && make && make check && make install && rm -rf /tmp/protobuf-3.6.1
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/lib64
RUN echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/lib64' >> /etc/profile && \
	go get -u google.golang.org/grpc && \
	go get -u github.com/golang/protobuf/protoc-gen-go && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time && \
	echo "land007/golang-grpc" >> /.image_names && \
	echo "land007/golang-grpc" > /.image_name


#docker stop golang-grpc ; docker rm golang-grpc ; docker run -it --privileged --name golang-grpc land007/golang-grpc:latest
