pipeline {
    agent any
     
    
    stages{
        stage('checkout'){
            steps{
                git credentialsId: 'github-creds', url: 'https://github.com/shivarammorla/hello-world.git'
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
    }
}
