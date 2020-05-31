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
<p>order page</p>


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
				<td><c:out value="${cartCommand.amount}" /></td>
				<td><c:out value="${cartCommand.price}" /></td>
				<td><c:out value="${cartCommand.price * cartCommand.amount}" /></td>
			</tr>

		</c:forEach>
		<!-- 주문서 작성 -->
		<!-- 카트 넘버만 보내서 조회해서 insert -->
		<!-- 배열로 보냄
		배열 갯수만큼 서비스나 다오에서 insert -->
		<!-- hidden값으로 cartNo를 배열로 보내고 나머지 주문 상세 내용은 입력값으로 보냄 -->
		</tbody>
	</table>
	<!-- 수량 변경용 데이터 -->
	<input type="hidden" id="updateCartNo" name="updateCartNo" />
	<input type="hidden" id="updateAmount" name="updateAmount"  />
	<!-- 전체 주문하기 -->
	<input type="button" onclick="location.href='/www/mycart?type=\"oreder\"'">
</form>

</body>
</html>