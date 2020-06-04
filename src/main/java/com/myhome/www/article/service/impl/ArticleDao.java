package com.myhome.www.article.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.myhome.www.article.dto.Article;
import com.myhome.www.article.dto.ArticlePage;

@Repository
public interface ArticleDao {
    
	//게시글 전체 리스트
	List<Article> selectArticleList(ArticlePage page) throws Exception;	
	//글쓰기
	int insertArticle(Article article) throws Exception;
	//글번호조회
	Article selectArticleByNo(int articleNo) throws Exception;
	//글수정
	int updateArticle(Article article) throws Exception;
	//글삭제
	int deleteArticle(int articleNo) throws Exception;
	//조회수
	void increaseReadCount(int articleNo) throws Exception;
	//마지막등록글번호- 글등록하고 반환할 페이지 번호
	List<Integer> selectLastArticleNo() throws Exception;
	//키워드로 게시글 조회
	List<Article> selectSearchArticleList(@Param("keyword") String keyword) throws Exception;
	//검색 타입과 키워드로 게시글 조회
	List<Article> selectSearchTypeArticleList(@Param("searchType") String searchType, @Param("keyword") String keyword) throws Exception;
	//전체 글 갯수 조회
	int selectAllCount() throws Exception;
}
