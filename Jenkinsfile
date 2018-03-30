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
        jobName = "${env.JOB_NAME}"
        buildNumber = "${env.BUILD_NUMBER}"
        stage('Veracode Scan') {
            withCredentials([usernamePassword(credentialsId: 'VERACODE_CREDS', passwordVariable: 'veracode_password', usernameVariable: 'veracode_username')]) {
                veracode applicationName: 'Webgoat-8.0', createProfile: true, debug: true, criticality: 'Medium', fileNamePattern: '', replacementPattern: '', sandboxName: '', scanExcludesPattern: '', scanIncludesPattern: '', scanName: '$buildNumber', teams: '', timeout: 60, uploadExcludesPattern: '', uploadIncludesPattern: '**/**.jar', useIDkey: true, vid: '$veracode_username', vkey: '$veracode_password', vpassword: '', vuser: ''
            }
        }
    }
}