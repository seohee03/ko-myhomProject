package com.myhome.www.item.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myhome.www.item.service.ItemCommand;
import com.myhome.www.item.service.ItemService;

@Controller
public class ItemController {

	@Resource(name = "itemService")
	private ItemService itemService;
	
	
	/* ************************관리자************************* */
	 
	 //상품 리스트
	 @RequestMapping(value = "/admin/itemList") 
	 public String itemListForAdmin(Model model) throws Exception { 
		 
		 List<ItemCommand> itemList = itemService.selectItemList();
		 
		 model.addAttribute("itemList", itemList);
		
		 return "admin/itemManager/itemList"; 
	 }
	 
	//관리자 상품 등록폼 
	@RequestMapping(value = "/admin/itemRegister", method = RequestMethod.GET)
	public String itemRegistForm(@ModelAttribute("itemCommand") ItemCommand itemCommand) {
	
		return "admin/itemManager/itemRegister";
	}
	
	//관리자 페이지 상품 등록 버튼 누르면
	@RequestMapping(value = "/admin/itemRegister", method = RequestMethod.POST)
	public String itemRegistSubmit(@ModelAttribute("itemCommand") ItemCommand itemCommand) throws Exception {
		
		int result = itemService.insertItem(itemCommand);
		
		if(result > 4) {return "redirect:/admin/itemList";}
		
		return "admin/itemManager/itemRegister";
	}
	
	//관리자 페이지 상품 수정 폼
	@RequestMapping(value="/admin/itemModify/{itemNo}", method = RequestMethod.GET)
	public String modifyForm(@PathVariable("itemNo") int itemNo, Model model) throws Exception {
	
		ItemCommand itemCommand = itemService.selectItemByItemNo(itemNo);
		
		model.addAttribute("itemCommand", itemCommand);
		
		return "admin/itemManager/itemModify";
	}
	
	//관리자 페이지 상품 수정 버튼 누르면
	@RequestMapping(value="/admin/itemModify", method = RequestMethod.POST)
	public void itemModifySubmit(@ModelAttribute("itemCommand") ItemCommand itemCommand, HttpServletResponse response) throws Exception {
		
		int result = itemService.updateItem(itemCommand);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		if(result > 3) {
	         writer.println("<script>alert('수정 성공!'); location.href='/www/admin/itemList';</script>");
		}else {
			writer.println("<script>alert('수정 실패!'); location.href='/www/admin/itemModify/"+itemCommand.getItem().getItemNo()+"';</script>");
		}
	}
	
	//관리자 상품 삭제
	@RequestMapping(value="/admin/itemDelete", method = RequestMethod.POST)
	public void itemDeleteSubmit(@ModelAttribute("itemCommand") ItemCommand itemCommand, Model model, HttpServletResponse response) throws Exception {
		
		int result = itemService.itemDelete(itemCommand);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		if(result > 1) {
	         writer.println("<script>alert('삭제 성공!'); location.href='/www/admin/itemList';</script>");
		}else {
			writer.println("<script>alert('삭제 실패!'); location.href='/www/admin/itemModify/"+itemCommand.getItem().getItemNo()+"';</script>");
		}
	}
	
	/**
	 * @throws Exception ******************************************************************************************************************************/
	
	
//	//스토어 상품 리스트
//	@RequestMapping(value = "/store", method = RequestMethod.GET)
//	public String itemListForStore(Item item, Model model) throws Exception {
//		List<Item> itemList = itemService.selectItemList();
//		 model.addAttribute("itemList", itemList);	
//		return "store/storeHome";
//	}
//	
	//스토어 상품 번호로 상세 페이지 들어가기
//	@RequestMapping(value = "/store/itemDetail/{itemNo}", method = RequestMethod.GET)
//	public String itemDetail(@PathVariable("itemNo") int itemNo, Model model) throws Exception {
//		
//		System.out.println(itemNo);
//		Item item = itemService.selectItemByItemNo(itemNo);
//		Cart cart = new Cart();
//		model.addAttribute("item", item);
//		model.addAttribute("cart", cart);
//		return "store/itemDetail";
//	}
//	
	
}
