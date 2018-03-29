pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2 -p 3030:3030'
                }
            }
            steps {
                sh 'mvn -DskipTests clean install'
                sh './scripts/run.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './scripts/stop.sh'
            }
        }
    }
}