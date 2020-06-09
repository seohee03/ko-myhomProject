package com.myhome.www.store.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myhome.www.member.service.AuthInfo;
import com.myhome.www.store.dto.OrderDetail;
import com.myhome.www.store.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	//주문폼에서 주문 누르면
	@ResponseBody
	@RequestMapping(value = "/order")
	public int order(OrderDetail orderDetail, HttpSession session) throws Exception {	//@RequestParam(value="cartNo") int[] cartNoArr
		System.out.println(">>>>>>>>>>>>>>>>>" + orderDetail.getCartNoArr()[0]);
		int result = 0;
		AuthInfo authInfo = null;
		authInfo = (AuthInfo) session.getAttribute("authInfo");
		
		if(authInfo != null) {
			orderDetail.setMemberNo(authInfo.getMemberNo());
			//주문서 테이블, 주문내역 테이블 둘 다 insert, 장바구니는 삭제
			int res = orderService.order(orderDetail);
			if(res == 0) {
				result = 9;
			}
		}
		return result;
	}
	
	//주문 성공 페이지
	@RequestMapping(value = "/orderSuccess")
	public String orderSuccess() {
		return "store/orderSuccess";
	}
	
}
