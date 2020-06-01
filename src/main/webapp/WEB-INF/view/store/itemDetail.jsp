<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">
$(function(){
    $('#amount').change(function(){
		$('#selAmount').text(this.value);
		var price = $('#price').val();
		$('#totalPrice').text(price * this.value);
    });
});
</script>
</head>
<body>
상품상세페이지
	<br />
    <a href="<c:url value="/cart" />">[장바구니]</a>
    <a href="<c:url value="/mypage" />">[마이페이지]</a>
    <br />
    <a href="<c:url value="/" />">[커뮤니티]</a>
    <a href="<c:url value="/store" />">[스토어]</a>
    <a href="<c:url value='/'/>">[메인]</a>
    <br />

<hr/>

<c:set var="itemCommand" value="${itemCommand}" />
<!-- 상품사진, 상품 명, 상품 설명, 가격-->
<span>상품 번호<c:out value="${itemCommand.item.itemNo}" /></span>
<span>상품 명 <c:out value="${itemCommand.item.itemName}" /></span>
<span>상품 설명<c:out value="${itemCommand.item.itemDetail}" /></span>
<span>가격<c:out value="${itemCommand.item.price}" /></span>
<span>재고<c:out value="${itemCommand.item.stock}" /></span>
<span>상품 번호<c:out value="${item.itemNo}" /></span>

<!-- 카트 추가 : 상품번호, 가격, 수량-->
<form:form modelAttribute="cart" method="POST" action="/www/cart/cartAdd">
 	<c:set var="numArr" value="<%= new int[]{1,2,3,4,5,6,7,8,9}%>" />
	<form:hidden path="itemNo" value="${itemCommand.item.itemNo }"/>
	<form:select path="amount">
		<option value="">수량 선택</option>
		<form:options items="${numArr}"/>
	</form:select>
	<form:hidden path="price" value="${itemCommand.item.price }"/> 
	<form:hidden path="itemName" value="${itemCommand.item.itemName }"/> 
	<p>수량 : <span id="selAmount"></span></p>
	<p>가격 : <span id="totalPrice"></span></p>
	
	<input type="submit" value="[장바구니 등록]">
</form:form>

</body>
</html>