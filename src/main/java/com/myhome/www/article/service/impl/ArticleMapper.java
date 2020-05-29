package com.myhome.www.article.service.impl;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ArticleMapper {

	@Delete("delete from article where article_no = #{articleNo}")
	public int delArticle(@Param("articleNo") int articleNo);
	
}
