pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                git 'https://github.com/<your-username>/jenkins-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t yourdockerhubusername/jenkins-demo:latest .'
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh """
                    echo $PASSWORD | docker login -u $USERNAME --password-stdin
                    docker push $USERNAME/jenkins-demo:latest
                    """
                }
            }
        }
    }
}
