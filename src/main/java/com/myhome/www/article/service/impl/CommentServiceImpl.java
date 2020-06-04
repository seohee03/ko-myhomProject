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

	//글번호로 댓글 조회
	@Override
	public List<Comment> selectCommentByNo(int articleNo) throws Exception {
		return commentDao.selectCommentByNo(articleNo);
	}

	
	
}
