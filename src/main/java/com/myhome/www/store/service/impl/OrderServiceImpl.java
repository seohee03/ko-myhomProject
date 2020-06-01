package com.myhome.www.store.service.impl;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myhome.www.store.dto.OrderDetail;
import com.myhome.www.store.dto.OrderHistory;
import com.myhome.www.store.service.OrderService;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private CartDao cartDao;
	@Autowired
	private OrderDao orderDao;

	@Override
	public OrderHistory order(OrderDetail orderDetail) {
		orderDetail.setOrderDate(LocalDateTime.now());
		//주문서 저장
		//상품 ㅇㅇ 외 n개 주문완료, 주문번호 *******
		orderDao.insertOrder(orderDetail);
		//orderDao.insertOrder();
		//주문내역 저장
		
		//주문 완료된 상품들 장바구니에서 지우기
//		for(int i = 0; i > orderDetail.getCartNoArr().length; i++) {
//			cartDao.deleteItemInCart(orderDetail.getCartNoArr()[i]);
//		}
		
		return null;
	}

}
