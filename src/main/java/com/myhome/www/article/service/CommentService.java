package com.myhome.www.article.service;

import java.util.List;

import com.myhome.www.article.dto.Comment;

public interface CommentService {

	// 글번호로 댓글 조회
	List<Comment> selectCommentByNo(int articleNo) throws Exception;
	// 댓글 등록
	int insertComment(Comment comment) throws Exception;
	// 댓글 수정
	int modifyComment(Comment comment) throws Exception;
}
