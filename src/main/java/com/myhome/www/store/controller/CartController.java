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
			writer.println("<script>location.href='/www/mycart?type=0';</script>");
		} else {
			writer.println("<script>alert('로그인을 먼저 해주세요!'); location.href='/www/login';</script>");
			//return "login/loginForm";
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
	
	@ResponseBody
	@RequestMapping(value = "/updateCart", method = RequestMethod.POST)
	public int updateCartItemAmount(@RequestParam("updateCartNo") int cartNo, @RequestParam("updateAmount") int newAmount){
		System.out.println(">>>>>>>>>>>>>>"+cartNo);
		System.out.println(">>>>>>>>>>>>>>"+newAmount);
		int result = 0;
		//int cartNo = cartCommand.getCartNo();

		//카트 수량 업데이트 해주기
		int res = cartService.updateItemAmountInCart(cartNo, newAmount);
		if(res > 0) {
			result = 0;
		}else {
			result = 9;
		}
		return result;
	}
	
	
	
//	//장바구니에서 수량변경 버튼 누르면
//	@ResponseBody
//	@RequestMapping(value = "/updateCart")
//	public int updateCartItemAmount(CartCommand cartCommand) {
//		System.out.println("cartCommand.getAmount()"+cartCommand.getAmount());
//		
//		int result = 0;
//		//카트 수량 업데이트 해주기
//		int res = cartService.updateItemAmountInCart(cartCommand);
//		if(res > 0) {
//			result = 0;
//		}else {
//			result = 9;
//		}
//		return result;
//	}
	
	
//	@RequestMapping(value="/cart/update.do")
//	public ModelAndView updateCart(Cart cart, HttpServletRequest request){
//		ModelAndView mav = new ModelAndView("redirect:/cart/list.do");
//		HttpSession loginSession = request.getSession();
//		cart.setUser_id((String)loginSession.getAttribute("user_id"));
//		int chk = cartService.searchCnt(cart.getProduct_id());
//		System.out.println(chk);
//		if(chk < cart.getCart_cnt()){
//			mav.addObject("update_msg", "fail");
//			mav.addObject("max_cnt", chk);
//			return mav;
//		}else{
//			cartService.updateCart(cart);
//			mav.addObject("update_msg", "success");
//			return mav;
//		}
//		
//	}
	
	
	
}
