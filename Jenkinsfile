pipeline {
    agent { 
        docker {
            image 'maven:3-alpine'
            args '-v /var/lib/jenkins/.m2:/root/.m2 -u root:root'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -DskipTests package'
            }
        }
        stage('Veracode Scan') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'VERACODE_CREDS', passwordVariable: 'veracode_password', usernameVariable: 'veracode_username')]) {
                    sh ''''
                    echo $veracode_password
                    echo $veracode_username
                    '''
                }
            }
        }
    }
}