#!/usr/bin/env groovy

pipeline {
  agent none
  stages {
    stage('build'){
    agent { 
      node { 
        label 'master'
        customWorkspace '/tmp/jksdemo'
      }
    }
      steps {
        sh 'docker build -t docker.io/zspmilan/centos-jkmd:v1.0 .'
      }
    }
    stage('push') {
      agent { 
        node {
          label 'master'
        }
      }
      options { retry (3) }
      steps {
        sh 'docker push docker.io/zspmilan/centos-jkmd:v1.0'
      }
    }
    stage('run') {
      agent { 
        node {
          label 'client'
          customWorkspace '/tmp/jksdemo'
        }
      }
      steps {
        sh 'docker run -d -p 8809:80 --name centos-jksmd centos-jkmd:v1.0 /usr/sbin/init'
      }
    }
    stage('test') {
      agent { node { label 'client' } }
      steps {
        sh 'curl http://127.0.0.1:8809'
      }
    }
  }
  post {
    success {
      echo 'Everything is fine!'
    }
  }
}
