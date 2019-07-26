#!/usr/bin/env groovy

pipeline {
  agent {
    dockerfile {
         additionalBuildArgs '-t jksmd'
         reuseNode true
    }
  }
  stages {
    stage ('who') {
      agent {
        docker {
           image 'jkmd'
           args '--name jenkmd'
        }
      }
      steps {
        sh 'hostname'
      }
  }
    stage('run') { 
      steps {
      sh 'echo "I am in $(hostname)!"'
      }
    }
  }
}
