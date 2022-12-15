pipeline {
    agent any

    stages {
        stage('git checkout') {
            steps {
                git branch: 'main', credentialsId: 'git-creds', url: 'https://github.com/yeswanth1434/hiring'    
            }
        }
        stage('maven build') {
            steps {
                sh 'mvn clean package'    
            }
        }
        stage('tomcat') {
            steps {
                sshagent(['tomcat-cred']) {
                    sh "scp -o StrictHostKeyChecking=no target/*.war ec2-user@172.31.28.224:/opt/tomcat9/webapps"
                    sh "ssh ec2-user@172.31.28.224 /opt/tomcat9/bin/shutdown.sh"
                    sh "ssh ec2-user@172.31.28.224 /opt/tomcat9/bin/startup.sh"
                }    
            }
        }    
    }
}
