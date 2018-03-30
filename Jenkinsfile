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
                sh 'mvn -DskipTests package'
            }
        }
        stage('Validate') {
            steps {
                sh 'ls -al .'
            }            
        }
    }
}