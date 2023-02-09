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

        //stage('Build') {
        //    steps {
        //        script{
        //          
        //         dockerImage = docker.build("some-aviv-image")
        //        }
        //    }
        //}

        //stage('Push image') {
        //    withDockerRegistry([ credentialsId: "dockerhubaccount", url: "" ]) {
        //    dockerImage.push()
        //}
        stage('Deploy') { 
            steps { 
                script{ 
                        docker.withRegistry('808447716657.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:aws-credentials')
                        dockerImage.push("${env.BUILD_NUMBER}") 
                        dockerImage.push("latest") 
                    } 
                } 
          
        } 
        
    }
}
