package com.myhome.www.store.service;

import java.util.List;

import com.myhome.www.store.dto.Cart;
import com.myhome.www.store.dto.CartCommand;


public interface CartService {
	
	//카트에 상품 추가
	int insertItemInCart(Cart cart) throws Exception;

	//카트에 동일한 상품 있는지 상품번호와 회원번호로 체크
	int countCart(int itemNo, int memberNo);
	//카트에 있는 상품 수량 추가
	int updateItemInCart(Cart cart);
	//회원의 장바구니 리스트 조회
	List<CartCommand> selectCartList(int memberNo) throws Exception;
	//카트에 있는 상품 수량 변경
	int updateItemAmountInCart(int cartNo, int amount);
}
