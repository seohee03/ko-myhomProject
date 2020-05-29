package com.myhome.www.item.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myhome.www.item.dto.Categorie;
import com.myhome.www.item.dto.Item;
import com.myhome.www.item.dto.ItemImg;
import com.myhome.www.item.dto.Option1;
import com.myhome.www.item.dto.Option2;
import com.myhome.www.item.service.ItemCommand;
import com.myhome.www.item.service.ItemService;

@Service("itemService")
@Transactional
public class ItemServiceImpl implements ItemService{
	
	@Autowired
	private ItemDao itemDao;
	
	//상품 전체 리스트
	@Override
	public List<ItemCommand> selectItemList() throws Exception {
		return itemDao.selectItemList();
	}

	//상품 등록
	@Override
	public int insertItem(ItemCommand itemCommand) throws Exception {
		
		UUID one = UUID.randomUUID();
		itemCommand.getItem().setItemCode(one.toString());
		//아이템 등록
		Item item = new Item();
		item.setCategorieNo(itemCommand.getItem().getCategorieNo());
		item.setItemCode(itemCommand.getItem().getItemCode());
		item.setItemName(itemCommand.getItem().getItemName());
		item.setItemDetail(itemCommand.getItem().getItemDetail());
		item.setPrice(itemCommand.getItem().getPrice());
		item.setStock(itemCommand.getItem().getStock());
		item.setItemRegDateTime(LocalDateTime.now());
		int it = itemDao.insertItem(item);
		
		//옵션1 등록
		Option1 option1 = new Option1();
		//상품코드로 아이템 번호 조회
		int itemNo = itemDao.selectItemByItemCode(/* itemCommand.getItem().getItemCode() */item.getItemCode()).getItemNo();
		option1.setItemNo(itemNo);
		option1.setOption1Name(itemCommand.getOption1().getOption1Name());
		option1.setOption1Price(itemCommand.getOption1().getOption1Price());
		option1.setOption1Stock(itemCommand.getOption1().getOption1Stock());
		int op1 = itemDao.insertOption1(option1);
		
		//옵션2 등록
		Option2 option2 = new Option2();
		//아이템 번호로 옵션1 번호 조회
		int option1No = itemDao.selectOption1ByItemNo(itemNo).getOption1No();
		option2.setOption1No(option1No); 
		option2.setOption2Name(itemCommand.getOption2().getOption2Name()); 
		option2.setOption2Price(itemCommand.getOption2().getOption2Price());
		option2.setOption2Stock(itemCommand.getOption2().getOption2Stock());
		int op2 = itemDao.insertOption2(option2);
		
		//카테고리 등록
		Categorie categorie = new Categorie();
		//카테고리 번호로 카테고리 이름 조회
		String catName = itemDao.selectCatByCatNo(/* itemCommand.getItem().getCategorieNo() */item.getCategorieNo()).getCategorieName();
		categorie.setCategorieName(catName);
		int cat = itemDao.insertCategorie(categorie);
		//이미지 등록
		ItemImg itemImg = new ItemImg();
		itemImg.setImgName(itemCommand.getItemImg().getImgName());
		itemImg.setItemNo(itemNo);
		int iimg = itemDao.insertItemImg(itemImg);
		
		return it + op1 + op2 + cat + iimg;
	}

	//수정 폼(아이템 번호로 각 항목마다 전에 등록했던 내용 출력) 
	@Override
	public ItemCommand selectItemByItemNo(int itemNo) throws Exception {
		return itemDao.selectItemByItemNo(itemNo);
	}
		
	//상품 수정
	@Override
	public int updateItem(ItemCommand itemCommand) throws Exception {
		//아이템 수정
		Item item = new Item();
		item.setItemNo(itemCommand.getItem().getItemNo());
		item.setCategorieNo(itemCommand.getItem().getCategorieNo());
		item.setItemName(itemCommand.getItem().getItemName());
		item.setItemDetail(itemCommand.getItem().getItemDetail());
		item.setPrice(itemCommand.getItem().getPrice());
		item.setStock(itemCommand.getItem().getStock());
		System.out.println(item);
		int it = itemDao.updateItem(item);
		
		//옵션1 수정
		Option1 option1 = new Option1();
		option1.setItemNo(itemCommand.getItem().getItemNo());
		option1.setOption1Name(itemCommand.getOption1().getOption1Name());
		option1.setOption1Price(itemCommand.getOption1().getOption1Price());
		option1.setOption1Stock(itemCommand.getOption1().getOption1Stock());
		System.out.println(option1);
		int op1 = itemDao.updateOption1(option1);
	
		//옵션2 수정
		Option2 option2 = new Option2();
		option2.setOption1No(itemDao.selectOption1ByItemNo(itemCommand.getItem().getItemNo()).getOption1No());
		option2.setOption2Name(itemCommand.getOption2().getOption2Name()); 
		option2.setOption2Price(itemCommand.getOption2().getOption2Price());
		option2.setOption2Stock(itemCommand.getOption2().getOption2Stock());
		System.out.println(option2);
		int op2 = itemDao.updateOption2(option2);
	
		//이미지 수정
		ItemImg itemImg = new ItemImg();
		itemImg.setImgName(itemCommand.getItemImg().getImgName());
		itemImg.setItemNo(itemCommand.getItem().getItemNo());
		int iimg = itemDao.updateItemImg(itemImg);
		System.out.println(itemImg);
		System.out.println(itemCommand);
		System.out.println(it + op1 + op2 + iimg);
		return  it + op1 + op2 + iimg;
	}

	//상품 삭제
	@Override
	public int itemDelete(ItemCommand itemCommand) throws Exception {
		
		int itemNo = itemCommand.getItem().getItemNo();
		//아이템, 이미지 삭제
		int result1 = itemDao.deleteItem(itemNo);
		//옵션1, 옵션2 삭제
		int result2 = itemDao.deleteOption(itemNo);
		return result1 + result2;
	}

}
