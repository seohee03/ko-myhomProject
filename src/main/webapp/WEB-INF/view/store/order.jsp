<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

function orderBtn(){
	var cartNoArr = new Array();
	cartNoArr = $('input[name=cartNoArr]');
	$.ajax({
		url : "${pageContext.request.contextPath}/order",
		type : "post",
		dataType : "json",
		data : $('#orderForm').serialize(),
		success : function(data){
			if(data == 9){
				alert('주문 실패');
			}else if(data == 0){
				location.href='${pageContext.request.contextPath}/orderSuccess';
			}
		}
	})
}
</script>

</head>
<body>
<%@ include file="/WEB-INF/view/include/nav.jsp"%>


<div class="container">
	<form id="orderForm" method="post">
	<div class="orderPage">
		<div class="title">주문/결제</div>
		<div class="ttl">주문상품</div>
		<div class="cartArea">
			<ul>
				<c:forEach var="cartCommand" items="${cartCommandList}" >
				<li>
					<div class="orderPd clearfix">
						<div class="imgSec">
							<img alt="" src="${pageContext.request.contextPath }${cartCommand.thumbUrl}">
						</div>
						<div class="infoSec">
							<div class="txt"><c:out value="${cartCommand.itemName}" /></div>
							<div class="option"><c:out value="${cartCommand.price}" />원 | <c:out value="${cartCommand.amount}" />개  | 합계 <c:out value="${cartCommand.price * cartCommand.amount}" /> </div>
						</div>
					<%-- <c:out value="${cartCommand.price}" />
					<c:out value="${cartCommand.amount}" />
					<c:out value="${cartCommand.price * cartCommand.amount}" /> --%>
					</div>
				</li>
				<input type="hidden" name="allPrice${cartCommand.cartNo}" value="${cartCommand.price * cartCommand.amount}">
				<input type="hidden" value="${cartCommand.cartNo}" id="cartNo${cartCommand.cartNo}" name="cartNoArr" ></td>
				</c:forEach>
			</ul>
		</div>
		
		<div class="ttl">배송지</div>
		<div class="orderArea">
			<div class="field">
				<div class="label">이름</div>
				<div class="input"><input type="text" name="memberName"></div>
			</div>
			<div class="field">
				<div class="label">전화번호</div>
				<div class="input"><input type="text" name="memberTel"></div>
			</div>
			<div class="field">
				<div class="label">우편번호</div>
				<div class="input">
					<input type="text" id="sample4_postcode" name="postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" class="genric-btn success radius" value="우편번호 찾기">
				</div>
			</div>
			<div class="field">
				<div class="label">주소</div>
				<div class="input">
					<input type="text" id="sample4_roadAddress" name="address" placeholder="도로명주소">
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
				</div>
			</div>
			<div class="field">
				<div class="label"> </div>
				<div class="input">
					<input type="text" id="sample4_detailAddress" name="detailAddr" placeholder="상세주소">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목">
				</div>
			</div>
			<div class="field">
				<div class="label">배송메모</div>
				<div class="input"><input type="text" name="orderMessage" ></div>
			</div>
		</div>
		<c:set var="priceTotal" value="${priceTotal }" />
		<div class="ttl">최종 결제 금액</div>
		<div class="priceArea">
			<div class="txt">총 상품 금액 : ${priceTotal }</div>
			<div class="txt">배송비 : 0</div>
			<div class="totalTxt">${priceTotal }원</div>
		</div>
		<input type="button" onclick="orderBtn();" value="결제하기" class="genric-btn success radius orderBtn">
	
	
	</div>
	
	
			<%-- <c:forEach var="cartCommand" items="${cartCommandList}" >
				<tr>
					<!--  주문하기용 데이터 : 상품, 수량, 가격-->
					<td><c:out value="${cartCommand.itemName}" /></td>
					<td><c:out value="${cartCommand.amount}" /></td>
					<td><c:out value="${cartCommand.price}" /></td>
					<td><c:out value="${cartCommand.price * cartCommand.amount}" />
					<input type="hidden" value="${cartCommand.cartNo}" id="cartNo${cartCommand.cartNo}" name="cartNoArr" ></td>
				</tr>
			</c:forEach> --%>
			<!-- hidden값으로 cartNo를 배열로 보내고 나머지 주문 상세 내용은 입력값으로 보냄 -->

	<!-- cartNo 배열로 -->
	<!--  	<input type="hidden" id="cartNoArr" name="cartNoArr" />  -->
		
		
	</form>
</div>



<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>