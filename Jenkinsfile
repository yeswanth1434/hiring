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
                withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh "docker login -u yesh3003 -p ${dockerhubpwd}"
                    sh "docker push yesh3003/hiring:0.0.2"
                }    
            }
        }
        stage('Docker deploy') {
            steps {
                sshagent(['docker-host']) {
                    sh "ssh -o StrictHostKeyChecking=no  ec2-user@172.31.43.212 docker run -d -p 8080:8080 --name hiring yesh3003/hiring:0.0.2"
                }
            }
        }    
    }
}
