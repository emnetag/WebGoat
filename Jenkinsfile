pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Deliver') {
           steps {
               sh 'mvn -pl webgoat-server spring-boot:run'
           }
        }
    }
}
