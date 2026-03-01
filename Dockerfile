# استخدام نسخة Tomcat جاهزة
FROM tomcat:9-jdk17
WORKDIR /usr/local/tomcat

# حذف الملفات الافتراضية
RUN rm -rf webapps/*

# تحميل الملف الجاهز مباشرة من رابط المبرمج الأصلي (Releases)
ADD https://github.com/richkmeli/Richkware-Manager-Server/releases/download/v1.1.5/Richkware-Manager-Server.war webapps/ROOT.war

# فتح المنفذ 8080
EXPOSE 8080

# تشغيل السيرفر
CMD ["catalina.sh", "run"]
