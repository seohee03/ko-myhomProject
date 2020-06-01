package com.myhome.www.store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myhome.www.member.service.AuthInfo;
import com.myhome.www.store.dto.Cart;
import com.myhome.www.store.dto.CartCommand;
import com.myhome.www.store.service.CartService;

@Controller
public class CartController {

	@Resource(name = "cartService")
	private CartService cartService;
	
	//장바구니에 상품 추가
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
				 writer.println("<script>alert('장바구니 추가 성공!'); location.href='/www/itemDetail/"+cart.getItemNo()+"';</script>");
			}
		}else {
			writer.println("<script>alert('로그인을 먼저 해주세요!'); location.href='/www/login';</script>");
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
			writer.println("<script>location.href='/www/mycart?type=0';</script>");
		} else {
			writer.println("<script>alert('로그인을 먼저 해주세요!'); location.href='/www/login';</script>");
		}
	}

	//장바구니 리스트 보여줌
	@RequestMapping(value = "/mycart")
	public String myCart(@Param("type") int type, HttpSession session, Model model) throws Exception {
		String urlStr = "cart/cart";
		if(type > 0) {
			urlStr = "store/order";
		}
		AuthInfo authInfo = null;
		authInfo = (AuthInfo) session.getAttribute("authInfo");

		//로그인 한 회원의 번호로 장바구니 리스트 조회
		List<CartCommand> cartCommandList = cartService.selectCartList(authInfo.getMemberNo());
		model.addAttribute("cartCommandList", cartCommandList);
		
		return urlStr;
	}
	
	//장바구니에 있는 상품 수량 변경
	@ResponseBody
	@RequestMapping(value = "/updateCart", method = RequestMethod.POST)
	public int updateCartItemAmount(@RequestParam("updateCartNo") int cartNo, @RequestParam("updateAmount") int newAmount){
		System.out.println(">>>>>>>>>>>>>>"+cartNo);
		System.out.println(">>>>>>>>>>>>>>"+newAmount);
		int result = 0;

		//카트 수량 업데이트 해주기
		int res = cartService.updateItemAmountInCart(cartNo, newAmount);
		if(res > 0) {
			result = 0;
		}else {
			result = 9;
		}
		return result;
	}
	
	//카트에 있는 상품 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart")
	public int deleteCart(@RequestParam("updateCartNo") int cartNo) {
		int result = 0;
		
		int res = cartService.deleteItemInCart(cartNo);
		if(res > 0) {
			result = 0;
		}else {
			result = 9;
		}
		return result;
	}
	
}
