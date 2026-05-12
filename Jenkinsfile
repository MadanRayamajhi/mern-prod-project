pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/MadanRayamajhi/mern-prod-project.git', branch: 'main'
            }
        }

        stage('Install Node.js') {
            steps {
                sh '''
                    curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
                    apt-get install -y nodejs
                '''
            }
        }

        stage('Backend Install') {
            steps {
                dir('backend') {
                    sh 'npm install'
                }
            }
        }

        stage('Frontend Install') {
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
    }
}
