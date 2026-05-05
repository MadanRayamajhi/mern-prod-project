pipeline {
    agent any

    environment {
        // Define any environment variables here
        DOCKER_COMPOSE_COMMAND = "docker-compose" 
    }

    stages {
        stage('Install Backend') {
            steps {
                dir('backend') {
                    sh 'npm install'
                }
            }
        }

        stage('Install Frontend') {
            steps {
                dir('frontend') {
                    sh 'npm install'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Using hyphenated docker-compose for older environments
                    sh 'docker-compose down || true'
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
        }
        failure {
            echo '❌ FAILED'
        }
    }
} 
