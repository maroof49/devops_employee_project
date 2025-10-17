pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = "your-dockerhub-username/employee-api"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/yourusername/employee-api-devops.git'
            }
        }

        stage('Build') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    docker.build(DOCKER_HUB_REPO, ".")
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        docker.image(DOCKER_HUB_REPO).push("latest")
                    }
                }
            }
        }

        stage('Deploy to K8s') {
            steps {
                sh 'kubectl apply -f k8s/'
            }
        }
    }
}
