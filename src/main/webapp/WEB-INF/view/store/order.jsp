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
	이름 : <input type="text" >
	<br />
	전화번호 : <input type="text" >
	<br />
	<input type="text" id="sample4_postcode" name="postcode" placeholder="우편번호">
	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	<input type="text" id="sample4_roadAddress" name="address" placeholder="도로명주소">
	<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
	<span id="guide" style="color:#999;display:none"></span>
	<input type="text" id="sample4_detailAddress" name="detailAddr" placeholder="상세주소">
	<input type="text" id="sample4_extraAddress" placeholder="참고항목">
	<br />
	배송메모 : <input type="text" name="orderMessage" >
	<br />
	
	<input type="button" onclick="orderBtn();" value="주문">
</form>

<%-- <form id="cartForm">
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
	이름 : <input type="text" >
	이름 : <input type="text" >
	이름 : <input type="text" >
	<input type="button" onclick="orderBtn();" value="주문">
</form> --%>

</body>
</html>