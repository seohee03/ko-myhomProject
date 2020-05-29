package com.myhome.www.article.service;

import java.util.List;

import com.myhome.www.article.dto.Article;

public interface ArticleService {

	//게시글 리스트
	List<Article> selectArticleList() throws Exception;	
	//글등록
	int insertArticle(Article article) throws Exception;
	//글번호로 조회
	Article selectArticleByNo(int articleNo) throws Exception;
	//글수정
	int updateArticle(Article article) throws Exception;
	//글삭제
	int deleteArticle(Article article) throws Exception;
	//등록한 글번호로 보기
	int selectLastArticleNo() throws Exception;
	
}