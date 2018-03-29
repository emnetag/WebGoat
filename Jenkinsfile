pipeline {
    agent { 
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2 -p 3030:3030 -u root:root'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -DskipTests clean install'
            }
        }
        stage('Deliver') {
            steps {
                // sh './scripts/run.sh'
                // input message: 'Finished using the web site? (Click "Proceed" to continue)'
                // sh './scripts/stop.sh'
                sh 'ls -al ./scripts'            
            }            
        }
    }
}