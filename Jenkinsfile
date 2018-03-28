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
                sh 'echo -e "Current Dir: `pwd`"'
                sh 'echo "**** Current User ***"'
                sh 'echo -e "User: `whoami`  Home: `$HOME`"'
                sh 'echo "**** Running Install ***"'
                sh 'mvn -DskipTests clean install'
            }
        }
        stage('Deliver') {
           steps {
               sh './scripts/deliver.sh'
               input message: 'Finished using the web site? (Click "Proceed" to continue)'
               sh './scripts/kill.sh'
           }
        }

    }
}