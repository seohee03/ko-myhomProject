package com.myhome.www.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myhome.www.article.dto.Article;
import com.myhome.www.article.service.ArticleService;
import com.myhome.www.item.service.ItemCommand;
import com.myhome.www.item.service.ItemService;

@Controller
public class MyhomeController {

	@Resource(name = "itemService")
	private ItemService itemService;
	@Resource(name = "articleService")
	private ArticleService articleService;
	
	
	// index
	@RequestMapping(value = "/")
	public String indexPage(Model model) throws Exception {
		
		//상품 8개만 조회
		List<ItemCommand> itemCommandList = itemService.selectItemForIndex();
		model.addAttribute("itemCommandList", itemCommandList);
		return "index";
	}
	
	
	
	 // 검색하기
	 @RequestMapping(value = "/search")
	 public String searchItem(@RequestParam("keyword") String keyword, Model model) throws Exception {
		 System.out.println(">>>>>>>>>>>>>>keyword : " + keyword);
		 
		 //상품 조회
		 List<ItemCommand> itemList = itemService.selectSearchItemList(keyword);
		//게시글 조회
		 List<Article> articleList = articleService.selectSearchArticleList(keyword); 
		 model.addAttribute("itemList", itemList);
		 model.addAttribute("articleList", articleList);
		 return "search";
	 }
}
