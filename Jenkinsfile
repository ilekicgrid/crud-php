pipeline {
    agent any 
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Clone repository') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    app = docker.build("crud-php")
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('837222496434.dkr.ecr.eu-central-1.amazonaws.com/crud-php','ecr:eu-central-1:aws-credentials')
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                }
            }
        }
    }
}
