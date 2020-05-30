package com.myhome.www.store.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myhome.www.store.dto.Cart;
import com.myhome.www.store.dto.CartCommand;

public interface CartDao {
	
	//카트에 상품 추가
	int insertItemInCart(Cart cart) throws Exception;
	//카트에 동일한 상품 있는지 상품번호와 회원번호로 체크
	int countCart(@Param("itemNo") int itemNo, @Param("memberNo") int memberNo);
	//카트에 있는 아이템 수량 수정
	int updateItemInCart(Cart cart);
	//회원의 장바구니 리스트 조회
	List<CartCommand> selectCartList(int memberNo) throws Exception;

}
