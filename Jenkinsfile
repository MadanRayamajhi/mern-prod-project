pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_COMMAND = "docker-compose"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/MadanRayamajhi/mern-prod-project.git', branch: 'main'    
            }
        }

        stage('Install Backend Dependencies') {
            steps {
                dir('backend') {
                    sh 'npm install'
                }
            }
        }

        stage('Install Frontend Dependencies') {
            steps {
                dir('frontend') {
                    sh 'npm install'
                }
            }
        }

        stage('Build Frontend') {
            steps {
                dir('frontend') {
                    sh 'npm run build'  
                }
            }
        }

        stage('Docker Compose Deploy') {
            steps {
                script {
                    sh 'docker-compose down || true'
                    sh 'docker-compose up --build -d'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Deployment Successful'
            echo 'Access at: http://localhost:3000'
        }
        failure {
            echo '❌ Deployment Failed'
        }
    }
}
