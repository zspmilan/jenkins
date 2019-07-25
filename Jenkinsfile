#!/usr/bin/env groovy

pipeline {
  agent {
    dockerfile {
    }
  }
  stages {
    stage ('who') {
      steps {
        sh 'hostname'
      }
  }
    stage('run') { 
      steps {
      sh 'hostname >/tmp/hostnamefile'
      sh 'cat /tmp/hostnamefile'
      sh 'hname=$(cat /tmp/hostnamefile)'
      sh 'echo "I am in ${hname}!"'
      }
    }
  }
}
