pipeline {
    agent any

    stages {:   
        stage('Maven Build') {
            steps {
                sh "mvn clean package"
            }
        }
        
        stage('Docker Build') {
            steps {
                sh "docker build -t kammana/hiring:0.0.2 ."
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'hubPwd')]) {
                    sh "docker login -u kammana -p ${hubPwd}"
                    sh "docker push kammana/hiring:0.0.2"
                }
            }
        }
    }
}
