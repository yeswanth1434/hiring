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
                    sh "docker login -u yesh3003 -p *******"
                    sh "docker push yesh3003/hiring:0.0.2"
                }
            }
        }
    }
}	
