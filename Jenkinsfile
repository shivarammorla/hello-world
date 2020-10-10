pipeline {
    agent { node {label 'node'}
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
        stage('Maven Test'){
            steps{
                
                sh "$mvnHome/bin/mvn --version"
                sh "$mvnHome/bin/mvn clean test surefire-report:report"
                }
        }
    }
