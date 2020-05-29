package com.myhome.www.item.service;

import java.util.List;

public interface ItemService {

	//상품 전체 리스트 조회
	List<ItemCommand> selectItemList() throws Exception;	
	//상품 등록
	int insertItem(ItemCommand itemCommand) throws Exception;
	//상품 번호로 전체 조회
	ItemCommand selectItemByItemNo(int itemNo) throws Exception;
	//상품 수정
	int updateItem(ItemCommand itemCommand) throws Exception;
	//상품 삭제
	int itemDelete(ItemCommand itemCommand) throws Exception;
}
