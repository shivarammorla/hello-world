#!/usr/bin/env groovy
@Library('shared-library@master') _

pipeline {
    agent { node {label 'node'}
     }
    environment{
      mvnHome = tool 'maven-3.6.3'
        echo "$BUILD_ID"
    }
    stages{
        stage('checkout'){
            steps{
                git credentialsId: 'git-token', url: 'https://github.com/Harshaguptha/hello-world.git'
            }
        }
        stage('Maven Test'){
            steps{
                //mvnHome = tool 'maven-3.6.3'
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
        //stage('deployment of application using docker'){
          //  steps{
            //    sh "docker version"
              //  sh "docker stop helloworld"
              //   sh "docker rm helloworld"
              //  sh "docker rmi harshajaya/helloworld:newtag"
              //  sh "docker build -t harshajaya/helloworld:newtag -f Dockerfile ."
              //  sh "docker run --name helloworld -p 8282:8080 -d harshajaya/helloworld:newtag"
               // withDockerRegistry(credentialsId: 'docker-hub-registry',url: 'https://hub.docker.com') {
                //        sh "docker push harshajaya/helloworld:newtag"
                        //Added the credentials
                  //  }
                //}
            //}
        //}
        stage('artifacts to s3'){
            steps{
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'deploytos3', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh "aws s3 ls"
                    sh "aws s3 mb s3://helloworld-bucket-for-aws"
                    sh "aws s3 cp webapp/target/*.war s3://helloworld-bucket-for-aws/$BUILD_ID"

                }
            }
        }
        stage('Check logs'){
            steps{
                filterLogs ('WARNING', 1)
            }
        }

    }
}