package com.myhome.www.item.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myhome.www.cart.dto.Cart;
import com.myhome.www.item.dto.Item;
import com.myhome.www.item.dto.ItemCommand;
import com.myhome.www.item.service.ItemService;
import com.myhome.www.member.service.AuthInfo;

@Controller
public class ItemController {

	@Resource(name = "itemService")
	private ItemService itemService;
	
	
	/* **************************************************관리자************************************************** */
	 
	 //상품 리스트
	 @RequestMapping(value = "/admin/itemList") 
	 public String itemListForAdmin(Model model) throws Exception { 
		 List<Item> itemList = itemService.selectItemList();
		 model.addAttribute("itemList", itemList);
		 return "admin/itemManager/itemList"; 
	 }
//	//상품 리스트
//	 @RequestMapping(value = "/admin/itemList") 
//	 public String itemListForAdmin(Model model) throws Exception { 
//		 List<ItemCommand> itemList = itemService.selectItemList();
//		 model.addAttribute("itemList", itemList);
//		 return "admin/itemManager/itemList"; 
//	 }
	 
	//관리자 페이지 상품 등록폼 
	@RequestMapping(value = "/admin/itemRegister", method = RequestMethod.GET)
	public String itemRegistForm(@ModelAttribute("item") Item item) {
		//System.out.println("컨트롤러 진입 ");
		return "admin/itemManager/itemRegister";
	}
	
	//관리자 페이지 상품 등록 버튼 누르면
	@RequestMapping(value = "/admin/itemRegister", method = RequestMethod.POST)
	public String itemRegistSubmit(@ModelAttribute("item") Item item) throws Exception {
	
		int result;
		result = itemService.insertItem(item);
		if(result > 0) {return "redirect:/admin/itemList";}
		return "admin/itemManager/itemRegister";
	}
	
	//관리자 페이지 상품 수정 폼
	@RequestMapping(value="/admin/itemModify/{itemNo}", method = RequestMethod.GET)
	public String modifyForm(@PathVariable("itemNo") int itemNo, Model model) throws Exception {
		System.out.println(itemNo);
		Item item = itemService.selectItemByItemNo(itemNo);
		model.addAttribute("item", item);
		return "admin/itemManager/itemModify";
	}
	
	//관리자 페이지 상품 수정 버튼 누르면
	@RequestMapping(value="/admin/itemModify", method = RequestMethod.POST)
	public void itemModifySubmit(@ModelAttribute("item") Item item, HttpServletResponse response) throws Exception {
		
		System.out.println("modify controller>>>>");
		
		int result = itemService.updateItem(item);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		if(result > 0) {
	         writer.println("<script>alert('수정 성공!'); location.href='/www/admin/itemModify/"+item.getItemNo()+"';</script>");
		}else {
			writer.println("<script>alert('수정 실패!'); location.href='/www/admin/itemModify/"+item.getItemNo()+"';</script>");
		}
	}
	
//	//관리자 상품 삭제
//	@RequestMapping(value="/admin/itemDelete", method = RequestMethod.POST)
//	public void itemDeleteSubmit(@ModelAttribute("item") Item item, Model model, HttpServletResponse response) throws Exception {
//		
//		int result = itemService.itemDelete(item);
//
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter writer = response.getWriter();
//		
//		if(result > 0) {
//	         writer.println("<script>alert('삭제 성공!'); location.href='/www/admin/itemList';</script>");
//		}else {
//			writer.println("<script>alert('삭제 실패!'); location.href='/www/admin/itemModify/"+item.getItemNo()+"';</script>");
//		}
//	}
	
	//관리자 상품 삭제
	@RequestMapping(value="/admin/itemDelete", method = RequestMethod.POST)
	public void itemDeleteSubmit(@ModelAttribute("item") Item item, Model model, HttpServletResponse response) throws Exception {
		
		int result = itemService.itemDelete(item);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();

	    if(result > 0) {
	         writer.println("<script>alert('삭제 성공!'); location.href='/www/admin/itemList';</script>");
		}else {
			writer.println("<script>alert('삭제 실패!'); location.href='/www/admin/itemModify/"+item.getItemNo()+"';</script>");
		}
	}
	
	
	
	/* **************************************************사용자************************************************** */
	
	
	//스토어 상품 리스트
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public String itemListForStore(Item item, Model model) throws Exception {
		List<Item> itemList = itemService.selectItemList();
		 model.addAttribute("itemList", itemList);	
		return "store/storeHome";
	}
	
	//스토어 상품 번호로 상세 페이지 들어가기
	@RequestMapping(value = "/store/itemDetail/{itemNo}", method = RequestMethod.GET)
	public String itemDetail(@PathVariable("itemNo") int itemNo, Model model) throws Exception {
		
		System.out.println(itemNo);
		Item item = itemService.selectItemByItemNo(itemNo);
		Cart cart = new Cart();
		model.addAttribute("item", item);
		model.addAttribute("cart", cart);
		return "store/itemDetail";
	}
	
	
}
