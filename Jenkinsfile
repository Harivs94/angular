pipeline {
    agent any
    tools {
        nodejs '16.17.0'
    }
    stages {
        stage('SCM') {
            steps {
                git branch: 'angular', url: 'https://github.com/Harivs94/angular.git'
            }
        }
        stage('Install Deps') {
            steps {
                sh 'npm install'
                sh 'ng build'
            }
        }
        stage('Build docker image') {
            steps {
                sh 'docker build -t harivs94/angular .'
            }
        }
        stage('Push docker image') {
            steps {
                withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhub')]) {
                    sh "docker login -u harivs94 -p ${dockerhub}"
                    sh 'docker push harivs94/angular:latest'
                }
            }
        }
        stage('Run container'){
            steps {
                sh 'docker-compose down -v'
                sh 'docker-compose up -d'
            }
        }
        
    }
}
