#!/usr/bin/env groovy
node {
     checkout scm
     stage('build-image') {
          sh 'docker bulid --tag centos-py-nginx:v1 .'
          sh 'docker run -p 5579:80 --name centos-mine -d centos-py-nginx:v1 sleep 1d' 
    }
    stage('test-container') {
         sh 'curl http://100.98.101.43:5579'
         sh 'python --version'
    }
    stage('deploy') {
    echo "I would like to deploy the container to client node, but I don't know how to do it!"
    }
}
