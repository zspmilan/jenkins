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
         hname = readFile '/tmp/hostnamefile'
      sh 'echo "I am in ${hname}!"'
      }
    }
  }
}
