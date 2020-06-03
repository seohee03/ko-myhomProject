package com.myhome.www.item.controller;

import java.io.PrintWriter;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myhome.www.item.service.ItemCommand;
import com.myhome.www.item.service.ItemPage;
import com.myhome.www.item.service.ItemService;

@Controller
public class ItemController {

	@Resource(name = "itemService")
	private ItemService itemService;
	
	
	/* ************************관리자************************* */
	 
	 //상품 리스트
	@RequestMapping(value = "/admin/itemList") 
	 public String itemListForAdmin() throws Exception { 

		return "forward:/admin/itemList/1";
	 }
	
	 //상품 리스트(페이징)
	 @RequestMapping(value = "/admin/itemList/{pageNum}") 
	 public String itemListForAdmin(@PathVariable("pageNum") String pageNum, 
			 Model model) throws Exception {
		 
		String pageNoVal = pageNum;
			int pageNo = 1;
			if (pageNoVal != null) {
				pageNo = Integer.parseInt(pageNoVal);
			}
		ItemPage itemPage = itemService.getItemPage(pageNo);
	
		model.addAttribute("itemPage", itemPage);
		
		return "admin/itemManager/itemList"; 
	 }
	 
	//관리자 상품 등록폼 
	@RequestMapping(value = "/admin/itemRegister", method = RequestMethod.GET)
	public String itemRegistForm(@ModelAttribute("itemCommand") ItemCommand itemCommand) {
	
		return "admin/itemManager/itemRegister";
	}
	
	//관리자 페이지 상품 등록 버튼 누르면
	@RequestMapping(value = "/admin/itemRegister", method = RequestMethod.POST)
	public void itemRegistSubmit(@ModelAttribute("itemCommand") ItemCommand itemCommand,
			HttpServletRequest request, HttpServletResponse response ) throws Exception {
		System.out.println(itemCommand.getItem());
		// 커맨드 객체에 uuid 상품 코드 넣어줌(상품 번호 얻기위해..)
		UUID one = UUID.randomUUID();
		itemCommand.getItem().setItemCode(one.toString());
		
		//아이템,옵션 등록
		int itemResult = itemService.insertItem(itemCommand);
		//등록된 아이템 번호 얻어옴
		int itemNo = itemService.selectItemByItemCode(itemCommand.getItem().getItemCode()).getItemNo();
		//이미지 등록
		int fileResult = itemService.fileUpload(itemCommand.getFiles(), itemNo);
		
		//등록 성공 여부
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		if(itemResult > 2 && fileResult > 0) {
	         writer.println("<script>alert('등록 성공!'); location.href='" + request.getContextPath() + "/admin/itemList';</script>");
		}else {
			writer.println("<script>alert('등록 실패!'); location.href='" + request.getContextPath() + "/admin/itemRegister';</script>");
		}
	}
	
	//관리자 페이지 상품 수정 폼
	@RequestMapping(value="/admin/itemModify/{itemNo}", method = RequestMethod.GET)
	public String modifyForm(@PathVariable("itemNo") int itemNo, Model model) throws Exception {
		
		//수정할 상품 정보 출력
		ItemCommand itemCommand = itemService.selectItemByItemNo(itemNo);
		model.addAttribute("itemCommand", itemCommand);
	
		return "admin/itemManager/itemModify";
	}
	
	//관리자 페이지 상품 수정 버튼 누르면
	@RequestMapping(value="/admin/itemModify", method = RequestMethod.POST)
	public void itemModifySubmit(@ModelAttribute("itemCommand") ItemCommand itemCommand, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//상품 수정
		int itemResult = itemService.updateItem(itemCommand);
		//아이템 번호 얻어옴
		int itemNo = itemCommand.getItem().getItemNo();
		//이미지 재업로드(기존 이미지 삭제 후 업로드)
		int fileResult = itemService.fileUpload(itemCommand.getFiles(), itemNo);
		
		//수정 성공 여부
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		if(itemResult > 2 && fileResult > 0) {
	         writer.println("<script>alert('수정 성공!'); location.href='" + request.getContextPath() + "/admin/itemList';</script>");
		}else {
			writer.println("<script>alert('수정 실패!'); location.href='" + request.getContextPath() + "/admin/itemModify/" + itemCommand.getItem().getItemNo()+"';</script>");
		}
	}
	
	//관리자 상품 삭제
	@RequestMapping(value="/admin/itemDelete", method = RequestMethod.POST)
	public void itemDeleteSubmit(@ModelAttribute("itemCommand") ItemCommand itemCommand, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//상품 삭제
		int result = itemService.itemDelete(itemCommand);
		
		//삭제 성공 여부
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		if(result > 2) {
	         writer.println("<script>alert('삭제 성공!'); location.href='" + request.getContextPath() + "/admin/itemList';</script>");
		}else {
			writer.println("<script>alert('삭제 실패!'); location.href='" + request.getContextPath() + "/admin/itemModify/"+itemCommand.getItem().getItemNo()+"';</script>");
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
