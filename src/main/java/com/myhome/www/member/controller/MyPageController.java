package com.myhome.www.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myhome.www.member.dto.Member;
import com.myhome.www.member.service.AuthInfo;
import com.myhome.www.member.service.MemberService;

@Controller
public class MyPageController {

	@Resource(name = "memberService")
	private MemberService memberService;
	
	// 마이페이지 이동
	@RequestMapping("/mypage")
	public String goMypage(HttpSession session, Model model) throws Exception {
		if (session.getAttribute("authInfo") != null) {
			AuthInfo newAuthInfo = (AuthInfo) session.getAttribute("authInfo");
			Member member = memberService.selectMemberByNo(newAuthInfo.getMemberNo());

			model.addAttribute("member", member);
			return "mypage/mypageHome";
		}
		// 로그인 하지 않은 경우에 mypage 진입시 회원로그인 폼으로 보낸다
		return "redirect:/login";
	}

	//내가 쓴 글 리스트
//	@RequestMapping(value = "/mypage/myArticle")
//	public String myArticle() {
//		
//	}
	
	//회원 정보 수정 폼
//	@RequestMapping(value = "/mypage/modify")
//	public String myModify() {
//		
//	}
	
	//나의 주문 내역 리스트
//	@RequestMapping(value = "/mypage/myOrder")
//	public String myOrder() {
//		
//	}
	
	//회원 탈퇴 - 비밀번호 확인창 띄우기
//	@RequestMapping(value = "/mypage/Withdrawal")
//	public String withdrawal(HttpSession session) throws Exception {
//		//비밀번호 확인 후 탈퇴
//		
//		
//		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
//		int memberNo = authInfo.getMemberNo();
//		int result = memberService.deleteMember(memberNo);
//		if(result > 0) {
//			return "index";
//		}else {
//			return "redirect:/mypage";
//		}
//	}
	

}
