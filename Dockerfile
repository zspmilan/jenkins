FROM centos
MAINTAINER zspmilan@163.com
COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum install -y python
RUN rpm -qa|grep gcc || yum install -y gcc-c++ && yum install -y pcre pcre-devel && yum install -y zlib zlib-devel && yum install -y openssl openssl-devel
RUN rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
#RUN rpm -qa|grep wget ||yum install -y wget && wget -c https://nginx.org/download/nginx-1.10.1.tar.gz && tar -zxvf nginx-1.10.1.tar.gz && cd nginx-1.10.1 && make install
RUN yum install -y nginx
EXPOSE 80
