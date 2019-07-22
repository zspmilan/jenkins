#!/bin/bash

cd /var/lib/jenkins/workspace/jenkis-docker
imageID=docker bulid .|grep "Successfully built"|awk '{print $3}'
docker run -p 5579:80 --name centos-mine -d $imageID sleep 1d
