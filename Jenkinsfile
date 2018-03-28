pipeline {
    agent none
    stages {
        stage('Health Check') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn --version'
                sh 'ls -al .'
            }
        }
    }
}