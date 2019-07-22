FROM centos
MAINTAINER zspmilan@163.com
COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum install -y python
RUN rpm -qa|grep gcc || yum install -y gcc-c++ && yum install -y pcre pcre-devel && yum install -y zlib zlib-devel && yum install -y openssl openssl-devel
RUN wget -c https://nginx.org/download/nginx-1.10.1.tar.gz && tar -zxvf nginx-1.10.1.tar.gz && cd nginx-1.10.1 && make && make install
EXPOSE 80
