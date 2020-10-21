pipeline {
    agent any
     }
    environment{
      mvnHome = tool 'maven-3.6.3'
        
    }
    stages{
        stage('checkout'){
            steps{
                git credentialsId: 'git-token', url: 'https://github.com/shivarammorla/hello-world.git'
            }
        }
        
        }
