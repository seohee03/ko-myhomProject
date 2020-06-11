<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/view/include/nav.jsp"%>

<!-- trending item start-->
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
<!-- trending item end-->

	
	<hr/>
	<table border="1">
				<thead>
					<tr>
						<th>번호</th>
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
							<td>${article.articleTitle}</td>
							<td>${article.writerId}</td>
							<td>${article.regdate}</td>
							<td>${article.readCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>