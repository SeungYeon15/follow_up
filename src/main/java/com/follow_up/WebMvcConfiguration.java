package com.follow_up;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//import com.model.contents.*;
@RequiredArgsConstructor
@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {


        registry.addResourceHandler("/contents/storage/**")
                .addResourceLocations("file:///" + UploadCon.getUploadDir());



        registry.addResourceHandler("/images/storage/**")
                .addResourceLocations("file:///" + UploadImage.getUploadDir());



        registry.addResourceHandler("/member/storage/**")
                 .addResourceLocations("file:///" + UploadMem.getUploadDir());


    }


    @Override
    public void addCorsMappings(CorsRegistry registry){
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:8000", "http://18.217.50.87:8000",
                        "http://localhost:3000",
                        "https://localhost:3000",
                        "https://127.0.0.1:3000",
                        "http://18.217.50.87:3000"
                )
                .allowedMethods("GET", "POST", "PUT", "DELETE")
                .allowedHeaders("*") // 어떤 헤더들을 허용할 것인지
                .allowCredentials(true) // 쿠키 요청을 허용한다(다른 도메인 서버에 인증하는 경우에만 사용)
                .maxAge(3600);

    }
}