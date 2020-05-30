package com.myhome.www.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.myhome.www.member.service.AuthInfo;

public class AdminAuthCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null) {
			AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
			if (authInfo != null && authInfo.getPower().equals("admin")) {
				
				return true;
			}
		}
		response.sendRedirect(request.getContextPath() + "/admin");
		return false;
	}

}