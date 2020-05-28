package com.myhome.www.cart.service;

import com.myhome.www.cart.dto.Cart;


public interface CartService {
	
	//카트에 상품 추가
	int insertItemInCart(Cart cart) throws Exception;

	//카트에 동일한 상품 있는지 상품번호와 회원번호로 체크
	int countCart(int itemNo, int memberNo);

	int updateItemInCart(Cart cart);

}
