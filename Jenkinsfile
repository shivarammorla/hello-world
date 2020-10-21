pipeline {
    agent any
     
     tools {

        maven "maven-3.6.3"
       
    }
    stages{
        stage('checkout'){
            steps{
                git credentialsId: 'github-creds', url: 'https://github.com/shivarammorla/hello-world.git'
            }
        }
        stage('Junit') {
            steps {
                sh 'mvn test'
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
