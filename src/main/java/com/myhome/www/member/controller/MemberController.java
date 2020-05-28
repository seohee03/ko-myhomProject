package com.myhome.www.member.controller;

import java.time.LocalDateTime;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myhome.www.member.dto.Member;
import com.myhome.www.member.service.AuthInfo;
import com.myhome.www.member.service.DuplicateMemberException;
import com.myhome.www.member.service.LoginCommand;
import com.myhome.www.member.service.MemberService;
import com.myhome.www.member.service.RegisterRequest;
import com.myhome.www.member.service.RegisterRequestValidator;



@Controller
public class MemberController {

	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//회원가입
	@RequestMapping("/register/step1")
	public String handleStep1() {
		return "register/step1";
	}

	@PostMapping("/register/step2")
	public String handleStep2(
			@RequestParam(value = "agree") Boolean agree,
			@ModelAttribute RegisterRequest registerRequest) {
		if (!agree) {
			return "register/step1";
		}
		
		return "register/step2";
	}

	@GetMapping("/register/step2")
	public String handleStep2Get() {
		return "redirect:/register/step1";
	}

	//폼에서 submint 누르면
	@ResponseBody
	//@RequestMapping(value = "/register/step3", method = RequestMethod.POST )
	public String handleStep3(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPw") String memberPw,
			@RequestParam("memberName") String memberName,
			@RequestParam("confirmPassword") String confirmPassword,
			@ModelAttribute RegisterRequest registerRequest ) throws Exception {
		
		//System.out.println("값 넘어오냐>>>>>>> 안넘어옴~~~  " + registerRequest.getMemberId());
		
		RegisterRequest newRegReq = new RegisterRequest();
		newRegReq.setMemberid(memberId.trim());
		newRegReq.setPassword(memberPw);
		newRegReq.setName(memberName);
		newRegReq.setConfirmPassword(confirmPassword);
			memberService.insertMember(newRegReq);
			//memberService.insertMember(newRegReq);
			return "register/step3";
//		} catch (DuplicateMemberException ex) {
//			//errors.rejectValue("memberId", "duplicate");
//			return "register/step2";
//		}
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(
			@RequestParam("memberId") String memberId,
			RegisterRequest registerRequest) throws Exception {
		
		registerRequest.setMemberid(memberId);
		System.out.println(">>>>>>>>>>>>>" + registerRequest.getMemberId());
		
		int result = memberService.idCheck(registerRequest);
		return result;
	}
	
	// 회원가입 post
	@RequestMapping(value = "/register/step3", method = RequestMethod.POST)
	public String postRegister(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPw") String memberPw,
			@RequestParam("memberName") String memberName,
			@RequestParam("confirmPassword") String confirmPassword,
			RegisterRequest registerRequest) throws Exception {
		registerRequest.setMemberid(memberId);
//		logger.info("post register");
		int result = memberService.idCheck(registerRequest);
		try {
			if(result == 1) {
				return "/member/register";
			}else if(result == 0) {
				memberService.insertMember(registerRequest);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "register/step3";
	}
		
		
		
		
		
//			@RequestParam("memberId") String memberId,
//			@RequestParam("memberPw") String memberPw,
//			@RequestParam("memberName") String memberName,
//			@RequestParam("confirmPassword") String confirmPassword,
			
			
//System.out.println("id>>>>>>>>>>>>"+memberId);
//			RegisterRequest newRegReq = new RegisterRequest();
//			newRegReq.setMemberid(memberId.trim());
//			newRegReq.setPassword(memberPw);
//			newRegReq.setName(memberName);
//			newRegReq.setConfirmPassword(confirmPassword);

			//new RegisterRequestValidator().validate(newRegReq, errors);
		
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//마이페이지 이동 
	@RequestMapping("/mypage")
	public String goMypage(HttpSession session, Model model) throws Exception {
		if(session.getAttribute("authInfo") != null) {
			AuthInfo newAuthInfo = (AuthInfo)session.getAttribute("authInfo");
			Member member = memberService.selectMemberByNo(newAuthInfo.getMemberNo());
			
			model.addAttribute("member", member);
			return "mypage/mypageHome";
		}
		//로그인 하지 않은 경우에 mypage 진입시 회원로그인 폼으로 보낸다
		return "redirect:/login";
	}
	
	//정보수정
	@RequestMapping("/mypage/modify")
	public String modify() {
		System.out.println("수정페이지로~");
		return "redirect:/mypage/modify";	//수정완료되면 alert창 띄우기
	}
	
}
