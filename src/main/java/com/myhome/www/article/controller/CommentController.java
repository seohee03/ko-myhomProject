package com.myhome.www.article.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myhome.www.article.dto.Comment;
import com.myhome.www.article.service.CommentService;
import com.myhome.www.member.service.AuthInfo;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;

	//댓글 등록 버튼을 누르면
	@ResponseBody
	@RequestMapping(value = "/community/insertComment", method = RequestMethod.POST)
	public int insertComment(Comment comment, HttpSession session) throws Exception {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>" + comment);
		AuthInfo authInfo = null;
		authInfo = (AuthInfo) session.getAttribute("authInfo");
		int data = 0;
		if(authInfo != null) {
			comment.setMemberNo(authInfo.getMemberNo());
			System.out.println(comment);
			//service불러서 댓글 insert
			int result;
			result = commentService.insertComment(comment);
			System.out.println(result + "result");
			//로그인 완료시
			if(result > 0) {
				data = 0;
			} else {
				data = 9;
			}
		}
		return data;
	}
	
//	@RequestMapping(value = "/community/modify/${commentNo}")
//	public String modifyComment(@PathVariable("commentNo") int commentNo) throws Exception{
//	System.out.println("controller>>>>> "+ commentNo);
//	//	int result = commentService.modifyComment(comment);
//		return "";
//	};
}
