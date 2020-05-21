# Pull base image 
#From tomcat:8-jre8

# Maintainer 
#MAINTAINER "valaxytech@gmail.com"
#COPY ./webapp.war /usr/local/tomcat/webapps
FROM tomcat:8.5.16-jre8-alpine
# Take the war and copy to webapps of tomcat
COPY webapp/target/webapp.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
