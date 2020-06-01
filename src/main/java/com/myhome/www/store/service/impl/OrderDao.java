package com.myhome.www.store.service.impl;

import com.myhome.www.store.dto.OrderDetail;

public interface OrderDao {

	//주문서 등록
	int insertOrder(OrderDetail orderDetail);
}
