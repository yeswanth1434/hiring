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
                sh "docker build . -t yesh3003/hiring:${commit_id()}"
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh "docker login -u yesh3003 -p ${dockerhubpwd}"
                    sh "docker push yesh3003/hiring:${commit_id()}"
                }    
            }
        }
        stage('Docker deploy') {
            steps {
                sshagent(['docker-host']) {
                    sh "ssh -o StrictHostKeyChecking=no  ec2-user@172.31.42.192 docker rm -f hiring"
                    sh "ssh ec2-user@172.31.42.192 docker run -d -p 60:8080 --name hiring yesh3003/hiring:${commit_id()}"
                }
            }
        }    
    }
}
def commit_id(){
    id = sh returnStdout: true, script: 'git rev-parse HEAD'
    return id
}    
    
    
