FROM tomcat:9.0-jdk17-temurin

LABEL maintainer="Richk <richkmeli@gmail.com>"

RUN rm -rf /usr/local/tomcat/webapps/ROOT/*

COPY target/*.war /usr/local/tomcat/webapps/Richkware-Manager-Server.war

EXPOSE 8080

ENV DB_HOST=db \
    DB_PORT=3306 \
    DB_USERNAME=root \
    DB_PASSWORD=changeme \
    ENCRYPTION_KEY=changeme \
    DEBUG_MODE=false

HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
  CMD curl -f http://localhost:8080/Richkware-Manager-Server/ || exit 1
