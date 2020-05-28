package com.myhome.www.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myhome.www.cart.dto.Cart;
import com.myhome.www.cart.service.CartService;
import com.myhome.www.member.service.AuthInfo;

@Controller
public class CartController {

	
	@Resource(name = "cartService")
	private CartService cartService;
	
	@RequestMapping(value = "/cart/cartAdd", method = RequestMethod.POST)
	public void cartAddItem(@ModelAttribute("cart") Cart cart, HttpSession session, HttpServletResponse response) throws Exception {
		//itemDetail에서 '장바구니에 추가' 누르면 alert
		
		AuthInfo authInfo = null;
		authInfo = (AuthInfo) session.getAttribute("authInfo");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		if(authInfo != null) {
			int memberNo = authInfo.getMemberNo();
			cart.setMemberNo(memberNo);
			//카트에 동일한 상품 있는지 상품번호와 회원번호로 체크
			int count = cartService.countCart(cart.getItemNo(), memberNo);
			int result = 0;
			
			if(count == 0) {
				//동일한 제품이 없으면 카트에 담는다!
				result = cartService.insertItemInCart(cart);
			} else {
				result = cartService.updateItemInCart(cart);
			}
			
			
			if(result > 0) {
				 writer.println("<script>alert('장바구니 추가 성공!'); location.href='/www/store/itemDetail/"+cart.getItemNo()+"';</script>");
			}
//			return "redirect:/";
		}else {
			writer.println("<script>alert('로그인을 먼저 해주세요!'); location.href='/www/login';</script>");
			//return "login/loginForm";
		}
	}
	
	@RequestMapping(value = "/cart")
	public void cart(HttpSession session, HttpServletResponse response) throws IOException {
		AuthInfo authInfo = null;
		authInfo = (AuthInfo) session.getAttribute("authInfo");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		
		if(authInfo != null) {
			//로그인 한거면
			writer.println("<script>location.href='/www/mycart';</script>");
		} else {
			writer.println("<script>alert('로그인을 먼저 해주세요!'); location.href='/www/login';</script>");
			//return "login/loginForm";
		}
		
		//return "cart/cart";
	}
	
	
	@RequestMapping(value = "/mycart")
	public String myCart(Cart cart) {
		
		
		
		return "cart/cart";
	}
	
	
	
	
	
	
}
