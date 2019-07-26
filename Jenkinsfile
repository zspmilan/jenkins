#!/usr/bin/env groovy

pipeline {
  agent none 
  stages {
    stage('run') { 
       agent {
           dockerfile {
                 additionalBuildArgs '-t jksmd'
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
           reuseNode true
        }
      }
      steps {
        sh 'hostname'
      }
    }
  }
}
