pipeline {
    agent any 
    options {
        skipStagesAfterUnstable()
    }
    stages {
         stage('Clone repository'){
            steps { 
                script{
                checkout scm
                }
            }
        }

        stage('Build') {
            steps {
                script{
                 app = docker.build("underwater")
                }
            }
        }

        stage('Test'){
            steps {
                echo 'Empty'
            }
        }
        
        stage('Deploy') {
            steps {
                script{
                        docker.withRegistry('808447716657.dkr.ecr.us-east-1.amazonaws.com/flask_image', 'ecr:us-east-1:aws-credentials'
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    }
}