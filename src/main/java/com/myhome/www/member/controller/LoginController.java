package com.myhome.www.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myhome.www.member.service.AuthInfo;
import com.myhome.www.member.service.LoginCommand;
import com.myhome.www.member.service.LoginService;
import com.myhome.www.member.service.WrongIdPasswordException;

@Controller
public class LoginController {

	@Resource(name = "loginService")
	private LoginService loginServie;
	
	
	//로그인 폼 
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String form(LoginCommand loginCommand,
    		@CookieValue(value = "REMEMBER", required = false) Cookie rCookie) {
		if (rCookie != null) {
			loginCommand.setMemberId(rCookie.getValue());
			loginCommand.setRememberId(true);
		}
    	return "login/loginForm";
    }
    
  //로그인 폼에서 submit 눌렀을 때
    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST )
	public int submit(LoginCommand loginCommand, HttpSession session,
			HttpServletResponse response) throws Exception {
    	int result = 0;
        try {
            AuthInfo authInfo = loginServie.authenticate(loginCommand.getMemberId(), loginCommand.getMemberPw());
            
            session.setAttribute("authInfo", authInfo);

			Cookie rememberCookie = 
					new Cookie("REMEMBER", loginCommand.getMemberId());
			rememberCookie.setPath("/");
			if (loginCommand.isRememberId()) {
				rememberCookie.setMaxAge(60 * 60 * 24 * 30);
			} else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);
        } catch (WrongIdPasswordException e) {
        	//errors.reject("idPasswordNotMatching");
        	result = 9;
        }
        return result;
    }
    
    @RequestMapping(value = "/loginSuccess")
    public String loginSuccess() {
    	//return "index";
    	return "login/loginSuccess";
    }
    
    
    
    
    
    
    
	/***********************************************************************************************************************/
    
    
    //관리자 로그인 폼
    @RequestMapping(value = "/admin", method=RequestMethod.GET)
    public String adminForm(LoginCommand loginCommand, @CookieValue(value = "REMEMBER", required = false) Cookie rCookie, HttpSession session) {
		
  
    	//로그인 한 회원 세션 삭제
    	if(session.getAttribute("authInfo") != null ) {
    		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
    		System.out.println("power >>>>>>>>>>>" + authInfo.getPower());
    		if(authInfo.getPower().equals("normal")) {
				System.out.println(session.getAttribute("authInfo"));
				session.invalidate();
				
				if (rCookie != null) {
					loginCommand.setMemberId(rCookie.getValue());
					loginCommand.setRememberId(true);
				}
				return "admin/adminLoginForm";
    		}else {
    			return "admin/adminHome";
    		}
		}
    
    	return "admin/adminLoginForm";
    }
    
    //관리자 로그인 폼에서 버튼 눌렀을 때
    @ResponseBody
    @RequestMapping(value = "/admin", method = RequestMethod.POST )
    public int adminSubmit( 
    		LoginCommand loginCommand, HttpSession session, 
    		HttpServletResponse response) throws Exception {
        int result = 0;
    	try {
    		AuthInfo authInfo = loginServie.authenticate(loginCommand.getMemberId(), loginCommand.getMemberPw());
            
            session.setAttribute("authInfo", authInfo);

            Cookie rememberCookie = 
					new Cookie("REMEMBER", loginCommand.getMemberId());
			rememberCookie.setPath("/");
			if (loginCommand.isRememberId()) {
				rememberCookie.setMaxAge(60 * 60 * 24 * 30);
			} else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);

            //return "admin/adminHome";
        } catch (WrongIdPasswordException e) {
        	result = 9;
        }
    	return result;
    }
    
    
}
