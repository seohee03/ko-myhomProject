<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

</head>
<body>
<p>cart page</p>

<table border="1">
		<thead>
			<tr>
				<th>카트번호</th>
				<th>상품명</th>
				<th>수량</th>
				<th>가격</th>
				<th>총 가격</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="cartCommand" items="${cartCommandList}">
		
			<tr onclick="location.href='itemDetail/${itemC.item.itemNo}'">
				<td><c:out value="${cartCommand.cartNo}" /></td>
				<td><c:out value="${cartCommand.itemName}" /></td>
				<td><c:out value="${cartCommand.amount}" /></td>
				<td><c:out value="${cartCommand.price}" /></td>
				<td><c:out value="${cartCommand.price * cartCommand.amount}" /></td>
			</tr>
				
		</c:forEach>
		</tbody>
	</table>


</body>
</html>