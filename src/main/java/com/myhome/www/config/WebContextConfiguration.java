package com.myhome.www.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
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
		"com.myhome.www.article.controller"
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
//
//	@Override
//	public void configureViewResolvers(ViewResolverRegistry registry) {
//		registry.jsp("/WEB-INF/view/", ".jsp");
//	}
//

//
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/mypage/**");
		//registry.addInterceptor(adminauthCheckInterceptor()).addPathPatterns("/admin/**");
	}

	@Bean
	public AuthCheckInterceptor authCheckInterceptor() {
		return new AuthCheckInterceptor();
	}
	
//	@Bean
//	public AdminAuthCheckInterceptor adminauthCheckInterceptor() {
//		return new AdminAuthCheckInterceptor();
//	}
//
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
		ms.setBasenames("message.label");
		ms.setDefaultEncoding("UTF-8");
		return ms;
	}
    
}
