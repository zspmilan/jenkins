#!/bin/bash

cd /var/lib/jenkins/workspace/jenkis-docker
imageID=$(docker build .|grep "Successfully built"|awk '{print $3}')
echo $imageID
docker run -p 5579:80 --name centos-mine -d $imageID /usr/sbin/init
