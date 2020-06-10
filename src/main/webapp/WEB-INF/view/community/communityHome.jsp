<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>

<script>
	$(document).on('click', '#searchBtn', function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/searchArticle";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});	
</script>

</head>

<body>
	<%@ include file="/WEB-INF/view/include/nav.jsp"%>
	
	<!--================Blog Area =================-->
	<!-- community Home -->
	<div class="container">
	
<!-- 	<form action="searchItem" method="get" id="searchForm">
		<input type="text" placeholder="검색" name="keyword" value="" id="keyword">
		<input type="button" value="검색" id="searchBtn">
	</form> -->
	
	<c:set var="path" value="${pageContext.request.contextPath }" />
	<article class="blog_item">
	 <div>
                	<a href="<c:url value="/community/writeDo" />" class="genric-btn info circle arrow">글쓰기
                	<span class="lnr lnr-arrow-right"></span></a>
                </div>
	<div class="pdList">
		<ul class="clearfix">
		<c:forEach var="article" items="${articleList}">
			<li onclick="location.href='community/readArticle/${article.articleNo}'">
			<%-- onclick="javascript:moveItemViewPage('${path }','${article.articleNo} ','${path }${article.articleThumbUrl}'); return false;"> --%>
				<a>
				<div class="imgArea">
					<img class="card-img rounded-0" src="${article.articleContent}" alt="">
                    <img src="${pageContext.request.contextPath }${article.articleThumbUrl}">
				</div>
				<div class="blog_details">
                    <h5>${article.articleTitle} | 작성자 : <c:out value="${article.writerId}" /> | 조회수 - ${article.readCount}</h5>
                    <h5>${article.regdate}</h5>
					<%-- <img alt="" src="${path }${itemC.itemImg.thumbUrl}"> --%>
				</a>
				<ul class="blog-info-link">
                   <li><a href="<c:url value="/byWriterId" />"><i class="far fa-user"></i><c:out value="${article.writerId}" /></a></li>
                   <li><a href="#"><i class="far fa-comments"></i>Comments ${pagination.listCnt}</a></li>
                  <%--  <li>조회수 - ${article.readCount}</li> --%>
               </ul>
               </div>
			</li>
			</c:forEach>
			<%-- <c:forEach var="itemC" items="${itemCommandList}">
			<li onclick="javascript:moveItemViewPage('${path }','${itemC.item.itemNo} ','${path }${itemC.itemImg.thumbUrl}'); return false;">
				
				<a>
				<div class="imgArea">
					<img alt="" src="${path }${itemC.itemImg.thumbUrl}">
				</div>
				<div class="infoArea">
				 	<p class="brand"><c:out value="${itemC.categorie.categorieName}" /></p>
				 	<p class="ttl"><c:out value="${itemC.item.itemName}" /></p>
				 	<p class="pdSum"><c:out value="${itemC.item.price}" />원</p>
				</div>
				</a>
				
			</li>
			</c:forEach> --%>
		</ul>
	</div>
	</article>

	<%-- <!--================Blog Area =================-->
    <section class="blog_area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                    <c:forEach var="article" items="${articleList}">
                       <article class="blog_item">
                        <div onclick="location.href='community/readArticle/${article.articleNo}'">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="${article.articleContent}" alt="">
                                <a href="#" class="blog_item_date">
                                ${article.regdate}
                                    <h3>${article.regdate}</h3>
                                    <p>Jan</p>
                                </a>
                            </div>
<a href="<c:url value="/community/writeDo" />" class="genric-btn info circle arrow">글쓰기</a>
         <table border="1">
            <!-- <thead>
               <tr>
                  <th>번호</th>
                  <th>이미지</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>게시일</th>
                  <th>조회수</th>
               </tr>
            </thead> -->
            <tbody>
               <c:forEach var="article" items="${articleList}">
                  <tr
                     onclick="location.href='community/readArticle/${article.articleNo}'">
                     <td>${article.articleNo}</td>
                     <td><img src="${path }${itemC.itemImg.thumbUrl}" style="width: 50px"></td>
                     <td>${article.articleTitle}</td>
                     <td>${article.writerId}</td>
                     <td>${article.regdate}</td>
                     <td>${article.readCount}</td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
                            <div class="blog_details">
                                <a class="d-inline-block" href="single-blog.html">
                                    <h2>${article.articleTitle}</h2>
                                </a>
                                <p>${article.articleContent}</p>
                                </div>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>
                                    <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>
                                    <li>조회수 - ${article.readCount}</li>
                                </ul>
                            </div>
                        </article>
					</c:forEach>
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="img/blog/single_blog_2.png" alt="">
                                <a href="#" class="blog_item_date">
                                    <h3>15</h3>
                                    <p>Jan</p>
                                </a>
                            </div>
                            
                            <div class="blog_details">
                                <a class="d-inline-block" href="single-blog.html">
                                    <h2>Google inks pact for new 35-storey office</h2>
                                </a>
                                <p>That dominion stars lights dominion divide years for fourth have don't stars is that
                                    he earth it first without heaven in place seed it second morning saying.</p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>
                                    <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>
                                </ul>
                            </div>
                        </article>
                        
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item active">
                                    <a href="#" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- <input type="text" placeholder="검색" id="keyword" name="keyword">
				<input type="button" id="searchBtn" value="검색"> -->
				
                <div class="col-lg-4">
                <div>
                	<a href="<c:url value="/community/writeDo" />" class="genric-btn info circle arrow">글쓰기
                	<span class="lnr lnr-arrow-right"></span></a>
                </div>
                
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder='검색'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = '검색'">
                                        <div class="input-group-append">
                                            <button class="btn" type="button" id="searchBtn"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1"
                                    type="submit" id="searchBtn">검색</button>
                            </form>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Category</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Resaurant food</p>
                                        <p>(37)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Travel news</p>
                                        <p>(10)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Modern technology</p>
                                        <p>(03)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Product</p>
                                        <p>(11)</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Inspiration</p>
                                        <p>21</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>Health Care (21)</p>
                                        <p>09</p>
                                    </a>
                                </li>
                            </ul>
                        </aside>

                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">Recent Post</h3>
                            <div class="media post_item">
                                <img src="img/post/post_1.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>From life was you fish...</h3>
                                    </a>
                                    <p>January 12, 2019</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="img/post/post_2.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>The Amazing Hubble</h3>
                                    </a>
                                    <p>02 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="img/post/post_3.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>Astronomy Or Astrology</h3>
                                    </a>
                                    <p>03 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="img/post/post_4.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>Asteroids telescope</h3>
                                    </a>
                                    <p>01 Hours ago</p>
                                </div>
                            </div>
                        </aside>
                        <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">Tag Clouds</h4>
                            <ul class="list">
                                <li>
                                    <a href="#">project</a>
                                </li>
                                <li>
                                    <a href="#">love</a>
                                </li>
                                <li>
                                    <a href="#">technology</a>
                                </li>
                                <li>
                                    <a href="#">travel</a>
                                </li>
                                <li>
                                    <a href="#">restaurant</a>
                                </li>
                                <li>
                                    <a href="#">life style</a>
                                </li>
                                <li>
                                    <a href="#">design</a>
                                </li>
                                <li>
                                    <a href="#">illustration</a>
                                </li>
                            </ul>
                        </aside>


                        <aside class="single_sidebar_widget instagram_feeds">
                            <h4 class="widget_title">Instagram Feeds</h4>
                            <ul class="instagram_row flex-wrap">
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_5.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_6.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_7.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_8.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_9.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_10.png" alt="">
                                    </a>
                                </li>
                            </ul>
                        </aside>


                        <aside class="single_sidebar_widget newsletter_widget">
                            <h4 class="widget_title">Newsletter</h4>

                            <form action="#">
                                <div class="form-group">
                                    <input type="email" class="form-control" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = 'Enter email'" placeholder='Enter email' required>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1"
                                    type="submit">Subscribe</button>
                            </form>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->


	<section id="features" style="width: 60%; margin: auto;">
		<div class="container">
			<h1>게시판 홈</h1>
			
			<form action="searchItem" method="get">
				<select id="searchType" name="searchType">
					<option value="title">제목</option>
					<option value="content">본문</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" placeholder="검색" id="keyword" name="keyword">
				<input type="button" id="searchBtn" value="검색">
			</form>
			<a href="<c:url value="/community/writeDo" />" class="genric-btn info circle arrow">글쓰기</a>
			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>이미지</th>
						<th>제목</th>
						<th>작성자</th>
						<th>게시일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${articleList}">
						<tr
							onclick="location.href='community/readArticle/${article.articleNo}'">
							<td>${article.articleNo}</td>
							<td><img src="${path }${itemC.itemImg.thumbUrl}" style="width: 50px"></td>
							<td>${article.articleTitle}</td>
							<td>${article.writerId}</td>
							<td>${article.regdate}</td>
							<td>${article.readCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
            <c:if test="${pagination.curRange ne 1 }">
                <a href="#" onClick="fn_paging(1)">[처음]</a> 
            </c:if>
            <c:if test="${pagination.curPage ne 1}">
                <a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
            </c:if>
            <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                <c:choose>
                    <c:when test="${pageNum eq  pagination.curPage}">
                        <span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                    </c:when>
                    <c:otherwise>
                        <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
            </c:if>
            <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
            </c:if>
        </div>
                
                <div>
                    총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
                </div>
	</section>
	
	
	
	
 --%>
	
	<script type="text/javascript">
	function fn_paging(curPage) {
		location.href = "community?curPage=" + curPage;
		}
</script>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>
