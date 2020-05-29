package com.myhome.www.item.service;

import java.util.List;

import com.myhome.www.item.dto.Item;
import com.myhome.www.item.dto.ItemCommand;

public interface ItemService {

	//상품 전체 리스트
	List<Item> selectItemList() throws Exception;	
	//상품 등록
	int insertItem(Item item) throws Exception;
	//상품 번호로 조회
	Item selectItemByItemNo(int ItemNo) throws Exception;
	//상품 수정
	int updateItem(Item item) throws Exception;
	//상품 삭제
	int itemDelete(Item item) throws Exception;
}
