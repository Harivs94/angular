pipeline {
    agent any
    tools {
        nodejs '16.17.0'
    }
    stages {
       
        stage('Build docker image') {
            steps {
                sh 'DOCKER_BUILDKIT=1 docker build -t harivs94/angular .'
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
        stage('Run container and Deploy'){
            steps {
                sh 'docker-compose down -v'
                sh 'docker-compose up -d'
            }
        }
        
    }
}
