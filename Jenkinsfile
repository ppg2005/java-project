
	//======================================================MAVEN BUILD PIPELINE JAVA ================================
	
	pipeline {
    agent any
    
    stages { 
        stage("Code") {
            steps {
                git url: "https://github.com/ppg2005/java-project.git", branch: "master"
                echo "Code has been cloned"
            }
        }
        
        stage("Build and Test") {
            steps {
                sh "mvn clean package" // Replace this with your Maven build command
                echo "Java project has been built and tested"
                
            }
        }
        
        stage("Push to Docker Hub") {
            steps {
                
                sh "docker build -t hello-world-java:latest ."
				echo "Docker image has been built "
                withCredentials([usernamePassword(credentialsId: "dockerhub", passwordVariable: "dockerHubPass" ,usernameVariable: "dockerHubUser")]){
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker tag hello-world-java:latest ${env.dockerHubUser}/hello-world-java:latest"
                    sh "docker push ${env.dockerHubUser}/node-app-test-new:latest"
                    echo "Code has been pushed to Docker Hub"
                }
            }
        }
        
        stage("Deploy") {
            steps {
                echo "Code has been deployed"
            }
        }
    }
}
