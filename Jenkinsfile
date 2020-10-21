pipeline {
    agent any
     
    
    stages{
        stage('checkout'){
            steps{
                git credentialsId: 'github-creds', url: 'https://github.com/shivarammorla/hello-world.git'
            }
        }
        stage('build code from maven')
          {
         steps
            {
            sh 'mvn install'
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
