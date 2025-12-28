package it.richkmeli.rms.web.v2;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Controller
public class RootController {

    @GetMapping("/")
    public void root(javax.servlet.http.HttpServletRequest request, HttpServletResponse response) throws IOException {
        String context = request.getContextPath();
        if (context == null || context.isEmpty()) {
            response.sendRedirect("/index");
        } else {
            response.sendRedirect(context + "/index");
        }
    }

    @GetMapping(value = "/index", produces = MediaType.TEXT_HTML_VALUE)
    @ResponseBody
    public String index() throws IOException {
        Resource resource = new ClassPathResource("/static/html/index.html");
        if (resource.exists()) {
            return StreamUtils.copyToString(resource.getInputStream(), StandardCharsets.UTF_8);
        }
        return "<h1>Richkware Manager Server</h1><p>Server is running</p>";
    }
}
