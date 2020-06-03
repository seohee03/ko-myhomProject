package com.myhome.www.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.myhome.www.member.service.AuthInfo;
import com.myhome.www.member.service.LoginService;
import com.myhome.www.member.service.MemberService;
import com.myhome.www.member.service.RegisterRequest;

@Controller
public class SocialLoginController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/naverLogin")
	public String submit(
			HttpServletRequest request, 
			HttpSession session, 
			HttpServletResponse response) throws Exception {
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("id");
		String memberName = request.getParameter("name");
		System.out.println(">>>>>>>>>>>>>> memberId : " + memberId);
		System.out.println(">>>>>>>>>>>>>> memberName : " + memberName);
		System.out.println(">>>>>>>>>>>>>> memberPw : " + memberPw);
		RegisterRequest registerRequest = new RegisterRequest();
		registerRequest.setMemberId(memberId);
		registerRequest.setMemberName(memberName);;
		registerRequest.setMemberPw(memberPw);
		registerRequest.setConfirmPassword(memberPw);
		//회원 테이블에 같은 아이디가 있는지 확인
		int result = memberService.idCheck(registerRequest);
		if(result == 0) {	//중복된 아이디 없으면 디비에 저장(회원가입시킴)
			memberService.insertMember(registerRequest);
		} 
		// 중복된 아이디가 있을 때
		AuthInfo authInfo = loginService.authenticate(memberId, memberPw);
		session.setAttribute("authInfo", authInfo);
		
		return "index";
	}
}
