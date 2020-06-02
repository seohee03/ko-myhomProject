<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

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
<form action="searchItem">
<input type="text" placeholder="검색" name="keyword">
<input type="submit" value="검색">
</form>
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
		
			<tr onclick="location.href='itemDetail/${itemC.item.itemNo}'">
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
	</table>
</body>
</html>