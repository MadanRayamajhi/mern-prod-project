pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/MadanRayamajhi/mern-prod-project.git', branch: 'main'
            }
        }

        stage('Install Node') {
            steps {
                sh 'curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs'
            }
        }

        stage('Build Backend') {
            steps {
                dir('backend') {
                    sh 'npm install'
                }
            }
        }

        stage('Build Frontend') {
            steps {
                dir('frontend') {
                    sh 'npm install && npm run build'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            echo '✅ DEPLOYED: http://localhost:3000'
        }
    }
}
