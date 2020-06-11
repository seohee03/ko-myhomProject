package com.myhome.www.article.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myhome.www.article.dto.Comment;
import com.myhome.www.article.service.CommentService;

@Service("commentService")
@Transactional
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentDao commentDao;

	//댓글 조회
	@Override
	public List<Comment> selectComment(Comment comment) throws Exception {
		return commentDao.selectComment(comment);
	}

	@Override
	public int insertComment(Comment comment) throws Exception {
		return commentDao.insertComment(comment);
	}

	@Override
	public int modifyComment(Comment comment) throws Exception {
		return commentDao.modifyComment(comment);
	}

	@Override
	public int deleteComment(int commentNo) throws Exception {
		System.out.println("service진입>>>>>>>>");
		return commentDao.deleteComment(commentNo);
	}

	@Override
	public int selectAllCount(int articleNo) throws Exception {
		return commentDao.selectAllCount(articleNo);
	}

	
}
