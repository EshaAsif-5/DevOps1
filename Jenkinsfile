pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        EC2_SERVER = 'ubuntu@16.171.168.47'
        IMAGE_NAME = 'eshaasif5/devops-demo:latest'
    }

    stages {
        stage('Pull Code') {
            steps {
                git branch: 'main', url: 'https://github.com/EshaAsif-5/DevOps1.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Push to DockerHub') {
            steps {
                bat """
                docker login -u ${DOCKERHUB_CREDENTIALS_USR} -p ${DOCKERHUB_CREDENTIALS_PSW}
                docker push ${IMAGE_NAME}
                """
            }
        }

        stage('Deploy to EC2') {
            steps {
                echo "🚀 Deploying container to AWS EC2..."
                sshagent(['ec2-ssh-key']) {
                    bat """
                    ssh -o StrictHostKeyChecking=no ${EC2_SERVER} "
                        docker pull ${IMAGE_NAME} &&
                        docker stop devops-demo || true &&
                        docker rm devops-demo || true &&
                        docker run -d -p 80:80 --name devops-demo ${IMAGE_NAME}
                    "
                    """
                }
            }
        }
    }

    post {
        success {
            echo '✅ Deployment Successful!'
        }
        failure {
            echo '❌ Build Failed. Check logs.'
        }
    }
}
