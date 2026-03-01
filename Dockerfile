# المرحلة الأولى: بناء التطبيق باستخدام Maven
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# المرحلة الثانية: تشغيل التطبيق باستخدام Tomcat
FROM tomcat:9-jdk17
WORKDIR /usr/local/tomcat
RUN rm -rf webapps/*

# نسخ الملف الناتج من مرحلة البناء إلى Tomcat
COPY --from=build /app/target/Richkware-Manager-Server.war webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
