package com.myhome.www.item.service;

import java.util.List;

import com.myhome.www.item.dto.CrawlingItem;
import com.myhome.www.item.dto.Item;
import com.myhome.www.item.dto.ItemImg;

public interface ItemService {
	
	//index 
	List<ItemCommand> selectItemForIndex() throws Exception;
	
	//상품 전체 리스트 조회(페이징)
	ItemPage getItemPage(int pageNo) throws Exception;
	
	//상품 등록
	int insertItem(ItemCommand itemCommand) throws Exception;

	//수정 폼에서 전에 등록했던 상품 정보 출력
	ItemCommand selectItemByItemNo(int itemNo) throws Exception;
	
	//상품 수정
	int updateItem(ItemCommand itemCommand) throws Exception;
	
	//상품 삭제
	int itemDelete(ItemCommand itemCommand) throws Exception;
		
	
	//키워드로 상품 조회
	List<ItemCommand> selectSearchItemList(String keyword) throws Exception;
	
	//카테고리번호로 상품 개수 조회
	int selectCountByCategorieNo(int categorieNo) throws Exception;
	
	//카테고리 번호별 상품 조회
	List<ItemCommand> selectItemByCategoryNo(Item item) throws Exception;
	
	//상품 개수(페이징 - ajax로 스크롤페이징할때)
	int selectCountItem() throws Exception;
	
	//상품 페이징
	List<ItemCommand> selectItemPage(Item item) throws Exception;
	
	//크롤링으로 상품 등록
	void insertCrawlingItem(CrawlingItem crawlingItem) throws Exception;
	
	//아이템 이미지 리스트
	List<ItemImg> selectItemImgByItemNo(int itemNo) throws Exception;
}
