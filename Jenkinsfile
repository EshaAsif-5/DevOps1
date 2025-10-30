pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        IMAGE_NAME = "eshaasif/jenkins-demo"
    }

    stages {
        stage('Pull Code from GitHub') {
            steps {
                echo 'Pulling latest code from GitHub...'
                git branch: 'main',
                    credentialsId: 'github-creds',
                    url: 'https://github.com/EshaAsif-5/DevOps1.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    bat 'docker build -t %IMAGE_NAME%:latest .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    echo 'Pushing image to Docker Hub...'
                    bat '''
                    echo %DOCKERHUB_CREDENTIALS_PSW% | docker login -u %DOCKERHUB_CREDENTIALS_USR% --password-stdin
                    docker push %IMAGE_NAME%:latest
                    '''
                }
            }
        }

        stage('Deploy on EC2 (Optional)') {
            steps {
                script {
                    echo 'Deploying container on EC2 instance...'
                    bat '''
                    ssh -o StrictHostKeyChecking=no ubuntu@16.171.224.225 ^
                    "docker pull %IMAGE_NAME%:latest && docker run -d -p 80:80 %IMAGE_NAME%:latest"
                    '''
                }
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}
