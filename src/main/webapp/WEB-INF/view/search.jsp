<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
</head>
<body>
결과페이지


<table border="1">
		<thead>
			<tr>
				<th>이미지</th>
				<th>카테고리</th>
				<th>상품명</th>
				<th>가격</th>
			</tr>
		</thead>
		<c:if test="${itemPage.hasNoItems()}">
			<tr>
				<td colspan="11">등록된 상품이 없습니다.</td>
			</tr>
		</c:if>
		<tbody>
		<c:set var = "path" value = "${pageContext.request.contextPath }"/>
		<c:forEach var="itemC" items="${itemList}">
			<tr onclick="location.href='${path }/itemDetail/${itemC.item.itemNo}'">
				<td><img src="${path }${itemC.itemImg.thumbUrl}" style="width: 50px"></td>
				<td><c:out value="${itemC.categorie.categorieName}" /></td>
				<td><c:out value="${itemC.item.itemName}" /></td>
				<td><c:out value="${itemC.item.price}" /></td>
			</tr>
		</c:forEach>
		<%-- <c:if test="${itemPage.hasItems()}">
			<tr>
				<td colspan="11">
					<c:if test="${itemPage.startPage > 5}">
						<a href="<c:url value="/store/${itemPage.startPage - 5}" />" >[이전]</a>
					</c:if>
					<c:forEach var="pNo" begin="${itemPage.startPage}" end="${itemPage.endPage}">
						<a href="<c:url value="/store/${pNo}" />">[${pNo}]</a>
					</c:forEach> 
					<c:if test="${itemPage.endPage < itemPage.totalPages}">
						<a href="<c:url value="/store/${itemPage.startPage + 5}" />">[다음]</a>
					</c:if>
				</td>
			</tr>
		</c:if> --%>
		</tbody>
	</table>

</body>
</html>