package com.myhome.www.item.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myhome.www.item.dto.Item;
import com.myhome.www.item.service.ItemService;

@Service("itemService")
@Transactional
public class ItemServiceImpl implements ItemService{
	
	@Autowired
	private ItemDao itemDao;
	
	@Autowired
	private ItemMapper ItemMapper;

	//상품 전체 리스트
	@Override
	public List<Item> selectItemList() throws Exception {
		return itemDao.selectItemList();
	}

	//상품 등록
	@Override
	public int insertItem(Item item) throws Exception {
		UUID one = UUID.randomUUID();
		item.setItemCode(one.toString());
		return itemDao.insertItem(item);
	}

	//상품 번호로 조회
	@Override
	public Item selectItemByItemNo(int itemNo) throws Exception {
		return itemDao.selectItemByItemNo(itemNo);
	}

	//상품 수정
	@Override
	public int updateItem(Item item) throws Exception {
		return itemDao.updateItem(item);
	}

	//상품 삭제
	@Override
	//public int itemDelete(Item item) throws Exception {
	public int itemDelete(Item item) throws Exception {
		//return itemDao.itemDelete(item);
		int itemNo = item.getItemNo();
		return ItemMapper.deleteItem(itemNo);
		//return 
	}

}
