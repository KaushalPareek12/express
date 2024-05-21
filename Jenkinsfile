pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "my-note-app"
    }
     
    stages {
        stage("Clone Code") {
            steps {
                echo "Cloning the code"
                git url: "https://github.com/KaushalPareek12/express.git", branch: "main"
            }
        }
        
        stage("Build") {
            steps {
                echo "Building the image"
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }
        
        stage("Push to Docker Hub") {
            steps {
                echo "Pushing the image to Docker Hub"
                withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]) {
                    sh "echo ${dockerHubPass} | docker login -u ${dockerHubUser} --password-stdin"
                    sh "docker tag ${DOCKER_IMAGE} ${dockerHubUser}/${DOCKER_IMAGE}:latest"
                    sh "docker push ${dockerHubUser}/${DOCKER_IMAGE}:latest"
                }
            }
        }
        
        stage("Deploy") {
            steps {
                echo "Deploying the container"
                sh "docker-compose down || true && docker-compose up -d"
            }
        }
    }
}

