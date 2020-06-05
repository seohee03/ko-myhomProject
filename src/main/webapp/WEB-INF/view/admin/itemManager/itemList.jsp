<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="/WEB-INF/view/include/header.jsp"%>
	<%@ include file="/WEB-INF/view/include/nav.jsp"%>
<style>
td:hover{
	color:blue;
	cursor:pointer;
}
</style>


<c:set var = "path" value = "${pageContext.request.contextPath }"/>

<a href="<c:url value="/admin/itemRegister" />">[상품등록]</a>

<h1>Item List</h1>
	<table border="1">
		<thead>
			<tr>
				<th>이미지</th>
				<th>번호</th>
				<th>카테고리</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
				<th>옵션1</th>
				<th>옵션2</th>
				<th>이미지 경로</th>
				<th>등록일</th>
			</tr>
		</thead>
		<c:if test="${itemPage.hasNoItems()}">
			<tr>
				<td colspan="11">등록된 상품이 없습니다.</td>
			</tr>
		</c:if>
		<tbody>
		<c:forEach var="itemC" items="${itemPage.content}">
			<tr onclick="location.href='${path }/admin/itemModify/${itemC.item.itemNo}'">
				<td><img src="${path }${itemC.itemImg.thumbUrl}" style="width: 50px"></td>
				<td><c:out value="${itemC.item.itemNo}" /></td>
				<td><c:out value="${itemC.categorie.categorieName}" /></td>
				<td><c:out value="${itemC.item.itemCode}" /></td>
				<td><c:out value="${itemC.item.itemName}" /></td>
				<td><c:out value="${itemC.item.price}" /></td>
				<td><c:out value="${itemC.item.stock}" /></td>
				<td><c:out value="${itemC.option1.option1Name}" /></td>
				<td><c:out value="${itemC.option2.option2Name}" /></td>
				<td><c:out value="${itemC.itemImg.thumbUrl}" /></td>
				<td><tf:formatDateTime value="${itemC.item.itemRegDateTime }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
		<c:if test="${itemPage.hasItems()}">
			<tr>
				<td colspan="11">
					<c:if test="${itemPage.startPage > 5}">
						<a href="<c:url value="/admin/itemList/${itemPage.startPage - 5}" />" >[이전]</a>
					</c:if>
					<c:forEach var="pNo" begin="${itemPage.startPage}" end="${itemPage.endPage}">
						<a href="<c:url value="/admin/itemList/${pNo}" />">[${pNo}]</a>
					</c:forEach> 
					<c:if test="${itemPage.endPage < itemPage.totalPages}">
						<a href="<c:url value="/admin/itemList/${itemPage.startPage + 5}" />">[다음]</a>
					</c:if>
				</td>
			</tr>
		</c:if>
		</tbody>
	</table>
</body>
</html>