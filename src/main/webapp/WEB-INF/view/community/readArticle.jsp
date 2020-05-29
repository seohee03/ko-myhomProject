<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">
	$(function() {
		$('#modifyBtn').click(function() {
			var result = confirm('수정하시겠습니까?');
			if (result) {
				//액션 경로 지정
				$("#frm").attr("action", "/www/community/modifyDo");
				$("#frm").submit();
			} else {
				return;
			}
		});

		$('#deleteBtn').click(function() {
			var result = confirm('삭제하시겠습니까?');
			if (result) {
				//액션 경로 지정
				$("#frm").attr("action", "/www/community/delArticle");
				$("#frm").submit();
			} else {
				return;
			}
		});
	});
</script>
</head>
<body>
	글보기페이지
	<br />
	<form:form modelAttribute="article" method="POST" id="frm">
		<a href="<c:url value="/cart" />">[장바구니]</a>
		<a href="<c:url value="/mypage" />">[마이페이지]</a>
		<br />
		<a href="<c:url value="/community" />">[커뮤니티]</a>
		<a href="<c:url value="/store" />">[스토어]</a>
		<a href="<c:url value='/'/>">[메인]</a>
		<a href="<c:url value='/community/modifyDo/${article.articleNo}'/>">[수정]</a>
		<%-- <a href="<c:url value='/community/delArticle'/>" id="deleteBtn">[삭제]</a> --%>
		<input type="button" id="deleteBtn" value="삭제">
		<%-- <a href="<c:url value='/community/delArticle'/>">[삭제]</a> --%>
		<br />
		<hr />

		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>게시일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<%-- <c:forEach var="article" items="${articleList}"> --%>
				<c:set var="article" value="${article}" />
				<tr>
					<td><c:out value="${article.articleNo}" /></td>
					<td><c:out value="${article.articleTitle}" /></td>
					<td><c:out value="${article.articleContent}" /></td>
					<td><c:out value="${article.writerId}" /></td>
					<td><c:out value="${article.regdate}" /></td>
					<td><c:out value="${article.readCount}" /></td>
				</tr>
				<%-- </c:forEach> --%>
			</tbody>
		</table>
	</form:form>
</body>
</html>