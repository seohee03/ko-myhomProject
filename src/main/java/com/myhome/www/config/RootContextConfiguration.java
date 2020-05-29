package com.myhome.www.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 * root-context.xml
 * 루트 컨텍스트 설정파일 : DB 설정, 공유 파일, mybatis 설정
 */
@Configuration
@Import({
  ContextDataSource.class	//두개 import해서 쓴다
, ContextSqlMapper.class
})
@ComponentScan(basePackages = {
		"com.myhome.www.item.service.impl",
		"com.myhome.www.member.service.impl",
		"com.myhome.www.store.service.impl",
		"com.myhome.www.article.service.impl"
		})//"com.myhome.www"	//db 관련한 부분만 읽는거임
public class RootContextConfiguration {
}
