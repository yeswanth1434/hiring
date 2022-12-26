pipeline {
    agent any

    stages {
        
        stage('Maven Build') {
            steps {
                sh "mvn clean package"
            }
        }
        
        stage('Docker Build') {
            steps {
                sh "docker build -t yesh3003/hiring:0.0.2 ."
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'hubPwd')]) {
                    sh "docker login -u yesh3003 -p ${hubPwd}"
                    sh "docker push yesh3003/hiring:0.0.2"
                }
            }
        }
    }
}	
