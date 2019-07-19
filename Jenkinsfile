stage('Build') {
    node {
        checkout scm
        sh 'make'
        stash includes: '**/target/*.jar', name: 'app' 
    }
}

stage('Test') {
   parallel linux: {
        node('linux') { 
            checkout scm
            try {
                 unstash 'app' 
                 sh 'make check'
            }
            finally {
                 junit '**/target/*.xml'
            }  
         }
   }, 
    node('windows') {
        checkout scm
        try {
            unstash 'app'
            bat 'make check' 
        }
        finally {
            junit '**/target/*.xml'
        }
    }
}
