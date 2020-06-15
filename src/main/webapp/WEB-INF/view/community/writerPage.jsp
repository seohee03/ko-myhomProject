<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<script>
	$(document).on('click', '#searchBtn', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/searchArticle";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});
	$(document).ready(function() {
		var writerId = $('#writerId').val();
		$('#writerIdtxt').text(writerId);
	})
</script>

</head>

<body>
<%@ include file="/WEB-INF/view/include/nav.jsp"%>

<div class="container">
	<article class="blog_item">
		<div class="btnArea">
			<div class="writerInfo">
				<span id="writerIdtxt"></span>님의 게시글
			</div>
			<a href="<c:url value="/community/writeDo" />" class="genric-btn info circle arrow">글쓰기</a>
		</div>
		<div class="pdList">
			<ul class="clearfix">
				<c:forEach var="article" items="${writerPage}">
				<li>
					<input type="hidden" id="writerId" value="${article.writerId }">
					<div class="imgArea" onclick="location.href='${path }/community/readArticle/${article.articleNo}'">
	                    <img src="${path }${article.articleThumbUrl}">
					</div>
					<div class="blog_details">
						<h5 onclick="location.href='${path }/community/readArticle/${article.articleNo}'">${article.articleTitle}</h5>
						<div class="blog-info-link">
							<a href="<c:url value="/community/writerPage/${article.writerId }" />"><i class="far fa-user"></i><c:out value="${article.writerId}" /></a></br>
							<i class="far fa-comments"></i>Comments ${article.readCount}
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		
		<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
				<li class="page-item">
					<c:if test="${pagination.curRange ne 1}">
						<a href="#" class="page-link" aria-label="Previous" onClick="fn_paging(1)">
							<i class="ti-angle-start"></i>[처음]
						</a>
					</c:if>
					<c:if test="${pagination.curPage ne 1}">
						<a href="#" class="page-link" aria-label="Previous" onClick="fn_paging('${pagination.prevPage }')">
							<i class="ti-angle-left"></i>
						</a>
					</c:if>
					<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
						<c:choose>
							<c:when test="${pageNum eq  pagination.curPage}">
								<li class="page-item">
									<a href="#" class="page-link" onClick="fn_paging('${pageNum }')">${pageNum }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item active">
									<a href="#" class="page-link" onClick="fn_paging('${pageNum }')">${pageNum }</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
						<li class="page-item">
							<a href="#" class="page-link" aria-label="Next" onClick="fn_paging('${pagination.nextPage }')">
								<i class="ti-angle-right"></i>
							</a>
						</li>
					</c:if>
					<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
						<a href="#" onClick="fn_paging('${pagination.pageCnt }')">
							<i class="ti-angle-last"></i>[끝]
						</a>
					</c:if>
					</li>
				</ul>
			</nav>
	</article>
</div>


<%-- 


	<!--================Blog Area =================-->
	<!-- community Home -->
	<section class="trending_items">
		<div class="container">
			<c:set var="path" value="${pageContext.request.contextPath }" />
			<div>
				<a href="<c:url value="/community/writeDo" />"
					class="genric-btn info circle arrow">글쓰기 </a>
			</div>
			<div class="pdList">
				<ul class="clearfix">
					<c:forEach var="writerPage" items="${writerPage}">
						<li>
							<a href="<c:url value="/community/readArticle/${writerPage.articleNo}"/>">
								<div class="imgArea">
									<img src="${pageContext.request.contextPath }${writerPage.articleThumbUrl}">
								</div>
								<div class="blog_details">
									<h5>${writerPage.articleTitle} | 작성자 : <c:out value="${writerPage.writerId}" />
										| 조회수 : <c:out value="${writerPage.readCount}" />
									</h5>
									<h5><c:out value="${writerPage.regdate}" /></h5>
								</div>
							</a>
							<ul class="blog-info-link">
								<li><a href="<c:url value="/byWriterId" />"><i
										class="far fa-user"></i> <c:out value="${writerPage.writerId}" /></a></li>
								<li><a href="#"><i class="far fa-comments"></i>Comments
										${pagination.listCnt}</a></li>
							</ul>
						</li>
					</c:forEach>
				</ul>
				<nav class="blog-pagination justify-content-center d-flex">
					<ul class="pagination">
						<li class="page-item">
							<c:if test="${pagination.curRange ne 1}">
								<a href="#" class="page-link" aria-label="Previous" onClick="fn_paging(1)">
									<i class="ti-angle-start"></i>[처음]
								</a>
							</c:if>
							<c:if test="${pagination.curPage ne 1}">
								<a href="#" class="page-link" aria-label="Previous" onClick="fn_paging('${pagination.prevPage }')">
									<i class="ti-angle-left"></i>
								</a>
							</c:if>
							<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
								<c:choose>
									<c:when test="${pageNum eq  pagination.curPage}">
										<li class="page-item">
											<a href="#" class="page-link" onClick="fn_paging('${pageNum }')">${pageNum }</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item active">
											<a href="#" class="page-link" onClick="fn_paging('${pageNum }')">${pageNum }</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
								<li class="page-item">
									<a href="#" class="page-link" aria-label="Next" onClick="fn_paging('${pagination.nextPage }')">
										<i class="ti-angle-right"></i>
									</a>
								</li>
							</c:if>
							<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
								<a href="#" onClick="fn_paging('${pagination.pageCnt }')">
									<i class="ti-angle-last"></i>[끝]
								</a>
							</c:if>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</section>

                <div>
                    총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
                </div>
 --%>
	<script type="text/javascript">
		function fn_paging(curPage) {
			location.href = "community/writerPage/${writerId}?curPage=" + curPage;
		}
	</script>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>
