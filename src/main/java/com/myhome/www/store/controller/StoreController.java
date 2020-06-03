package com.myhome.www.store.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myhome.www.item.dto.Item;
import com.myhome.www.item.service.ItemCommand;
import com.myhome.www.item.service.ItemService;
import com.myhome.www.store.dto.Cart;

@Controller
public class StoreController {
	
	@Resource(name = "itemService")
	private ItemService itemService;

	
	//상품 리스트 & 스토어 홈
	 @RequestMapping(value = "/store") 
	 public String itemListForMember(Model model) throws Exception { 
		 
		 List<ItemCommand> itemList = itemService.selectItemList();
		 
		 model.addAttribute("itemList", itemList);
		
		 return "store/storeHome"; 
	 }
	 
	 //상품 상세보기 페이지
	 @RequestMapping(value = "/itemDetail/{itemNo}")
	 public String itemDetailForMember(@PathVariable("itemNo") int itemNo, Model model, Item item, Cart cart) throws Exception{
		 ItemCommand itemCommand = itemService.selectItemByItemNo(itemNo);
			
		 model.addAttribute("itemCommand", itemCommand);
		
		 return "store/itemDetail";
		 
	 }
	 
	 @RequestMapping(value = "/searchItem")
	 public String searchItem(@RequestParam("keyword") String keyword, Model model) throws Exception {
		 System.out.println(">>>>>>>>>>>>>>keyword : " + keyword);
		 List<ItemCommand> itemList = itemService.selectSearchItemList(keyword);
		 
		 model.addAttribute("itemList", itemList);
		 return "store/storeHome";
	 }
	
}
