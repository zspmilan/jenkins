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
      sh """
         hostname >/tmp/hostnamefile
         hname=readFile '/tmp/hostnamefile'
         echo -e "where am I?\n I am in container ${hname} ?"
       """
      }
    }
  }
}
