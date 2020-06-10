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
        $('.priceTotal').text(0);
    }
}

//주문하기 버튼 함수
function goOrder() {
   var cartNoArr = getCheckedArr();
   var priceTotal = $('#priceTotal').val();
   console.log(cartNoArr);
   location.href="${pageContext.request.contextPath}/mycart?type=1&cartNoArr=" +cartNoArr+"&priceTotal="+priceTotal ;
}

function getCheckedArr(){
   var cartNoArr = new Array();
   $('input[name=checkCart]:checked').each(function(index, value) { 
     console.log(this.value);
      cartNoArr.push(this.value);  
   });
   
   return cartNoArr;
}

//체크박스 선택 시 SUM 변경
$(document).ready(function(){
     var cartNoArr = new Array();
	$(".cartChek").change(function(){
		cartNoArr = null;
     	var allPrice = new Array();
    	 cartNoArr = getCheckedArr();
	     console.log("onchange=========");
	      console.log(cartNoArr);
	      $.each(cartNoArr, function(index, item) { 
	         allPrice.push(parseInt($('input[name=allPrice'+item+']').val()));
	      });
	     console.log(allPrice);
	      var sum = allPrice.reduce((a,b) => a + b);
	     console.log(sum); 
	     $('.priceTotal').text(sum);
	     $('#priceTotal').val(sum);
	});
});
	
</script>
</head>
<body>

<%@ include file="/WEB-INF/view/include/nav.jsp"%>

<div class=" orderSec">
<div class="inner clearfix">
<div class="allChek">
	<input type="checkbox"  class="cartChek" id="checkAll"  onclick="cAll();">
	<label for="checkAll">모두선택</label>
</div>
<form id="cartForm">
	<div class="leftSec">
		<ul class="depth1">
		<c:set var="path" value="${pageContext.request.contextPath }" />
		<c:forEach var="cartCommand" items="${cartCommandList}" >
			<li>
				<input type="checkbox"  class="cartChek" name="checkCart" value="${cartCommand.cartNo}">
				<div class="orderPd clearfix">
					<div class="imgSec">
						<!-- <img alt="" src="images/categorie01.jpg"> -->
						<img alt="" src="${path }${cartCommand.thumbUrl}">
					</div>
					<div class="infoSec">
						<div class="txt"><c:out value="${cartCommand.itemName}" /></div>
						<div class="dv">무료배송</div>
					</div>
					<a class="xbtn" onclick="javascript:amountDelete(${cartCommand.cartNo});">X</a>
				</div>
				<!-- orderPd -->
				<ul class="depth2">
					<li>
						<div class="txt">사이즈: 슈퍼싱글(SS) / 색상: 그레이</div>
						<div>
							<input type="number" value="${cartCommand.amount}" id="updateAmount${cartCommand.cartNo}" name="newAmount${cartCommand.cartNo}" min="0" />
							<input type="button" onclick="javascript:amountUpdate(${cartCommand.cartNo});" value="변경"/>
							<span class="price" ><c:out value="${cartCommand.price}" />원</span>
						</div>
					</li>
					<!-- <li>
						<div class="txt">사이즈: 슈퍼싱글(SS) / 색상: 그레이</div>
						<div>
							<input type="number" id="updateAmount"name="newAmount" min="0" />
							<span class="price">21,900원</span>
						</div>
						
						<a class="xbtn">X</a>
					</li> -->
				</ul>
				<!-- depth2 -->
				<div class="pdTotal">
					<div class="dv">무료배송</div>
					<input type="hidden" name="allPrice${cartCommand.cartNo}" value="${cartCommand.price * cartCommand.amount}">
					<div><span class="totalPrice"><c:out value="${cartCommand.price * cartCommand.amount}" />원</span></div>
				</div>
			</li>
			</c:forEach>
			<input type="hidden" name="cartNoArr" id="cartNoArr" value=""/>
			<!-- 수량 변경용 데이터 -->
			<input type="hidden" id="updateCartNo" name="updateCartNo" />
			<input type="hidden" id="updateAmount" name="updateAmount"  />
		</ul>
		<!--  depth1 -->
	</div>
	
	<!--  //leftSec e -->
	<div class="rightSec">
		<div class="rightIn">
			<dl>
				<dt>총 상품금액</dt>
				<dd class="priceTotal">원</dd>
			</dl>
			<dl>
				<dt>배송비</dt>
				<dd>0원</dd>
			</dl>
			<dl>
				<dt>결제 금액</dt>
				<dd class="priceTotal">원</dd>
				<input type="hidden" name="priceTotal" id="priceTotal" value="">
			</dl>
		</div>
		<%-- <div class="btnArea"><a href="#" onclick="location.href='${pageContext.request.contextPath}/mycart?type=1'" class="genric-btn success radius">주문하기</a></div> --%>
		<div class="btnArea"><input type="button" onclick="goOrder();" class="genric-btn success radius" value="주문하기"></div>
	</div>
	</form>
</div>

</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>