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
//                 script{
//                     git "https://github.com/ilekicgrid/Ansible-for-jenkins.git"
//                 }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('https://837222496434.dkr.ecr.eu-central-1.amazonaws.com/jenkins_repo','ecr:eu-central-1:aws-credentials') {
                        app.push("${env.BUILD_NUMBER}")  
                        app.push("latest")
                    }
                script{
                    ansiblePlaybook become: true, credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'my_ansible', inventory: 'hosts.yml', playbook: 'sytes.yml' 
                }
                }
            }
        }
    }
}