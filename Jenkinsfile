#!/usr/bin/env groovy

pipeline {
  agent none
  stages {
    stage('build'){
    agent { 
      node { 
        label 'master'
        customWorkspace '/tmp/jksdemo'
      }
    }
      steps {
        sh 'docker build -t docker.io/zspmilan/centos-jkmd:v1.0 .'
      }
    }
    stage('push') {
      agent { 
        node {
          label 'master'
        }
      }
      options { 
        retry (3) 
        skipDefaultCheckout()
      }
      steps {
        sh 'docker push docker.io/zspmilan/centos-jkmd:v1.0'
      }
    }
    stage('run') {
      agent { 
        node {
          label 'client'
          customWorkspace '/tmp/jksdemo'
        }
      }
      options { 
        retry (3) 
        skipDefaultCheckout()
      }
      steps {
        sh '''
           timestamp=$(date +%Y%m%d%H%M%S)
           docker run -d -p 8809:80 --name centos-jksmd_${timestamp} zspmilan/centos-jkmd:v1.0 /usr/sbin/init
           docker exec centos-jksmd_${timestamp} systemctl start nginx
           echo ${timestamp} > timestamp
        '''
      }
    }
    stage('test') {
      agent { node { label 'client' } }
      options { skipDefaultCheckout() }
      steps {
        sh 'curl http://127.0.0.1:8809'
      }
    }
    stage('post_clear') {
      steps {
        sh '''
           timestamp=$(cat timestamp)
           docker stop ${timestamp} && docker rm ${timestamp}
        '''
      }
    }
  }
  post {
    always {
      /*agent none
      stages {
        stage('clear-client') {*/
          agent { node { label 'client' }}
          /*steps {*/
            echo 'Now clear the workspace!'
            deleteDir()
         /* }
        }
        stage('clear-master') {*/
          agent { node { label 'master' }}
         /* steps {*/
            echo 'Now clear the workspace!'
            deleteDir()
         /* }
        }
      }*/
    }
    success {
      echo 'Everything is fine!'
      mail to: 'zspmilan@163.com',
      subject: "Update the Pipeline result.",
      body: "The ${env.JOB_NAME} ${env.BUILD_NUMBER} is successful."
    }
   failure {
      echo 'Ops, it failed!'
      mail to: 'zspmilan@163.com',
      subject: "Update the Pipeline result.",
      body: "The ${env.JOB_NAME} ${env.BUILD_NUMBER} is failed!"
   }
  }
}
