<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
</head>
<body>
게시판홈
   <br />
    <a href="<c:url value="/cart" />">[장바구니]</a>
    <a href="<c:url value="/mypage" />">[마이페이지]</a>
    <br />
    <a href="<c:url value="/community/writeDo" />">[글쓰기]</a>
    <a href="<c:url value="/store" />">[스토어]</a>
    <a href="<c:url value="/" />">[메인]</a>
    <br />

<h1>게시판 홈</h1>
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
			<tr>
				<td><c:out value="${article.articleNo}" /></td>
				<td><a href="<c:url value="community/readArticle/${article.articleNo}"/>">${article.articleTitle}</td>
				<td><c:out value="${article.writerId}" /></td>
				<td><c:out value="${article.regdate}" /></td>
				<td><c:out value="${article.readCount}" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>