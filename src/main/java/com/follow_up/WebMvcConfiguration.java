package com.follow_up;
 
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//import com.model.contents.*;
 
@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
 
        
        registry.addResourceHandler("/contents/storage/**")
                        .addResourceLocations("file:///" + UploadCon.getUploadDir());

        registry.addResourceHandler("/images/storage/**")
                .addResourceLocations("file:///" + UploadImage.getUploadDir());
//        registry.addResourceHandler("/member/storage/**")
//                 .addResourceLocations("file:///" + UploadMem.getUploadDir());
    }




    //cors 설정
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:3000")
                .allowedMethods("OPTIONS", "GET", "POST", "PUT", "DELETE");
    }


}