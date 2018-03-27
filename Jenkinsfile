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
                sh '-B -DskipTests clean package'
            }
        }
        stage('Deliver') {
           steps {
               sh 'mvn -pl webgoat-server spring-boot:run'
               input message: 'Finished using the web site? (Click "Proceed" to continue)'
           }
        }
    }
}