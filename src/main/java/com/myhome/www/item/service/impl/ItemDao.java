package com.myhome.www.item.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.myhome.www.item.dto.Categorie;
import com.myhome.www.item.dto.Item;
import com.myhome.www.item.dto.ItemImg;
import com.myhome.www.item.dto.Option1;
import com.myhome.www.item.dto.Option2;
import com.myhome.www.item.service.ItemCommand;
@Repository
public interface ItemDao {

	//상품 전체 리스트
	List<ItemCommand> selectItemList() throws Exception;
	
	//상품 등록
	int insertItem(Item item) throws Exception;
	int insertOption1(Option1 option1) throws Exception;
	int insertOption2(Option2 option2) throws Exception;
	int insertCategorie(Categorie categorie) throws Exception;
	int insertItemImg(ItemImg itemImg) throws Exception;
	
	//상품 코드로 번호 조회(insert때 사용)
	Item selectItemByItemCode(String itemCode) throws Exception;
	//상품 넘버로 옵션1 번호 조회(insert때 사용)
	Option1 selectOption1ByItemNo(int itemNo) throws Exception;
	//카태고리 넘버로 카테고리 이름 조회(insert때 사용)
	Categorie selectCatByCatNo(int categorieNo) throws Exception;
	
	//상품 수정 폼 아이템 조회
	ItemCommand selectItemByItemNo(int itemNo) throws Exception;
	
	//상품 수정
	int updateItem(Item item) throws Exception;
	int updateOption1(Option1 option1) throws Exception;
	int updateOption2(Option2 option2) throws Exception;
	int updateItemImg(ItemImg itemImg) throws Exception;
	
	//상품 삭제
	int deleteItem(int itemNo) throws Exception;
	int deleteOption(int itemNo) throws Exception;
	
}
