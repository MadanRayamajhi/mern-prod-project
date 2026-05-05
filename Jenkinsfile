pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/MadanRayamajhi/mern-prod-project.git'
            }
        }

        // 🔍 DEBUG STAGE (very important for your case)
        stage('Debug Structure') {
            steps {
                sh '''
                    echo "Current Directory:"
                    pwd

                    echo "Root Files:"
                    ls -la

                    echo "Frontend Folder:"
                    ls -la frontend || true

                    echo "Check package.json:"
                    cat frontend/package.json || true
                '''
            }
        }

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
            // Attempt to use docker-compose (hyphenated)
            // Use 'true' to prevent the pipeline from crashing if 'down' fails 
            // (e.g., if it's the first time running)
            sh 'docker-compose down || true'
            sh 'docker-compose up --build -d'
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
        always {
            cleanWs()
        }
    }
}
