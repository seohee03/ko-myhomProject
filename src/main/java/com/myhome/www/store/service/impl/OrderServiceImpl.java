package com.myhome.www.store.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myhome.www.store.dto.Cart;
import com.myhome.www.store.dto.CartCommand;
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
	public int order(OrderDetail orderDetail) {
		orderDetail.setOrderDate(LocalDateTime.now());
		//주문서 저장
		int insertRs = orderDao.insertOrder(orderDetail);
		int result = 0;
		if(insertRs > 0) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>orderNo : " + orderDetail.getOrderNo());
		
		//주문 내역 테이블에 구매 정보 insert(cartNo로 정보 넣음)
		System.out.println("orderDetail.getCartNoArr().length="+orderDetail.getCartNoArr().length);
		for(int i = 0; i < orderDetail.getCartNoArr().length; i++) {
			//해당 카트번호의 아이템을 조회한다
			List<Cart> cart = cartDao.selectCartItemByNo(orderDetail.getCartNoArr()[i]);
			System.out.println(">>>>>>>cartNoArr["+i+"] : " + orderDetail.getCartNoArr()[i]);
			
			OrderHistory orderHistory = new OrderHistory();
			orderHistory.setMemberNo(cart.get(0).getMemberNo());
			orderHistory.setItemNo(cart.get(0).getItemNo());
			orderHistory.setItemName(cart.get(0).getItemName());
			orderHistory.setOrderDate(LocalDateTime.now());
			orderHistory.setPrice(cart.get(0).getPrice());
			orderHistory.setAmount(cart.get(0).getAmount());
			orderHistory.setOrderNo(orderDetail.getOrderNo());
			orderDao.insertOrderHistory(orderHistory);
		}
		
		//구매한 물건은 장바구니에서 삭제
		for(int i = 0; i < orderDetail.getCartNoArr().length; i++) {
			result += cartDao.deleteItemInCart(orderDetail.getCartNoArr()[i]);
		}
		}
		return result;
	}

	//주문 내역 리스트(admin)
	@Override
	public List<OrderHistory> selectOrderList() throws Exception {
		 
		return orderDao.selectOrderList();
	}

	

}
