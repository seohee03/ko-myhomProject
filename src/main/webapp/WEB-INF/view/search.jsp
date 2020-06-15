<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/view/include/nav.jsp"%>

<!-- item start-->
<section class="trending_items">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section_tittle text-left">
					<h4>스토어</h4>
			<c:set var = "path" value = "${pageContext.request.contextPath }"/>
					<a href="${path}/store" >전체보기</a>
					<hr>
				</div>
			</div>
		</div>
		<div class="pdList">
		<ul class="clearfix">
			<c:forEach var="itemC" items="${itemList}">
			<li>
				<a href="<c:url value="/itemDetail?itemNo=${itemC.item.itemNo }"/>">
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
			</c:forEach>
		</ul>
	</div>
	</div>
</section>
<!-- item end-->

<!-- article start-->
<section class="trending_items">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="section_tittle text-left">
                  <h4>커뮤니티</h4>
                  <a href="${pageContext.request.contextPath}/community">전체보기</a>
                  <hr>
               </div>
            </div>
         </div>
         <article class="blog_item">
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
   </section>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>