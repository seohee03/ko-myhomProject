package com.myhome.www.article.service;

import java.util.List;

import com.myhome.www.article.dto.Comment;

public interface CommentService {

	// 글번호로 댓글 조회
	List<Comment> selectCommentByNo(int articleNo) throws Exception;
}
