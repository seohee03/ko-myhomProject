package com.myhome.www.member.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myhome.www.member.dto.Member;
import com.myhome.www.member.service.AuthInfo;
import com.myhome.www.member.service.MemberService;
import com.myhome.www.member.service.RegisterRequest;

@Controller
public class MemberController {

	@Resource(name = "memberService")
	private MemberService memberService;

	// 회원가입
	@GetMapping("/register/step1")
	public String handleStep1() {
		return "register/step1";
	}

	@PostMapping("/register/step2")
	public String handleStep2(Model model) {
		model.addAttribute("registerRequest", new RegisterRequest());
		return "register/step2";
	}

	// 폼에서 submint 누르면
	// @ResponseBody
	@RequestMapping(value = "/register/step3", method = RequestMethod.POST)
	public String handleStep3(RegisterRequest registerRequest) throws Exception {

		int result = memberService.idCheck(registerRequest);
		try {
			if (result == 1) {
				return "/member/register";
			} else if (result == 0) {
				memberService.insertMember(registerRequest);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "register/step3";
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(@RequestParam("memberId") String memberId, RegisterRequest registerRequest) throws Exception {

		registerRequest.setMemberId(memberId);
		System.out.println(">>>>>>>>>>>>>" + registerRequest.getMemberId());

		int result = memberService.idCheck(registerRequest);
		return result;
	}


	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

//	// 마이페이지 이동
//	@RequestMapping("/mypage")
//	public String goMypage(HttpSession session, Model model) throws Exception {
//		if (session.getAttribute("authInfo") != null) {
//			AuthInfo newAuthInfo = (AuthInfo) session.getAttribute("authInfo");
//			Member member = memberService.selectMemberByNo(newAuthInfo.getMemberNo());
//
//			model.addAttribute("member", member);
//			return "mypage/mypageHome";
//		}
//		// 로그인 하지 않은 경우에 mypage 진입시 회원로그인 폼으로 보낸다
//		return "redirect:/login";
//	}

	// 정보수정
	@RequestMapping("/mypage/modify")
	public String modify() {
		System.out.println("수정페이지로~");
		return "redirect:/mypage/modify"; // 수정완료되면 alert창 띄우기
	}

	
	//*******************************************************************************************************
	
	//회원 리스트
	@RequestMapping(value = "/admin/memberList", method = RequestMethod.GET)
	public String memberListForAdmin(Model model) throws Exception {
		System.out.println(">>>>>>>>>>>>>>>>컨트롤러 진입");
		List<Member> memberList = memberService.selectMemberList();
		model.addAttribute("memberList",memberList);
		System.out.println("memberList"+memberList);
	return "admin/memberManager/memberList";
		}
	
	//회원 탈퇴
	@RequestMapping(value = "/admin/memberDelete/{memberNo}", method = RequestMethod.GET)
	   public String memberDeleteForAmin(@PathVariable("memberNo") int memberNo)throws Exception{
		System.out.println(">>>>>>>>>>>>>>>>컨트롤러 진입" +memberNo);
	      int result = memberService.deleteMember(memberNo);
	      if(result>0) {
	    	  return "redirect:/admin/memberList";
	      } else {
	    	  return "admin/memberManager/memberList/memberNo";
	      }
	   }

	
	
}
