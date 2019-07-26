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
      sh 'echo "I am in $(hostname)!"'
      }
    }
  }
}
