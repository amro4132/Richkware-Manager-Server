package it.richkmeli.rms.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("classpath:/static/", "/resources/");
        
        // Serve HTML files from static/html/ at both root paths (e.g., /login.html) and /html/ (e.g., /html/devices.html)
        registry.addResourceHandler("/*.html", "/html/*.html")
                .addResourceLocations("classpath:/static/html/");
        
        // Serve JS/CSS/IMG from static folder at root
        registry.addResourceHandler("/js/**", "/css/**", "/img/**")
                .addResourceLocations("classpath:/static/js/", "classpath:/static/css/", "classpath:/static/img/");
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("forward:/resources/html/index.html");
    }
}
