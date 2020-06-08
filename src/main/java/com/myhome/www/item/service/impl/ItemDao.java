package com.myhome.www.item.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.myhome.www.item.dto.Categorie;
import com.myhome.www.item.dto.Item;
import com.myhome.www.item.dto.ItemImg;
import com.myhome.www.item.dto.Option1;
import com.myhome.www.item.dto.Option2;
import com.myhome.www.item.service.ItemCommand;
import com.myhome.www.item.service.ItemPageSize;
@Repository
public interface ItemDao {

	//상품 8개만 조회
	List<ItemCommand> selectItemForIndex() throws Exception;
	
	//상품 페이징하여 리스트 출력
	List<ItemCommand> selectItemList(ItemPageSize itemPageSize) throws Exception;
	
	//상품 개수 조회
	public int selectCount() throws Exception; 
	
	//상품 등록
	int insertItem(Item item) throws Exception;
	int insertOption1(Option1 option1) throws Exception;
	int insertOption2(Option2 option2) throws Exception;
	int insertItemImg(ItemImg itemImg) throws Exception;
	
	//상품 넘버로 옵션1 번호 조회(update때 사용)
	Option1 selectOption1ByItemNo(int itemNo) throws Exception;

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
	int deleteImg(int itemNo) throws Exception;
	
	//키워드로 상품 조회
	List<ItemCommand> selectSearchItemList(@Param("keyword") String keyword) throws Exception;
	
	//카테고리 번호로 상품 개수 조회
	int selectCountByCategorieNo(@Param("categorieNo") int categorieNo) throws Exception;
	//카테고리 번호별 상품 조회
	List<ItemCommand> selectItemByCategoryNo(Item item) throws Exception;
}
