package com.javaclimb.Qomolangma.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 解决跨域问题
 * 配置了一个全局的CORS（跨域资源共享）策略，允许来自任何来源的请求访问Web应用
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/**").addResourceLocations("/usr/local/Qomo/");
//
//    }


    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowedMethods("*")
                .allowCredentials(true);
    }
}
