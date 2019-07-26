#!/usr/bin/env groovy

pipeline {
  agent none 
  stages {
    stage('run') { 
       agent {
           dockerfile {
                 additionalBuildArgs '-t jksmd'
                 reuseNode true
           }
       }
       steps {
           sh 'echo "I am in $(hostname)!"'
      }
    }
    stage ('who') {
      agent {
        docker {
           image 'jksmd'
           args '--name jenkmd'
        }
      }
      steps {
        sh 'hostname'
      }
    }
  }
}
