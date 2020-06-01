package com.myhome.www.store.service;

import com.myhome.www.store.dto.OrderDetail;
import com.myhome.www.store.dto.OrderHistory;

public interface OrderService {

	//주문하기
	OrderHistory order(OrderDetail orderDetail);
}
