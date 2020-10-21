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
            
           // nexusArtifactUploader artifacts: [[artifactId: 'java-maven-junit-helloworld', classifier: '', file: 'target/java-maven-junit-helloworld-2.0-SNAPSHOT.jar', type: 'jar']], credentialsId: '397aa6b7-4dbc-499a-8841-945dc17b225b', groupId: 'com.example', nexusUrl: 'http://15.206.66.142:8081', nexusVersion: 'nexus2', protocol: 'http', repository: 'hcltraining', version: '2.0-SNAPSHOT'
            nexusArtifactUploader artifacts: [[artifactId: 'maven-project', classifier: '', file: 'webapp/target/webapp.war', type: 'jar']], credentialsId: '397aa6b7-4dbc-499a-8841-945dc17b225b', groupId: 'com.example.maven-project', nexusUrl: '15.206.66.142:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'hcltraining', version: '1.0-SNAPSHOT'
            }
            <!--tetstst--->
        }
    }
}
