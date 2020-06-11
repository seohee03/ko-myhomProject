package com.myhome.www.article.service;

import java.util.List;

import com.myhome.www.article.dto.Comment;

public interface CommentService {

	//댓글 조회
	List<Comment> selectComment(Comment comment) throws Exception;
	// 댓글 등록
	int insertComment(Comment comment) throws Exception;
	// 댓글 수정
	int modifyComment(Comment comment) throws Exception;
	// 댓글 삭제
	int deleteComment(int commentNo) throws Exception;
	//전체 글 갯수 조회
	int selectAllCount(int articleNo) throws Exception;
}
