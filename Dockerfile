FROM centos
MAINTAINER zspmilan@163.com
COPY CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum install -y python
RUN yum install -y nginx
EXPOSE 80
