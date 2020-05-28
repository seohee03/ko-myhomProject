<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="<c:url value="/admin/itemRegister" />">[상품등록]</a>

<h1>Item List</h1>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${itemList}">
			<tr onclick="location.href='itemModify/${item.itemNo}'">
				<%-- <td><c:out value="${item.RNUM}" /></td> --%>
				<td><c:out value="${item.itemNo}" /></td>
				<td><c:out value="${item.itemCode}" /></td>
				<td><c:out value="${item.itemName}" /></td>
				<td><c:out value="${item.price}" /></td>
				<td><c:out value="${item.stock}" /></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
</body>
</html>