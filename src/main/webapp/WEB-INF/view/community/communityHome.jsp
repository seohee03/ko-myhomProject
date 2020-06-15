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
<c:set var="path" value="${pageContext.request.contextPath }" />
<!--================Blog Area =================-->
<!-- community Home -->
<div class="container">
	<article class="blog_item">
		<div class="btnArea">
			<!-- <form action="searchItem" method="get">
				<select id="searchType" name="searchType">
					<option value="title">제목</option>
					<option value="content">본문</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" placeholder="검색" id="keyword" name="keyword">
				<input type="button" id="searchBtn" value="검색">
			</form> -->
			<a href="<c:url value="/community/writeDo" />" class="genric-btn info circle arrow">글쓰기</a>
		</div>
		<div class="pdList">
			<ul class="clearfix">
				<c:forEach var="article" items="${articleList}">
				<li>
					<div class="imgArea" onclick="location.href='community/readArticle/${article.articleNo}'">
						<%-- <img class="card-img rounded-0" src="${article.articleContent}" alt=""> --%>
	                    <img src="${pageContext.request.contextPath }${article.articleThumbUrl}">
					</div>
					<div class="blog_details">
						<h5 onclick="location.href='community/readArticle/${article.articleNo}'">${article.articleTitle}</h5>
						<div class="blog-info-link">
							<a href="<c:url value="/community/writerPage/${article.writerId }" />"><i class="far fa-user"></i><c:out value="${article.writerId}" /></a></br>
							<i class="far fa-comments"></i>Comments ${article.readCount}
						</div>
					</div>
					
				</li>
				</c:forEach>
			</ul>
		</div>
	</article>
</div>
<script type="text/javascript">
function fn_paging(curPage) {
	location.href = "community?curPage=" + curPage;
}
</script>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>
