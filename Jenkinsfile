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
                withCredentials([usernamePassword(credentialsId: 'VERACODE_CREDS', passwordVariable: 'VERACODE_PASS', usernameVariable: 'VERACODE_ID')]) {
                    veracode applicationName: 'WebGoat-8.0',
                            canFailJob: true,
                            createProfile: true,
                            criticality: 'Medium',
                            debug: true,
                            fileNamePattern: '',
                            replacementPattern: '',
                            sandboxName: '',
                            scanExcludesPattern: '', 
                            scanIncludesPattern: '',
                            scanName: '$buildnumber-$timestamp',
                            teams: '',
                            timeout: 60,
                            uploadExcludesPattern: '**/.m2/**',
                            uploadIncludesPattern: '**/webgoat-server/**/*.jar, **/webgoat-lessons/**/*.jar',
                            useIDkey: true,
                            vid: env.VERACODE_ID,
                            vkey: env.VERACODE_PASS,
                }
            }
        }
    }
}