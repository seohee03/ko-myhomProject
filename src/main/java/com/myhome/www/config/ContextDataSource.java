package com.myhome.www.config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 데이터베이스 설정
 */
@Configuration
// 어노테이션 기반 트랜잭션 관리를 사용  <tx:annotation-driven>
@EnableTransactionManagement
public class ContextDataSource {
	
	@Bean(destroyMethod="close")
	public DataSource dataSource() {
		DataSource dataSource = new DataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/project1?serverTimezone=UTC");
		dataSource.setUsername("root");
		dataSource.setPassword("admin");
		dataSource.setDefaultAutoCommit(false);
		return dataSource;
	}
	
    @Bean
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource());
    }
}
