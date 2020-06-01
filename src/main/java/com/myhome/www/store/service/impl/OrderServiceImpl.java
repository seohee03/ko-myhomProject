package com.myhome.www.store.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myhome.www.store.dto.OrderDetail;
import com.myhome.www.store.dto.OrderHistory;
import com.myhome.www.store.service.OrderService;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService{

	@Override
	public OrderHistory order(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		return null;
	}

}
