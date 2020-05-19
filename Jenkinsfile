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
	   		    
           
            }
}
       	       	     	         

