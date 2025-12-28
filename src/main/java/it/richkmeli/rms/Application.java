package it.richkmeli.rms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@ServletComponentScan("it.richkmeli.rms.web")
@SpringBootApplication(scanBasePackages = "it.richkmeli.rms")
public class Application extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);

        loadBeanFromConfigFile();
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }

    private static void loadBeanFromConfigFile() {
        // load bean from xml using try-with-resources to ensure context is closed
        try (ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-bean.xml")) {
            // If you need to retrieve beans from XML, uncomment and use the factory below
            // BeanFactory factory = (BeanFactory) context;
            // User user = (User) factory.getBean("user");
            // System.out.println(user.getName());
        } catch (Exception ex) {
            // Keep startup resilient if the XML bean file is missing or invalid
            ex.printStackTrace();
        }
    }


}
