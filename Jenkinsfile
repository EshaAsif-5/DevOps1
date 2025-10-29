pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                git branch: 'main', url: 'https://github.com/EshaAsif-5/DevOps1.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                bat 'echo Building Docker image...'
                // If Docker is installed, then use:
                // bat 'docker build -t yourimagename .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                bat 'echo Pushing image to DockerHub...'
                // bat 'docker push yourimagename'
            }
        }
    }
}
