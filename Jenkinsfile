#!/usr/bin/env groovy

pipeline {
  agent {
    dockerfile {
       additionalBuildArgs '-t jkdfmd'
    }
  }
  stages {
    stage('run') {
      agent {
        docker {
          image 'jkdfmd'
          args '--name democon'
        } 
    }
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
