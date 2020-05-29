package com.myhome.www.store.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myhome.www.store.dto.Cart;
import com.myhome.www.store.service.CartService;

@Service("cartService")
@Transactional
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDao cartDao;
	

	//카트에 상품 추가
	@Override
	public int insertItemInCart(Cart cart) throws Exception {
		return cartDao.insertItemInCart(cart);
	}

	//카트에 동일한 상품 있는지 상품번호와 회원번호로 체크
	@Override
	public int countCart(int itemNo, int memberNo) {
		return cartDao.countCart(itemNo, memberNo);
	}

	@Override
	public int updateItemInCart(Cart cart) {
		return cartDao.updateItemInCart(cart);
	}

}
