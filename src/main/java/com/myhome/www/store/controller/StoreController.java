package com.myhome.www.store.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myhome.www.item.service.ItemCommand;
import com.myhome.www.item.service.ItemService;

@Controller
public class StoreController {
	
	@Resource(name = "itemService")
	private ItemService itemService;

	
	//상품 리스트
	 @RequestMapping(value = "/store") 
	 public String itemListForMember(Model model) throws Exception { 
		 
		 List<ItemCommand> itemList = itemService.selectItemList();
		 
		 model.addAttribute("itemList", itemList);
		
		 return "store/storeHome"; 
	 }
	
}
