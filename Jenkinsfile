#!/usr/bin/env groovy

pipeline {
  agent none 
  stages {
    stage('run') { 
       agent {
           dockerfile {
                 additionalBuildArgs '-t jksmd:v1.0'
                 reuseNode true
           }
       }
       steps {
           sh 'echo "I am in $(hostname)!"'
           sh 'docker push jksmd:v1.0'
      }
    }
    stage ('who') {
      agent {
        docker {
           image 'jksmd:v1.0'
           args '--name jenkmd'
        }
      }
      steps {
        sh 'hostname'
      }
    }
  }
}
