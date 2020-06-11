<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/admin/include/header.jsp" %>

</head>
<body>

<%@ include file="/WEB-INF/view/admin/include/nav.jsp"%>

<div id="main-wrapper">
		<div class="main-content">
			<section id="product">
				<!-- 제목  -->
				<div class="content-header">
					<h1>상품 관리</h1>
				</div>
				<!-- 내용 -->	
				<div class= "product-content">
					<table class="itemListTable">
						<thead>
							<tr>
								<th>주문내역번호 historyNo</th>
								<th>주문번호 orderNo</th>
								<th>회원번호 memberNo</th>
								<th>상품명 itemName</th>
								<th>주문날짜 orderDate</th>
								<th>가격 price</th>
								<th>수량 amount</th>
								<th>총가격 price*amount</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="orderHistory" items="${orderHistoryList }">
							<tr>
								<td><c:out value="${orderHistory.historyNo}" /></td>
								<td><c:out value="${orderHistory.orderNo}" /></td>
								<td><c:out value="${orderHistory.memberNo}" /></td>
								<td><c:out value="${orderHistory.itemName}" /></td>
								<td><tf:formatDateTime value="${orderHistory.orderDate}" pattern="yyyy-MM-dd" /></td>
								<td><c:out value="${orderHistory.price}" /></td>
								<td><c:out value="${orderHistory.amount}" /></td>
								<td><c:out value="${orderHistory.price * orderHistory.amount}" /></td>
							</tr>
							</c:forEach>
						</tbody>
						<%-- <c:if test="${itemPage.hasNoItems()}">
							<tr>
								<td colspan="9">등록된 상품이 없습니다.</td>
							</tr>
						</c:if> --%>
						<%-- <tbody>
							<c:forEach var="itemC" items="${itemPage.content}">
								<tr
									onclick="location.href='${path }/admin/itemModify/${itemC.item.itemNo}'">
									<td><img src="${path }${itemC.itemImg.thumbUrl}"
										style="width: 50px"></td>
									<td><c:out value="${itemC.item.itemNo}" /></td>
									<td><c:out value="${itemC.categorie.categorieName}" /></td>
									<td><c:out value="${itemC.item.itemName}" /></td>
									<td><c:out value="${itemC.item.itemDetail}" /></td>
									<td><c:out value="${itemC.item.price}" /></td>
									<td><c:out value="${itemC.item.stock}" /></td>
									<td><tf:formatDateTime
											value="${itemC.item.itemRegDateTime }" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
							<c:if test="${itemPage.hasItems()}">
								<tr>
									<td colspan="9"><c:if test="${itemPage.startPage > 5}">
											<a
												href="<c:url value="/admin/itemList/${itemPage.startPage - 5}" />">[이전]</a>
										</c:if> <c:forEach var="pNo" begin="${itemPage.startPage}"
											end="${itemPage.endPage}">
											<a href="<c:url value="/admin/itemList/${pNo}" />">[${pNo}]</a>
										</c:forEach> <c:if test="${itemPage.endPage < itemPage.totalPages}">
											<a
												href="<c:url value="/admin/itemList/${itemPage.startPage + 5}" />">[다음]</a>
										</c:if></td>
								</tr>
							</c:if>
						</tbody> --%>
					</table>
				</div>
			</section>
			</div>
		</div>


</body>
</html>