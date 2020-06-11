package com.myhome.www.store.service;

import java.util.List;

import com.myhome.www.store.dto.CartCommand;
import com.myhome.www.store.dto.OrderDetail;
import com.myhome.www.store.dto.OrderHistory;

public interface OrderService {

	//주문하기
	int order(OrderDetail orderDetail) throws Exception;
	//주문내역 리스트(admin)
	List<OrderHistory> selectOrderList() throws Exception;
	
}
