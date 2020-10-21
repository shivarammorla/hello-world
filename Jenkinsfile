pipeline {
    agent any
     
     
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
        stage('Upload war to nexus') {
            steps {
              nexusArtifactUploader artifacts: [[artifactId: 'hello', classifier: '', file: 'target/hello-1.0.war', type: 'war']], credentialsId: 'newnexus', groupId: 'com.boxfuse.samples', nexusUrl: 'http://15.206.66.142:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'hcltraining', version: '1.0'
            }
        }
    }
}
