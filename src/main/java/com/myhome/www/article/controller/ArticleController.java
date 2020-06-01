package com.myhome.www.article.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myhome.www.article.dto.Article;
import com.myhome.www.article.service.ArticleService;
import com.myhome.www.item.dto.Item;
import com.myhome.www.member.service.AuthInfo;

@Controller
public class ArticleController {

	@Resource(name = "articleService")
	private ArticleService articleService;

	// 리스트
	@RequestMapping(value = "/community")
	public String articleList(Model model) throws Exception {
		List<Article> articleList = articleService.selectArticleList();

		/*
		 * for(Article a : articleList) { System.out.println(a.toString()); }
		 */
		model.addAttribute("articleList", articleList);
		return "community/communityHome";
	}

	// 게시글 등록 폼
	@RequestMapping(value = "/community/writeDo", method = RequestMethod.GET)
	public String writeArticle(@ModelAttribute Article article) {
		return "community/writeArticle";
	}

	// 글등록 버튼 누르면
	@RequestMapping(value = "/community/writeDo", method = RequestMethod.POST)
	public String writeArticleSubmit(@ModelAttribute Article article, HttpSession session) throws Exception {

		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		article.setWriterId(authInfo.getMemberId());
		article.setWriterName(authInfo.getMemberName());

		int result;
		result = articleService.insertArticle(article);
		if (result > 0) {
			System.out.println("글등록 성공");
			int no = articleService.selectLastArticleNo();
			System.out.println("최근 입력한 글 키값 : " + no);
			return "redirect:/community/readArticle/" + no;
		}
		System.out.println("글등록 실패");
		return "community/writeArticle";
	}

	// 글 수정 폼
	@RequestMapping(value = "/community/modifyDo/{articleNo}", method = RequestMethod.GET)
	public String modArticle(@PathVariable("articleNo") int articleNo, Model model) throws Exception {
		System.out.println(articleNo);

		Article article = articleService.selectArticleByNo(articleNo);
		model.addAttribute("article", article);
		return "community/modArticle";
	}

//		
	// 해당 게시글의 작성자가 수정 버튼 누르면
	@RequestMapping(value = "/community/modifyDo", method = RequestMethod.POST)
	public void modArticleSubmit(@ModelAttribute("article") Article article, HttpSession session,
			HttpServletResponse response) throws Exception {

		System.out.println("modify controller>>>>");
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
		article.setWriterId(authInfo.getMemberId());
		article.setWriterName(authInfo.getMemberName());
		int result;
		result = articleService.updateArticle(article);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		if (result > 0) {
			writer.println("<script>alert('수정 성공!'); location.href='/www/community/readArticle/"
					+ article.getArticleNo() + "';</script>");
		} else {
			writer.println("<script>alert('수정 실패!'); location.href='/www/community';</script>");
		}
	}

	// 해당 게시글의 작성자가 상품 삭제
	@RequestMapping(value = "/community/delArticle", method = RequestMethod.POST)
	public void delArticleSubmit(@ModelAttribute Article article, Model model, HttpServletResponse response) throws Exception {
		System.out.println("====================>del");
		System.out.println(article.getArticleNo());
		
		int result = articleService.deleteArticle(article);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter writer = response.getWriter();
		System.out.println("===============>result" + result);
		
		if (result > 0) {
			writer.println("<script>alert('삭제 성공!'); location.href='/www/community';</script>");
		} else {
			writer.println("<script>alert('삭제 실패!'); location.href='/www/community/readArticle/"
					+ article.getArticleNo() + "';</script>");
		}
	}

	// 글 보기(조회수 증가)
	@RequestMapping(value = "/community/readArticle/{articleNo}", method = RequestMethod.GET)
	public String readArticle(@PathVariable("articleNo") int articleNo, Model model) throws Exception {
		// System.out.println(articleNo);
		Article article = articleService.selectArticleByNo(articleNo);
		model.addAttribute("article", article);
		return "community/readArticle";
	}
	
	
	/* ********************************** */
	
	// 리스트
   @RequestMapping(value = "/admin/articleList", method = RequestMethod.GET)
   public String articleListForAdim(Model model) throws Exception {
      List<Article> articleList = articleService.selectArticleList();
      System.out.println(">>>>>>>>>>>>>>>>>>>>>>");
      /*
       * for(Article a : articleList) { System.out.println(a.toString()); }
       */
      model.addAttribute("articleList", articleList);
      return "admin/articleManager/articleList";
   }
}
