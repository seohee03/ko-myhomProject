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
스토어홈
   <br />
    <a href="<c:url value="/cart" />">[장바구니]</a>
    <a href="<c:url value="/mypage" />">[마이페이지]</a>
    <br />
    <a href="<c:url value="/" />">[커뮤니티]</a>
    <a href="<c:url value="/store" />">[스토어]</a>
    <br />

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
			<tr onclick="location.href='store/itemDetail/${item.itemNo}'">
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