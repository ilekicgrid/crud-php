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
                    app = docker.build("jenkins_repo")
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    docker.withRegistry("https://837222496434.dkr.ecr.eu-central-1.amazonaws.com/jenkins_repo","ecr:eu-central-1:aws-credentials")
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                }
            }
        }
    }
}
