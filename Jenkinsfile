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
                      script{
		    	   s3CopyArtifact buildSelector: lastSuccessful(), excludeFilter: '', filter: 'webapp/target/webapp.war', flatten: false, optional: false, projectName: 'Shared-Lib', target: 's3:samplehellow/Shared-Lib'
                        echo "S3 bucket"
                      	}
               	     }  
                 }
              
            }
		
           }	       	     	         
