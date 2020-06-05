package com.myhome.www.article.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myhome.www.article.dto.Comment;

@Repository
public interface CommentDao {
	
	//글번호로 댓글 조회
	List<Comment> selectCommentByNo(int articleNo) throws Exception;
	//댓글 등록
	int insertComment(Comment comment) throws Exception;
	// 댓글 수정
	int modifyComment(Comment comment) throws Exception;
}
