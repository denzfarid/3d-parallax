pipeline {
    agent {
        docker {
            image 'docker:stable' 
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials')
        DOCKER_IMAGE = "oblivionx/parallax-3d" // Ganti dengan nama repository Docker Hub Anda
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/webdiscus/parallax-3d-lens-effect.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh """
                    docker build -t $DOCKER_IMAGE:latest .
                    """
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    sh """
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                    docker push $DOCKER_IMAGE:latest
                    """
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline selesai dijalankan.'
        }
    }
}
