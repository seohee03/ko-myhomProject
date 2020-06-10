<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/admin/include/header.jsp"%>

<style>
td:hover {
	color: blue;
	cursor: pointer;
}
</style>
</head>

<c:set var="path" value="${pageContext.request.contextPath }" />
	
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
					<button type="button" class="navyBtn" onClick="location.href='${path}/admin/itemRegister'" >상품등록</button>
					<table class="itemListTable">
						<thead>
							<tr>
								<th>이미지</th>
								<th>번호</th>
								<th>카테고리</th>
								<th>상품명</th>
								<th>상세설명</th>
								<th>가격</th>
								<th>재고</th>
								<th>등록일</th>
							</tr>
						</thead>
						<c:if test="${itemPage.hasNoItems()}">
							<tr>
								<td colspan="9">등록된 상품이 없습니다.</td>
							</tr>
						</c:if>
						<tbody>
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
						</tbody>
					</table>
				</div>
			</section>
			</div>
		</div>
</body>
</html>