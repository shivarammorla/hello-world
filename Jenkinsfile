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
        stage('package and generate artifacts'){
            steps{
                sh "$mvnHome/bin/mvn clean package -DskipTests=true"
              archiveArtifacts allowEmptyArchive: true, artifacts: 'webapp/target/*.war'
            }
        }
        
        stage('deployment of application using docker'){
            steps {
                sh "docker version"
               // sh "docker stop helloworld"
                //sh "docker rm helloworld"
                //sh "docker rmi shiva360/helloworld:update5"
                sh "docker build -t shiva360/helloworld:update5 -f Dockerfile ."
                sh "docker run --name helloworld -p 8080:8080 -d shiva360/helloworld:update5"
                withDockerRegistry(credentialsId: 'docker-hub-registry') {
                sh "docker push shiva360/helloworld:update5"
                }
            } 
        }
    }      
}   
