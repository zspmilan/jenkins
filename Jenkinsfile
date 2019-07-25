#!/usr/bin/env groovy

pipeline {
  agent {
    dockerfile {
       additionalBuildArgs '-t jkdfmd'
    }
  }
  stages {
    stage('build') {
      steps {
      echo "where am I?"
      }
    }
  }
}
