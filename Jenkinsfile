pipeline {
    agent any
    stages {
        stage('build') {
            when {
                expression {
                    BRANCH_NAME = 'main'
                    }
                }
            steps {
                echo 'builds the app'
            }
        }
        stage('deploy') {
            steps {
                echo 'deploys the app'
            }
        }
    }
}
