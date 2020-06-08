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
		url : "${pageContext.request.contextPath}/updateCart",
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

function amountDelete(num){
	$("#updateCartNo").val(num);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/deleteCart",
		type : "post",
		dataType : "json",
		data : $("#cartForm").serialize(),
		success : function(data){
			if(data == 9){
				alert('삭제 실패');
			}else if(data == 0){
				alert('선택하신 상품이 삭제되었습니다');
				location.reload();
			}
		}
	});
}

//전체선택 버튼 함수
function cAll() {
    if ($("#checkAll").is(':checked')) {
        $("input[type=checkbox]").prop("checked", true);
    } else {
        $("input[type=checkbox]").prop("checked", false);
    }
}

	
</script>
</head>
<body>

<%@ include file="/WEB-INF/view/include/nav.jsp"%>

<div class=" orderSec">
<div class="inner clearfix">
<div class="allChek">
	<input type="checkbox"  class="cartChek" >
	<label>모두선택</label>
</div>
<form id="cartForm">
	<div class="leftSec">
		<ul class="depth1">
			<li>
				<input type="checkbox"  class="cartChek" >
				<div class="orderPd clearfix">
					<div class="imgSec">
						<img alt="" src="images/categorie01.jpg">
					</div>
					<div class="infoSec">
						<div class="txt">사이즈: 슈퍼싱글(SS) / 색상: 그레이</div>
						<div class="dv">무료배송</div>
					</div>
					<a class="xbtn">X</a>
				</div>
				<!-- orderPd -->
				<ul class="depth2">
					<li>
						<div class="txt">사이즈: 슈퍼싱글(SS) / 색상: 그레이</div>
						<div>
							<input type="number" id="updateAmount"name="newAmount" min="0" />
							<span class="price">21,900원</span>
						</div>
						
						<a class="xbtn">X</a>
					</li>
					<li>
						<div class="txt">사이즈: 슈퍼싱글(SS) / 색상: 그레이</div>
						<div>
							<input type="number" id="updateAmount"name="newAmount" min="0" />
							<span class="price">21,900원</span>
						</div>
						
						<a class="xbtn">X</a>
					</li>
				</ul>
				<!-- depth2 -->
				<div class="pdTotal">
					<div class="dv">무료배송</div>
					<div class="totalPrice">21,900원</div>
				</div>
			</li>
			<li>
				<input type="checkbox"  class="cartChek" >
				<div class="orderPd clearfix">
					<div class="imgSec">
						<img alt="" src="images/categorie01.jpg">
					</div>
					<div class="infoSec">
						<div class="txt">사이즈: 슈퍼싱글(SS) / 색상: 그레이</div>
						<div class="dv">무료배송</div>
					</div>
					<a class="xbtn">X</a>
				</div>
				<!-- orderPd -->
				<ul class="depth2">
					<li>
						<div class="txt">사이즈: 슈퍼싱글(SS) / 색상: 그레이</div>
						<div>
							<input type="number" id="updateAmount"name="newAmount" min="0" />
							<span class="price">21,900원</span>
						</div>
						
						<a class="xbtn">X</a>
					</li>
					<li>
						<div class="txt">사이즈: 슈퍼싱글(SS) / 색상: 그레이</div>
						<div>
							<input type="number" id="updateAmount"name="newAmount" min="0" />
							<span class="price">21,900원</span>
						</div>
						
						<a class="xbtn">X</a>
					</li>
				</ul>
				<!-- depth2 -->
				<div class="pdTotal">
					<div class="dv">무료배송</div>
					<div class="totalPrice">21,900원</div>
				</div>
			</li>
			<li>
				<input type="checkbox"  class="cartChek" >
				<div class="orderPd clearfix">
					<div class="imgSec">
						<img alt="" src="images/categorie01.jpg">
					</div>
					<div class="infoSec">
						<div class="txt">사이즈: 슈퍼싱글(SS) / 색상: 그레이</div>
						<div class="dv">무료배송</div>
					</div>
					<a class="xbtn">X</a>
				</div>
				<!-- orderPd -->
				<ul class="depth2">
					<li>
						<div class="txt">사이즈: 슈퍼싱글(SS) / 색상: 그레이</div>
						<div>
							<input type="number" id="updateAmount"name="newAmount" min="0" />
							<span class="price">21,900원</span>
						</div>
						
						<a class="xbtn">X</a>
					</li>
					<li>
						<div class="txt">사이즈: 슈퍼싱글(SS) / 색상: 그레이</div>
						<div>
							<input type="number" id="updateAmount"name="newAmount" min="0" />
							<span class="price">21,900원</span>
						</div>
						
						<a class="xbtn">X</a>
					</li>
				</ul>
				<!-- depth2 -->
				<div class="pdTotal">
					<div class="dv">무료배송</div>
					<div class="totalPrice">21,900원</div>
				</div>
			</li>
		</ul>
		<!--  depth1 -->
	</div>
	</form>
	<!--  //leftSec e -->
	<div class="rightSec">
		<div class="rightIn">
			<dl>
				<dt>총 상품금액</dt>
				<dd>80,800원</dd>
			</dl>
			<dl>
				<dt>총 상품금액</dt>
				<dd>80,800원</dd>
			</dl>
			<dl class="total">
				<dt>총 상품금액</dt>
				<dd>80,800원</dd>
			</dl>
		</div>
		<div class="btnArea"><a href="#" class="genric-btn success radius">주문하기</a></div>
	</div>
</div>


<%-- <form id="cartForm">
<table border="1">
		<thead>
			<tr>
				<th></th>
				<th>상품명</th>
				<th>수량</th>
				<th>가격</th>
				<th>총 가격</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="cartCommand" items="${cartCommandList}" >
		<c:if test="${!cartCommand.hasItems()}">
			<div class="loginBtn hearer_icon d-flex align-items-center">
				<a href="<c:url value="/store" />" class="genric-btn primary-border circle">상품 담으러 가기</a>
			</div>
		</c:if>
			<tr>
				<!--  주문하기용 데이터 : 상품, 수량, 가격-->
				<td><input type="checkbox" name="cartCheckbox" ></td>
				<td><c:out value="${cartCommand.itemName}" /></td>
				<td><c:out value="${cartCommand.amount}" />
				<input type="number" id="updateAmount${cartCommand.cartNo}" name="newAmount${cartCommand.cartNo}" min="0" />
				<input type="button" onclick="javascript:amountUpdate(${cartCommand.cartNo});" value="변경"/>
				<input type="button" onclick="javascript:amountDelete(${cartCommand.cartNo});" value="삭제"/>
				</td>
				<td><c:out value="${cartCommand.price}" /></td>
				<td><c:out value="${cartCommand.price * cartCommand.amount}" /></td>
			</tr>

		</c:forEach>
		</tbody>
	</table>
	<input type="checkbox" id="checkAll" onclick="cAll();"><label for="checkAll">전체선택</label>
	<p>총 가격 : <span id="totalPrice"></span></p>
	<!-- 수량 변경용 데이터 -->
	<input type="hidden" id="updateCartNo" name="updateCartNo" />
	<input type="hidden" id="updateAmount" name="updateAmount"  />
	<!-- 전체 주문하기 -->
	<input type="button" onclick="location.href='${pageContext.request.contextPath}/mycart?type=1'" value="전체주문">
</form> --%>
</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>