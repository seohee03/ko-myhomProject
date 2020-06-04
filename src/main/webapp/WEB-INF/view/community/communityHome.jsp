<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="/WEB-INF/view/include/header.jsp"%>
	<%@ include file="/WEB-INF/view/include/nav.jsp"%>
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
			<a href="<c:url value="/community/writeDo" />">[글쓰기]</a>
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
		</div>
	</section>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>
