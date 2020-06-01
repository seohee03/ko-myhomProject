package com.myhome.www.store.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderController {


	//주문폼에서 주문 누르면
	@ResponseBody
	@RequestMapping(value = "/order")
	public int order(@RequestParam(value="cartNo") int[] cartNoArr) {
		System.out.println(">>>>>>>cartNoArr : " + cartNoArr[0]);
		System.out.println(">>>>>>>cartNoArr : " + cartNoArr[1]);
		int result = 0;
		System.out.println("controller 진입");
		
		return result;
	}
	
	//주문 성공 페이지
	@RequestMapping(value = "/orderSuccess")
	public String orderSuccess() {
		return "store/orderSuccess";
	}
	
}
