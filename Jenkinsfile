pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
         stage('Clone repository') { 
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
        
        stage('Deploy') {
            steps {
                script{
                    docker.withRegistry('https://808447716657.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:aws-credentials') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                        
                        //def customImage = docker.build("my-image:${env.BUILD_ID}")
                        /* Push the container to the custom Registry */
                        //customImage.push()
                        
                        
                    }
                }
            }
        }
    }
}
