@Library('shared-library@master') _
def mvnHome

node('node'){
   stage('git checkout'){
      try {
       git credentialsId: 'git-token', url: 'https://github.com/Harshaguptha/hello-world.git'

      } catch(err) {
         sh "echo error in checkout"
      }
   }

   stage('maven test'){
    try{
      mvnHome=tool 'maven-3.6.3'
      sh "$mvnHome/bin/mvn --version"
      sh "$mvnHome/bin/mvn clean test surefire-report:report"
      } catch(err) {
       sh "echo error in defining maven"
      }
    }

   //stage('test case and report'){
     // try {
       // echo "executing test cases"
         //junit allowEmptyResults: true, testResults: 'addressbook_main/target/surefire-reports/*.xml'
         //publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'addressbook_main/target/site', reportFiles: 'surefire-report.html', reportName: 'SureFireReportHTML', reportTitles: ''])

      //} catch(err){
        // throw err
         //}
   //}

   stage('package and generate artifacts'){
      try {
         sh "$mvnHome/bin/mvn clean package -DskipTests=true"
         archiveArtifacts allowEmptyArchive: true, artifacts: 'webapp/target/*.war'
      } catch(err) {
         sh "echo Hi Hellow"
         sh "echo error in packaging and generating artifacts"
      }
   }

    stage('deployment of application using docker'){
       try {
        sh "docker version"
        sh "docker stop helloworld"
        sh "docker rm helloworld"
        sh "docker rmi harshajaya/helloworld:newtag"
        sh "docker build -t harshajaya/helloworld:newtag -f Dockerfile ."
        sh "docker run --name helloworld -p 8282:8080 -d harshajaya/helloworld:newtag"
        withDockerRegistry(credentialsId: 'docker-hub-registry') {
        sh "docker push harshajaya/helloworld:newtag"
        }
       } catch(err) {
         sh "echo error in deployment using docker"
       }
    }

   //stage('deployment of an application'){
     // try {
       //  sshagent(['target-key-shared']) {
         //   sh "scp -o StrictHostKeyChecking=no tomcat.sh ec2-user@10.0.0.137:/tmp"
           // sh "scp -o StrictHostKeyChecking=no symlink_target.sh ec2-user@10.0.0.137:/tmp"
           // sh "ssh -o StrictHostKeyChecking=no ec2-user@10.0.0.137 /tmp/tomcat.sh"
            //sh "scp -o StrictHostKeyChecking=no addressbook_main/target/addressbook.war ec2-user@10.0.0.137:/tmp"
            //sh "ssh -o StrictHostKeyChecking=no ec2-user@10.0.0.137 /tmp/symlink_target.sh"
         //}
      //} catch(err){
        // echo "error in deployment of an application"
      //}
   //}
   //
   stage('check logs'){
       try{ filterLogs ('WARNING', 1)
         } catch(err) {

         }
       }
   stage('artifacts to s3'){
      try {
       withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'deploytos3', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
            sh "aws s3 ls"
          sh "aws s3 mb s3://helloworld-bucket-for-aws"
         sh "aws s3 cp webapp/target/*.war s3://helloworld-bucket-for-aws"
         }
      } catch(err) {
        sh "echo error in sending artifacts to s3"
      }
   }
}
