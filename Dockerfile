FROM centos

MAINTAINER zspmilan@163.com

copy CentOS-Base.repo /etc/yum.repos.d/

RUN yum install -y vim 

RUN mkdir /tmp/jenkinsdemo

WORKDIR /tmp/jenkinsdemo

RUN sleep 1d
