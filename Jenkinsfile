pipeline {
    agent any
    
    stages {
        stage('Clone repository') { 
            steps { 
                    checkout scm
            }
        }
        
        stage('build & deploy docker image to ECR') {
            steps {
                
                //Authenticate aws
                withEnv (["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]){
                    
                    //login to docker with aws user and the password will be taken from the variable above.
                    sh 'docker login -u AWS -p $(aws ecr get-login-password --region us-east-1) 808447716657.dkr.ecr.us-east-1.amazonaws.com'
                    //sh 'docker build -t flask_image .'
                    //sh 'docker tag flask_image:latest 808447716657.dkr.ecr.us-east-1.amazonaws.com/flask_image:""$BUILD_ID""'
                    //sh 'docker push 808447716657.dkr.ecr.us-east-1.amazonaws.com/flask_image:""$BUILD_ID""'
                }
            }
        }
        
        
        // https://blog.devgenius.io/how-i-can-make-ssh-from-server-to-jenkins-8dcc34647c6b
        stage('login server & docker pull'){
            steps{
                sshagent(credentials:['54.83.199.231']){ 
                    sh 'ssh  -o StrictHostKeyChecking=no  ubuntu@54.83.199.231 uptime'
                    sh 'whoami'
                    sh 'ifconfig'
                    //sh 'docker pull 808447716657.dkr.ecr.us-east-1.amazonaws.com/flask_image:""$BUILD_ID""' 
                }
                echo "success lgoin"
            }
        }

        /*stage('docker run'){
            steps {
                sh 'docker run -itd 808447716657.dkr.ecr.us-east-1.amazonaws.com/flask_image:""$BUILD_ID""' 
                sh 'docker ps'
                
            }
       }
       */
    }
}
