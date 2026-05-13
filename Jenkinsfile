pipeline {
    agent any
<<<<<<< HEAD
=======

>>>>>>> 6ee26683e9ebc2bbb19455a28f434f7412fe4220
    stages {
        stage("Checkout Code") {
            steps {
<<<<<<< HEAD
                git url: "https://github.com/MadanRayamajhi/mern-prod-project.git", branch: "main"
            }
        }
        stage("Install Dependencies") {
=======
                git url: 'https://github.com/MadanRayamajhi/mern-prod-project.git', branch: 'main'
            }
        }

        stage('Install Node.js') {
            steps {
                sh 'apt-get update && apt-get install -y nodejs npm'
            }
        }

        stage('Install Backend') {
>>>>>>> 6ee26683e9ebc2bbb19455a28f434f7412fe4220
            steps {
                dir("backend") { sh "npm install" }
                dir("frontend") { sh "npm install" }
            }
        }
<<<<<<< HEAD
        stage("Build Frontend") {
=======

        stage('Install Frontend') {
>>>>>>> 6ee26683e9ebc2bbb19455a28f434f7412fe4220
            steps {
                dir("frontend") { sh "npm run build" }
            }
        }
        stage("Deploy") {
            steps {
<<<<<<< HEAD
                sh "docker compose up -d --build"
=======
                dir('frontend') {
                    sh 'npm run build'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker compose up -d --build'
>>>>>>> 6ee26683e9ebc2bbb19455a28f434f7412fe4220
            }
        }
    }
    post {
<<<<<<< HEAD
        success { echo "✅ Deployment Successful" }
        failure { echo "❌ FAILED" }
=======
        success {
            echo '✅ Deployment Successful'
        }
        failure {
            echo '❌ FAILED'
        }
>>>>>>> 6ee26683e9ebc2bbb19455a28f434f7412fe4220
    }
}
