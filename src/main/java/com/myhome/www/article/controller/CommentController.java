package com.myhome.www.article.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	//수정하기에서 완료버튼 누르면
		@RequestMapping(value ="/community/commentUpdate",  method = RequestMethod.POST)
		public int updateComment(Comment comment, @RequestParam int commentNo, @RequestParam String commentContent) throws Exception{
			System.out.println("commentNo>>>>" +commentNo);
			System.out.println("commentContent>>>>"+ commentContent);
			int data = 0;
			int result;
			result = commentService.modifyComment(comment);
			System.out.println("result >>>>>>"+ result);
			if(result > 0) {
				data = 0;
			} else {
				data = 9;
			}
			return data;
		}
		
		//삭제버튼 누르면
		@RequestMapping(value ="/community/commentDelete/{commentNo}", method = RequestMethod.POST)
		public int deleteComment(@PathVariable int commentNo) throws Exception{
			System.out.println("commentNo>>>>>>>" + commentNo);
			int data = 0;
			int result;
			result = commentService.deleteComment(commentNo);
			System.out.println("result>>>>>>"+ result);
			if(result > 0) {
				System.out.println("성공");
				data = 0;
			}else {
				System.out.println("실패");
				data = 9;
			}
			return data;
		}
}
