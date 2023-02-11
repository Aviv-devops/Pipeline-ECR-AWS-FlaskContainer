pipeline {
    agent any
    
    environment {
        curImage = '808447716657.dkr.ecr.us-east-1.amazonaws.com/flask_image:""$BUILD_ID""'
    }
    
    stages {
        
        stage('Clone repository') { 
            steps { 
                    checkout scm
            }
        }
        
        stage('build docker image') {
            steps {
                
                //Authenticate aws
                withEnv (["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]){
                
                    //login to docker with aws user and the password will be taken from the variable above.
                    sh 'docker login -u AWS -p $(aws ecr get-login-password --region us-east-1) 808447716657.dkr.ecr.us-east-1.amazonaws.com'
                    
                    
                }
            }
        }
        
        stage ('docker build'){
               steps{
                    sh 'docker build -t flask_image .'
               }
        }
        
        stage ('docker tag & docker push'){
               steps{
                    sh "docker tag flask_image:latest ${curImage}"
                    sh "docker push ${curImage}"
               }
        }
        
        stage('docker pull'){
            steps{
                sh "docker pull ${curImage}"
            }
        }
        
        
        
        
        //WORKS 
        // https://blog.devgenius.io/how-i-can-make-ssh-from-server-to-jenkins-8dcc34647c6b
        stage('login server & docker run'){
            steps{
                sshagent(credentials:['54.83.199.231']){ 
                    //sh 'ssh  -o StrictHostKeyChecking=no  ubuntu@54.83.199.231 uname -a'
                    //sh 'ssh -o StrictHostKeyChecking=no -l ubuntu 54.83.199.231 uptime "whoami"'
                    //sh 'ssh -o StrictHostKeyChecking=no -l ubuntu 54.83.199.231 ifconfig'
                    sh "ssh -o StrictHostKeyChecking=no -l ubuntu 54.83.199.231 docker run -itd ${curImage}"
                }
                echo "success lgoin"
                //sh 'pwd'
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
