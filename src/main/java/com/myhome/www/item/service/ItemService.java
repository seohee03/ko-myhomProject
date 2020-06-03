package com.myhome.www.item.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.myhome.www.item.dto.Item;

public interface ItemService {
	
	//상품 전체 리스트 조회(페이징)
	ItemPage getItemPage(int pageNo) throws Exception;
	
	//상품 등록
	int insertItem(ItemCommand itemCommand) throws Exception;
	//이미지 등록
	int fileUpload(MultipartFile[] files, int itemNo) throws Exception;
	//아이템 코드로 아이템 가져옴(이미지 업로드때 아이템 번호 얻기 위해 사용)
	Item selectItemByItemCode(String itemCode) throws Exception;
	
	//수정 폼에서 전에 등록했던 상품 정보 출력
	ItemCommand selectItemByItemNo(int itemNo) throws Exception;
	
	//상품 수정
	int updateItem(ItemCommand itemCommand) throws Exception;
	
	//상품 삭제
	int itemDelete(ItemCommand itemCommand) throws Exception;
	
	//키워드로 상품 조회
	List<ItemCommand> selectSearchItemList(String keyword) throws Exception;
	
}
