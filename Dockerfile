FROM eclipse-temurin:17-jre-alpine

LABEL maintainer="Richk <richkmeli@gmail.com>"

WORKDIR /app

COPY target/*.jar app.jar

EXPOSE 8080

ENV DB_HOST=db \
    DB_PORT=3306 \
    DB_USERNAME=richk \
    DB_PASSWORD=changeme \
    ENCRYPTION_KEY=changeme \
    DEBUG_MODE=false \
    SPRING_PROFILES_ACTIVE=docker

HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/health || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]
