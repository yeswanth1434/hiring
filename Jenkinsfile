pipeline {
    agent any

<<<<<<< HEAD
    stages {:   
        stage('Maven Build') {
=======
    stages {
        
        stage('Maven Build') {
            when {
                branch 'develop'
            }
>>>>>>> 050f25a94e64be278d55d67b7dd4237109651f51
            steps {
                sh "mvn clean package"
            }
        }
        
<<<<<<< HEAD
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
=======
        stage('Tomcat Deploy - Dev') {
            when {
                branch 'develop'
            }
            steps {
                echo "Deploying to dev"
            }
        }
        stage('Tomcat Deploy - Prod') {
            when {
                branch 'main'
            }
            steps {
                echo "Deploying to production"
>>>>>>> 050f25a94e64be278d55d67b7dd4237109651f51
            }
        }
    }
}
