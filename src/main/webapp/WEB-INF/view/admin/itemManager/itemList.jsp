<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<style>
td:hover{
	color:blue;
	cursor:pointer;
}
</style>
</head>
<body>
<a href="<c:url value="/admin/itemRegister" />">[상품등록]</a>

<h1>Item List</h1>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
				<th>옵션1</th>
				<th>옵션2</th>
				<th>이미지</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="itemC" items="${itemList}">
		
			<tr onclick="location.href='itemModify/${itemC.item.itemNo}'">
				<td><c:out value="${itemC.item.itemNo}" /></td>
				<td><c:out value="${itemC.categorie.categorieName}" /></td>
				<td><c:out value="${itemC.item.itemCode}" /></td>
				<td><c:out value="${itemC.item.itemName}" /></td>
				<td><c:out value="${itemC.item.price}" /></td>
				<td><c:out value="${itemC.item.stock}" /></td>
				<td><c:out value="${itemC.option1.option1Name}" /></td>
				<td><c:out value="${itemC.option2.option2Name}" /></td>
				<td><c:out value="${itemC.itemImg.imgName}" /></td>
				<td><tf:formatDateTime value="${itemC.item.itemRegDateTime }" pattern="yyyy-MM-dd"/></td>
			</tr>
				
		</c:forEach>
		</tbody>
		<c:if test="${empty itemList}">
		<p>등록된 상품이 없습니다.</p>
		</c:if>
		</tbody>
	</table>
	
</body>
</html>