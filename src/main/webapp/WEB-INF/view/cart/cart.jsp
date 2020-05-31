<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">

function amountUpdate(num){
	var updateAmount = $("#updateAmount"+num).val();
	//data setting
	$("#updateCartNo").val(num);
	$("#updateAmount").val(updateAmount);
	
	$.ajax({
		url : "/www/updateCart",
		type : "post",
		dataType : "json",
		data : $("#cartForm").serialize(),
		success : function(data){
			if(data == 9){
				alert('수량 변경 실패');
			}else if(data == 0){
				alert('수량 변경 성공');
				location.reload();
			}
		}
			
	});
}
	
</script>
</head>
<body>
<p>cart page</p>


<form id="cartForm">
<table border="1">
		<thead>
			<tr>
				<th>상품명</th>
				<th>수량</th>
				<th>가격</th>
				<th>총 가격</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="cartCommand" items="${cartCommandList}" >
			<tr>
				<!--  주문하기용 데이터 : 상품, 수량, 가격-->
				<td><c:out value="${cartCommand.itemName}" /></td>
				<td><c:out value="${cartCommand.amount}" />
				<input type="number" id="updateAmount${cartCommand.cartNo}" name="newAmount${cartCommand.cartNo}" min="0" />
				<input type="button" onclick="javascript:amountUpdate(${cartCommand.cartNo});" value="변경"/>
				</td>
				<td><c:out value="${cartCommand.price}" /></td>
				<td><c:out value="${cartCommand.price * cartCommand.amount}" /></td>
			</tr>

		</c:forEach>
		</tbody>
	</table>
	<!-- 수량 변경용 데이터 -->
	<input type="hidden" id="updateCartNo" name="updateCartNo" />
	<input type="hidden" id="updateAmount" name="updateAmount"  />
	<!-- 전체 주문하기 -->
	<input type="button" onclick="location.href='/www/mycart?type=1'">
</form>

</body>
</html>