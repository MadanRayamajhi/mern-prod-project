pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_COMMAND = "docker-compose"
    }

    tools {
        nodejs 'NodeJS-14'  
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/your-repo/mern-prod-project.git', branch: 'main'    
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
                    sh 'docker-compose down --volumes --remove-orphans || true'
                    sh 'docker-compose up --build -d'
                }
            }
        }
    }

    post {
        always {
            cleanWs()  
        }
        success {
            echo '✅ Deployment Successful'
            echo 'Access at: http://localhost:3000 (Frontend) and http://localhost:5000 (Backend)'
        }
        failure {
            echo '❌ Deployment Failed'
            sh 'docker-compose logs'
        }
    }
}