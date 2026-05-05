pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                echo " Cloning repo..."
                git branch: 'main', url: 'https://github.com/madanrayamajhi/mern-prod-project.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo " Installing backend & frontend deps..."

                dir('backend') {
                    sh 'npm install'
                }

                dir('frontend') {
                    sh 'npm install'
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                echo " Deploying full stack..."

                sh 'docker-compose down || true'
                sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            script {
                currentBuild.description = "✔️ SUCCESS"
            }
            echo "✔️ CI/CD SUCCESS"
        }

        failure {
            script {
                currentBuild.description = "❌ FAILED"
            }
            echo "❌ CI/CD FAILED"
        }
    }
}
