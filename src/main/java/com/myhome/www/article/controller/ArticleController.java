package com.myhome.www.article.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myhome.www.article.dto.Article;
import com.myhome.www.article.dto.Comment;
import com.myhome.www.article.dto.Pagination;
import com.myhome.www.article.service.ArticleService;
import com.myhome.www.article.service.CommentService;
import com.myhome.www.member.service.AuthInfo;
import com.myhome.www.member.service.LoginCommand;

@Controller
public class ArticleController {

	@Resource(name = "articleService")
	private ArticleService articleService;

	@Autowired
	private CommentService commentService;
	
	
	// 전체리스트
		@RequestMapping(value = "/community")
		public String articleList(@ModelAttribute("article") Article article, @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
		
			int listCnt = articleService.selectAllCount();
			Pagination pagination = new Pagination(listCnt, curPage);
			article.setStartIndex(pagination.getStartIndex());
			article.setCntPerPage(pagination.getPageSize());
			
			List<Article> articleList = articleService.selectArticleList(article);
			List<Article> byWriterIdArticleList = articleService.selectArticleByWriterId(article.getWriterId());
			model.addAttribute("byWriterIdArticleList", byWriterIdArticleList);
			model.addAttribute("articleList", articleList);
			model.addAttribute("listCnt", listCnt);
			model.addAttribute("pagination", pagination);
			return "community/communityHome";
		}
		
		// 아이디로 리스트 페이지
		@RequestMapping(value = "/byWriterId")
		public String byWriterIdList(@ModelAttribute("article") Article article, @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
			
			int listCnt = articleService.selectAllCount();
			Pagination pagination = new Pagination(listCnt, curPage);
			article.setStartIndex(pagination.getStartIndex());
			article.setCntPerPage(pagination.getPageSize());
			
			List<Article> byWriterIdArticleList = articleService.selectArticleByWriterId(article.getWriterId());
			model.addAttribute("byWriterIdArticleList", byWriterIdArticleList);
			model.addAttribute("listCnt", listCnt);
			model.addAttribute("pagination", pagination);
			return "community/byWriterIdArticleList";
		}
	
//	// 리스트 - 페이징처리 실패
//	@RequestMapping(value = "/community", method = RequestMethod.GET)
//	public String articleList(Model model, ArticlePage articlePage) throws Exception {
//		
//		//List<Article> articleList = articleService.selectArticleList(articlePage);
//
//		model.addAttribute("articleList", articleService.selectArticleList(articlePage));
//		
//		ArticlePageMaker articlePageMaker = new ArticlePageMaker();
//		articlePageMaker.setArticlePage(articlePage);
//		articlePageMaker.setTotalCount(articleService.selectAllCount());
//		
//		model.addAttribute("articlePageMaker", articlePageMaker);
//		return "community/communityHome";
//	}
	
//	// 리스트
//	@RequestMapping(value = "/community")
//	public String articleList(Model model) throws Exception {
//	
//		List<Article> articleList = articleService.selectArticleList();
//
//		model.addAttribute("articleList", articleList);
//		return "community/communityHome";
//	}
	
	//검색타입 정해서 검색하기(제목, 본문, 작성자)
	@RequestMapping(value = "/searchArticle")
	public String searchArticle(@Param("searchType") String searchType, @Param("keyword") String keyword, Model model) throws Exception {
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
		
		List<Article> articleList = articleService.selectSearchTypeArticleList(searchType, keyword);
		
		model.addAttribute("articleList", articleList);
		return "community/communityHome";
	}

	// 게시글 등록 폼
		@RequestMapping(value = "/community/writeDo", method = RequestMethod.GET)
		public String writeArticle(@ModelAttribute Article article, @ModelAttribute LoginCommand loginCommand, HttpSession session) {
			AuthInfo authInfo = null;
			authInfo = (AuthInfo) session.getAttribute("authInfo");
			
			String url = "";
			
			if(authInfo != null) {
				url = "community/writeArticle";
			}else {
				System.out.println("로그인 하세요");
				url = "login/loginForm";
			}
			
			return url;
		}

		// 글등록 버튼 누르면
		@RequestMapping(value = "/community/writeDo", method = RequestMethod.POST)
		public String writeArticleSubmit(
				
				@ModelAttribute("article") Article article, HttpSession session,
				Model model,
				@ModelAttribute("files") MultipartFile files) throws Exception {
		
				AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
				article.setWriterId(authInfo.getMemberId());
				article.setWriterName(authInfo.getMemberName());
				System.out.println("==================== 글등록 컨트롤러 진입 ====================");
				System.out.println(">>>>>>>>>>>"+files.toString());
//				int url;
//				model.addAttribute("url", url); //url들이 썸네일임
				Article art = articleService.store(article);
				model.addAttribute("art", art);
				if (/*result > 0*/true) {
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
	public void modArticleSubmit(@ModelAttribute("article") Article article, HttpSession session, HttpServletRequest request,
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
			writer.println("<script>alert('수정 성공!'); location.href='" + request.getContextPath() + "/community/readArticle/"
					+ article.getArticleNo() + "';</script>");
		} else {
			writer.println("<script>alert('수정 실패!'); location.href='" + request.getContextPath() + "/community';</script>");
		}
	}

	// 해당 게시글의 작성자가 상품 삭제
	@RequestMapping(value = "/community/delArticle", method = RequestMethod.POST)
	public void delArticleSubmit(@ModelAttribute Article article, Model model, HttpServletResponse response, HttpServletRequest request) throws Exception {
		System.out.println("====================>del");
		System.out.println(article.getArticleNo());
		
		int result = articleService.deleteArticle(article);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter writer = response.getWriter();
		System.out.println("===============>result" + result);
		
		if (result > 0) {
			writer.println("<script>alert('삭제 성공!'); location.href='" + request.getContextPath() + "/community';</script>");
		} else {
			writer.println("<script>alert('삭제 실패!'); location.href='" + request.getContextPath() + "/community/readArticle/"
					+ article.getArticleNo() + "';</script>");
		}
	}
	// 글 보기(조회수 증가)
		@RequestMapping(value = "/community/readArticle/{articleNo}", method = RequestMethod.GET)
		public String readArticle(@PathVariable("articleNo") int articleNo, @ModelAttribute("comment") Comment comment, @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
			// System.out.println(articleNo);
			Article article = articleService.selectArticleByNo(articleNo);
			model.addAttribute("article", article);
			
			//해당 글의 댓글 갯수
			int listCnt = commentService.selectAllCount(articleNo);
			Pagination pagination = new Pagination(listCnt, curPage);
			comment.setStartIndex(pagination.getStartIndex());
			comment.setCntPerPage(pagination.getPageSize());
			System.out.println("listCnt>>>>>>"+listCnt);
			System.out.println("curPage>>>>>" + curPage);
			System.out.println("pagination.getStartIndex()>>>>"+pagination.getStartIndex());
			System.out.println("pagination.getPageSize()>>>>"+pagination.getPageSize());
			System.out.println("comment.getStartIndex()>>>>>"+comment.getStartIndex());
			System.out.println("comment.getCntPerPage()>>>>>"+comment.getCntPerPage());
			System.out.println("articleNo"+ comment.getArticleNo());
			
			List<Comment> commentList = commentService.selectComment(comment);
			model.addAttribute("commentList", commentList);
			model.addAttribute("listCnt", listCnt);
			model.addAttribute("pagination", pagination);
			
			return "community/readArticle";
		}
	
	
	/* ********************************** */
	
	// 리스트
   @RequestMapping(value = "/admin/articleList", method = RequestMethod.GET)
   public String articleListForAdim(@ModelAttribute("article") Article article, @RequestParam(defaultValue="1") int curPage, Model model) throws Exception {
	    System.out.println("article>>>>>>>>>"+article);
	    int listCnt = articleService.selectAllCount();
		Pagination pagination = new Pagination(listCnt, curPage);
		article.setStartIndex(pagination.getStartIndex());
		article.setCntPerPage(pagination.getPageSize());
		System.out.println("pagination.getStartIndex()>>>>>>"+	pagination.getStartIndex());
		System.out.println("article.getStartIndex()>>>>>>"+	article.getStartIndex());
		System.out.println("article.getCntPerPage()>>>>>>"+	article.getCntPerPage());
		List<Article> articleList = articleService.selectArticleList(article);

		model.addAttribute("articleList", articleList);
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pagination", pagination);
		
      return "admin/articleManager/articleList";
   }
}
