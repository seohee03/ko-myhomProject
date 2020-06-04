package com.myhome.www.article.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myhome.www.article.dto.Comment;

@Repository
public interface CommentDao {
	
	//글번호로 댓글 조회
	List<Comment> selectCommentByNo(int articleNo) throws Exception;
}
