# 1. استخدام نسخة Tomcat مستقرة مع Java 17
FROM tomcat:9.0-jdk17-openjdk-slim

# 2. تحديد مسار العمل داخل السيرفر
WORKDIR /usr/local/tomcat

# 3. تنظيف جميع الملفات الافتراضية لضمان عدم حدوث تعارض (تجنب خطأ 404)
RUN rm -rf webapps/*

# 4. تحميل ملف السيرفر الجاهز مباشرة من الإصدارات الرسمية
# تسمية الملف ROOT.war (بأحرف كبيرة) تجعل Tomcat يشغله كصفحة رئيسية فوراً
ADD https://github.com/richkmeli/Richkware-Manager-Server/releases/download/v1.1.5/Richkware-Manager-Server.war webapps/ROOT.war

# 5. فتح المنفذ 8080 الذي يستخدمه Render
EXPOSE 8080

# 6. أمر تشغيل السيرفر ومنع إغلاقه تلقائياً
CMD ["catalina.sh", "run"]
