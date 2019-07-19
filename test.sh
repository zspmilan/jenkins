#!/bin/bash
docker run -d --name centos-vim centos-vim:v1 bash sleep 1d
docker exec centos-vim echo "I am in container" && { result=$? }
export $result
