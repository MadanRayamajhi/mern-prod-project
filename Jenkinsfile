pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/MadanRayamajhi/mern-prod-project.git'
            }
        }

        stage('Install Backend') {
            steps {
                dir('backend') {
                    sh '''
                        curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
                        apt-get install -y nodejs
                        npm install
                    '''
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
                sh 'docker-compose down || true'
                sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            echo "✔ SUCCESS"
        }
        failure {
            echo "❌ FAILED"
        }
    }
}
