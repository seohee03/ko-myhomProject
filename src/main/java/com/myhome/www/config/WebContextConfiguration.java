package com.myhome.www.config;

import java.io.IOException;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.myhome.www.util.AdminAuthCheckInterceptor;
import com.myhome.www.util.AuthCheckInterceptor;


/**
 * 웹 컨텍스트 설정파일 : web mvc 설정 - 뷰리졸버, 메세지, 컨버터 등
 */
@Configuration
@EnableWebMvc
@PropertySource(value = {"classpath:/prop/common.properties"})
@ComponentScan(basePackages = {
		"com.myhome.www.item.controller",
		"com.myhome.www.member.controller",
		"com.myhome.www.store.controller",
		"com.myhome.www.article.controller",
		"com.myhome.www.controller"
		})
public class WebContextConfiguration  implements WebMvcConfigurer {
	
    @Bean
    public ViewResolver getViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/view/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
    
    
    @Override
	public void configureDefaultServletHandling(
			DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
    
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("index");
	}
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propSourcesPlaceHolerConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
	
//	@Bean
//	public static PropertySourcesPlaceholderConfigurer propSourcesPlaceHolerConfigurer() {
//		PropertySourcesPlaceholderConfigurer pspc = new PropertySourcesPlaceholderConfigurer();
//		pspc.setIgnoreUnresolvablePlaceholders(true);
//		return pspc;
//	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/mypage/**");
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/order");
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/orderSuccess");
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/community/insertComment");
		registry.addInterceptor(adminauthCheckInterceptor()).addPathPatterns("/admin/*");
	}

	@Bean
	public AuthCheckInterceptor authCheckInterceptor() {
		return new AuthCheckInterceptor();
	}
	
	@Bean
	public AdminAuthCheckInterceptor adminauthCheckInterceptor() {
		return new AdminAuthCheckInterceptor();
	}

	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
		ms.setBasenames("message.label");
		ms.setDefaultEncoding("UTF-8");
		return ms;
	}
	
	/* multipartResolver: file upload 라이브러리 빈 등록 */
	@Bean(name="multipartResolver") 
    public CommonsMultipartResolver getResolver() throws IOException{
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
         
        //Set the maximum allowed size (in bytes) for each individual file.
        resolver.setMaxUploadSizePerFile(5242880);//5MB
        //You may also set other available properties.
        //디스크에 임시 파일을 생성하기 전에 메모리에 보관할수있는 최대 바이트 크기 -->
        //resolver.setMaxInMemorySize(5242880);
        resolver.setDefaultEncoding("utf8");
        return resolver;
    }
	
	/* static file(image, sound, css, javascript) 경로 지정 */
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/assets/**").addResourceLocations("/assets/");
        registry.addResourceHandler("/upload/**").addResourceLocations("file:///c:/upload/");
    }
    
}
