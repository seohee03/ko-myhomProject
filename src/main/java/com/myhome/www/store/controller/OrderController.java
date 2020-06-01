package com.myhome.www.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myhome.www.store.dto.OrderDetail;
import com.myhome.www.store.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	//주문폼에서 주문 누르면
	@ResponseBody
	@RequestMapping(value = "/order")
	public int order(OrderDetail orderDetail) {	//@RequestParam(value="cartNo") int[] cartNoArr
		
		//배열 값 넘어오나 확인
		System.out.println(">>>>>>>cartNoArr : " + orderDetail.getCartNoArr()[0]);
		//주문서 테이블, 주문내역 테이블 둘 다 insert, 장바구니는 삭제
		orderService.order(orderDetail);
		
		int result = 0;
		
		return result;
	}
	
	//주문 성공 페이지
	@RequestMapping(value = "/orderSuccess")
	public String orderSuccess() {
		return "store/orderSuccess";
	}
	
}
