#!/usr/bin/env groovy
@Library('shared-library@master') _ //master or whatever branch
pipeline{
      agent any
        stages{
		    stage('check out'){
                steps{
                    script{
		    	        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Harshaguptha/hello-world.git']]])
                      	  }
               	     }  
                 }	
            stage('maven build'){
                steps{
                    script{
		    	        sh "mvn clean install"
                      	  }
               	     }  
                 }	
            stage ('Check logs') {
                steps {
                    filterLogs ('WARNING', 1)
                    }
                }
            stage ('Zip') {
                steps {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'DeploytoS3', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        sh "aws s3 ls"
                        sh "sudo mkdir /opt/$BuildName"
                        sh "sudo mv /var/lib/jenkins/workspace/Shared-Lib@2/webapp/target/*.war /opt/*.war"
                    }
                }
                stage ('Moving to S3') {
                    steps {
                        s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'samplehellow', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'ap-south-1', showDirectlyInBrowser: false, sourceFile: '/opt/*.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'S3Deploy', userMetadata: []
                    }
                }
            }
        }
}
       	       	     	         

