#!/usr/bin/env groovy

pipeline {
  agent {
    dockerfile {
    }
  }
  stages {
    stage ('who') {
      steps {
         echo "hope no issue!"
      }
  }
    stage('run') { 
      steps {
      sh """
         hostname >/tmp/hostnamefile
#         hname=readFile '/tmp/hostnamefile'
#         echo -e "where am I?\n I am in container ${hname} ?"
       """
      }
    }
  }
}
