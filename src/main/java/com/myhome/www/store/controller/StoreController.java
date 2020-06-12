package com.myhome.www.store.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myhome.www.article.dto.Pagination;
import com.myhome.www.item.dto.Item;
import com.myhome.www.item.dto.ItemImg;
import com.myhome.www.item.service.ItemCommand;
import com.myhome.www.item.service.ItemPage;
import com.myhome.www.item.service.ItemService;
import com.myhome.www.store.dto.Cart;

@Controller
public class StoreController {
	
	@Resource(name = "itemService")
	private ItemService itemService;

	
//	//상품 리스트 & 스토어 홈
//	 @RequestMapping(value = "/store") 
//	 public String itemListForMember(Model model) throws Exception { 
//		 
//		 List<ItemCommand> itemList = itemService.selectItemList();
//		 
//		 model.addAttribute("itemList", itemList);
//		
//		 return "store/storeHome"; 
//	 }
	 
	 //상품 리스트
	@RequestMapping(value = "/store") 
	 public String itemListForAdmin() throws Exception { 

		return "forward:/store/1";
	 }
	
	//상품 리스트 & 스토어 홈
	 @RequestMapping(value = "/store/{pageNum}") 
	 public String itemListForMember(@PathVariable("pageNum") int pageNum, Model model) throws Exception {
		
		 int pageNo = 1;
		 if(pageNum>0) {
			 pageNo = pageNum;
		 }
		 ItemPage itemPage = itemService.getItemPage(pageNo);
		 model.addAttribute("itemPage", itemPage);
		 return "store/storeHome"; 
	 }
	 
	 @ResponseBody
	 @RequestMapping(value = "/storeMorePage/{cPno}")
	 public List<ItemCommand> storeMorePage(@PathVariable("cPno") int cPno, @ModelAttribute("item") Item item) throws Exception{
		System.out.println("ajax>>>>>>>>>>>>>>>>>>");
		//cPno = 현재 페이지에서 +1된 상태
		//ItemPage itemPage = itemService.getItemPage(cPno);
		
		int listCnt = 0;
		listCnt = itemService.selectCountItem();
		Pagination pagination = new Pagination(listCnt, cPno);
		
		item.setStartIndex(pagination.getStartIndex());
		item.setCntPerPage(pagination.getPageSize());
		
		//현재페이지의 리스트 조회
		List<ItemCommand> itemCommandList = itemService.selectItemPage(item);
		return itemCommandList;
	 }
	 
	 //상품 상세보기 페이지
	 @RequestMapping(value = "/itemDetail")
	 public String itemDetailForMember(@Param("itemNo") int itemNo, Model model, Item item, Cart cart) throws Exception{
		 
		 ItemCommand itemCommand = itemService.selectItemByItemNo(itemNo);
		 List<ItemImg> imgList = itemService.selectItemImgByItemNo(itemNo);
			
		 model.addAttribute("itemCommand", itemCommand);
		 model.addAttribute("imgList", imgList);
		
		 return "store/itemDetail";
		 
	 }
	 
	 @RequestMapping(value = "/store/category")
	 public String itemCategory(@Param("type") int type, @RequestParam(defaultValue="1") int curPage, @ModelAttribute("item") Item item, Model model) throws Exception {
		 
		 List<ItemCommand> itemCommandList = null;
		 int listCnt = 0;
		 Pagination pagination = null;
		 if(type == 1) {
			 listCnt = itemService.selectCountByCategorieNo(type);
			 pagination = new Pagination(listCnt, curPage);
			 item.setStartIndex(pagination.getStartIndex());
			 item.setCntPerPage(pagination.getPageSize());
			 item.setCategorieNo(type);
			 
			// itemCommandList = itemService.selectItemByCategoryNo(item, type);
			 itemCommandList = itemService.selectItemByCategoryNo(item);
			 
		 }else if(type == 2) {
			 listCnt = itemService.selectCountByCategorieNo(type);
			 pagination = new Pagination(listCnt, curPage);
			 item.setStartIndex(pagination.getStartIndex());
			 item.setCntPerPage(pagination.getPageSize());
			 item.setCategorieNo(type);
			 
			 itemCommandList = itemService.selectItemByCategoryNo(item);
			 System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>" + itemCommandList.get(0));
		 }else if(type == 3) {
			 listCnt = itemService.selectCountByCategorieNo(type);
			 pagination = new Pagination(listCnt, curPage);
			 item.setStartIndex(pagination.getStartIndex());
			 item.setCntPerPage(pagination.getPageSize());
			 item.setCategorieNo(type);
			 
			 itemCommandList = itemService.selectItemByCategoryNo(item);
		 }else if(type == 4) {
			 listCnt = itemService.selectCountByCategorieNo(type);
			 pagination = new Pagination(listCnt, curPage);
			 item.setStartIndex(pagination.getStartIndex());
			 item.setCntPerPage(pagination.getPageSize());
			 item.setCategorieNo(type);
			 
			 itemCommandList = itemService.selectItemByCategoryNo(item);
		 }else if(type == 5) {
			 listCnt = itemService.selectCountByCategorieNo(type);
			 pagination = new Pagination(listCnt, curPage);
			 item.setStartIndex(pagination.getStartIndex());
			 item.setCntPerPage(pagination.getPageSize());
			 item.setCategorieNo(type);
			 
			 itemCommandList = itemService.selectItemByCategoryNo(item);
		 }else if(type == 6) {
			 listCnt = itemService.selectCountByCategorieNo(type);
			 pagination = new Pagination(listCnt, curPage);
			 item.setStartIndex(pagination.getStartIndex());
			 item.setCntPerPage(pagination.getPageSize());
			 item.setCategorieNo(type);
			 
			 itemCommandList = itemService.selectItemByCategoryNo(item);
		 }else if(type == 7) {
			 listCnt = itemService.selectCountByCategorieNo(type);
			 pagination = new Pagination(listCnt, curPage);
			 item.setStartIndex(pagination.getStartIndex());
			 item.setCntPerPage(pagination.getPageSize());
			 item.setCategorieNo(type);
			 
			 itemCommandList = itemService.selectItemByCategoryNo(item);
		 }
		 System.out.println("--------------------------------------------");
		 System.out.println(itemCommandList.get(0).getItem().getItemName());
		 model.addAttribute("itemCommandList", itemCommandList);
		 model.addAttribute("listCnt", listCnt);
		 model.addAttribute("pagination", pagination);
		 return "store/storeHome";
	 }
	 
	 
	 
//	 //상품명 검색하기
//	 @RequestMapping(value = "/searchItem")
//	 public String searchItem() throws Exception {
//		
//		 return "forward:/store/storeHome/1";
//	 }
//	 
//	 //상품명 검색하기
//	 @RequestMapping(value = "/searchItem")
//	 public String searchItem(@RequestParam("keyword") String keyword, Model model) throws Exception {
//		 System.out.println(">>>>>>>>>>>>>>keyword : " + keyword);
//		 
//		 List<ItemCommand> itemList = itemService.selectSearchItemList(keyword);
//		 for(ItemCommand i : itemList) {
//			 System.out.println(i.toString());
//		 }
//		 model.addAttribute("itemList", itemList);
//		 return "search";
//	 }
	 
	
}
