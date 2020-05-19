#!/usr/bin/env groovy

@Library('shared-library@master') _ //master or whatever branch
@Library('github.com/releaseworks/jenkinslib') _

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
		        s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'samplehellow', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'ap-south-1', showDirectlyInBrowser: false, sourceFile: '**/webapp/target/*.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'S3Deploy', userMetadata: []
			aws elasticbeanstalk create-application-version --application-name "$ApplicationName" --version-label "$BuildName" --description "Build created from JENKINS. Job:$JOB_NAME, BuildId:$BUILD_DISPLAY_NAME, GitCommit:$GIT_COMMIT, GitBranch:$GIT_BRANCH" --source-bundle S3Bucket=samplehellow,S3Key=webapp/target/webapp.war --region ap-south-1		   
		    }
			
			    }
            }
		
        }	       	     	         
}
