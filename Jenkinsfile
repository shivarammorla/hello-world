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
	   		    
           stage('Artifacts to S3'){
                steps{
                    script {
		        //s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'samplehellow', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'ap-south-1', showDirectlyInBrowser: false, sourceFile: '**/webapp/target/*.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'S3Deploy', userMetadata: []
			//aws elasticbeanstalk update-environment --environment-name "HelloWorld-env" --version-label "hello-world-source" --region ap-south-1
		    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'DeploytoS3', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
         sh "aws s3 ls"
			    BuildName="version-$BUILD_NUMBER"
			    sh "sudo mkdir /opt/$BuildName"
			  //sh "cp /var/lib/jenkins/workspace/Shared-Lib@2/webapp/target/*.war /opt/webapp"
			    //sh "aws s3 cp **/webapp/target/*.war s3://samplehello/"
			    
		    }
		    }
		}	
			    }
            }
		
        }	       	     	         

