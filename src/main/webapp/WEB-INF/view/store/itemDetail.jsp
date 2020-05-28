<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

<c:set var="item" value="${item}" />
<!-- 상품사진, 상품 명, 상품 설명, 가격-->
<c:out value="${item.itemNo}" />
<c:out value="${item.itemName}" />
<c:out value="${item.itemDetail}" />
<c:out value="${item.price}" />

<!-- 카트 추가 : 상품번호, 가격, 수량-->
<form:form modelAttribute="cart" method="POST" action="/www/cart/cartAdd">
 	<c:set var="numArr" value="<%= new int[]{1,2,3,4,5,6,7,8,9}%>" />
	<form:hidden path="itemNo" value="${item.itemNo }"/>
	<form:select path="amount">
		<option value="">수량 선택</option>
		<form:options items="${numArr}"/>
	</form:select>
	<form:hidden path="price" value="${item.price }"/> 
	<form:hidden path="itemNo" value="${item.itemNo }"/> 
	<p>수량 : <span id="selAmount"></span></p>
	<p>가격 : <span id="totalPrice"></span></p>
	
	<input type="submit" value="[장바구니 등록]">
</form:form>

</body>
</html>