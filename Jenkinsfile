#!/usr/bin/env groovy

@Library('shared-library@master') _ //master or whatever branch

pipeline{
      agent any

        stages{

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
		    	withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'DeploytoS3', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
			      {sh "aws s3 ls"
                        sh "aws s3 cp webapp/target/webapp.war s3:samplehellow/Shared-Lib"
                             	}
		      	     }
			
                 }
              
            }
		
           }	       	     	         
}
