# Base image with Tomcat 9 and JRE 11
FROM tomcat:9.0-jdk11-openjdk

# Deprecated maintainer instruction replacement
LABEL maintainer="Richk <richkmeli@gmail.com>"

# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/ROOT/*

# Copy the built WAR file to Tomcat webapps directory
COPY target/*.war /usr/local/tomcat/webapps/Richkware-Manager-Server.war


EXPOSE 8080


EXPOSE 3306:3306
EXPOSE 8080:80
