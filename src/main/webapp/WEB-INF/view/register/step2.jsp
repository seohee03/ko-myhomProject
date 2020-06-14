<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">
$(function(){
    $('#submit').click(function(){
    	var memberId = $('#memberId').val();
    	var memberName = $('#memberName').val();
    	var memberPw = $('#pw1').val();
    	var confirmPassword = $('#pw2').val();
    	
    	if(memberId.length == 0){
    		$('.memberId').text("아이디를 입력해주세요");
    		$('#memberId').focus();
    		return false;
    	}else{
    		$('.errStr').text("");
    	}
    	
    	if(memberName.length == 0){
    		$('.memberName').text("이름을 입력해주세요");
    		$('#memberName').focus();
    		return false;
    	}else{
    		$('.errStr').text("");
    	}

    	
    	if(memberPw.length == 0){
    		$('.memberPw').text("비밀번호를 입력해주세요");
    		$('#memberPw').focus();
    		return false;
    	}else{
    		$('.errStr').text("");
    	}
    	
    	if(confirmPassword.length == 0){
    		$('.confirmPassword').text("다시 비밀번호를 입력해주세요");
    		$('#confirmPassword').focus();
    		return false;
    	}else{
    		$('.errStr').text("");
    	}
    	
    	var idChkVal = $("#idChk").val();
		if(idChkVal == "N"){
			alert("중복확인 버튼을 눌러주세요.");
			return false;
		}else if(idChkVal == "Y"){
			$("#regForm").submit();
		}
		
		if(memberPw != confirmPassword){
			alert("비밀번호를 확인해주세요");
			return false;
		}

    });
    
    $('.pw').focusout(function () {
        var pwd1 = $("#pw1").val();
        var pwd2 = $("#pw2").val();

        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
            	  $("#alert-success").css('display', 'inline-block');
                  $("#alert-danger").css('display', 'none');
            } else {
            	 alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                 $("#alert-success").css('display', 'none');
                 $("#alert-danger").css('display', 'inline-block');
            }
        }
    });
  
});

function fn_idChk(){
	$.ajax({
		url : "${pageContext.request.contextPath}/idChk",
		type : "post",
		dataType : "json",
		data : {"memberId" : $("#memberId").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}

</script>
</head>
<body>

<%@ include file="/WEB-INF/view/include/nav.jsp"%>
<div class="container">
	<div class="regPageStepTwo">
		<form:form action="step3" modelAttribute="registerRequest" id="regForm" method="POST">
		<div class="title">회원가입</div>
		<div class="regArea">
			<div class="field">
				<div class="label">아이디</div>
				<div class="inputTxt">
					<form:input path="memberId" class="inputTxt" placeholder="아이디" />
					<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
				</div>
				<span class="errStr memberId" style="line-height: 40px;"></span> 
			</div>
			<div class="field">
				<div class="label">이름</div>
				<div class="inputTxt">
					<form:input path="memberName" placeholder="이름" />
					<span class="errStr memberName" style="line-height: 40px;"></span>
				</div>
			</div>
			<div class="field">
				<div class="label">비밀번호</div>
				<div class="inputTxt">
					<form:password  path="memberPw" class="pw" id="pw1" placeholder="비밀번호" />
					<span class="errStr memberPw" style="line-height: 40px;"></span>
				</div>
			</div>
			<div class="field">
				<div class="label">비밀번호 확인</div>
				<div class="inputTxt">
					<form:password  path="confirmPassword" class="pw" id="pw2" placeholder="비밀번호 확인" />
					<span class="errStr confirmPassword" id="alert-success" style="display: none;">비밀번호가 일치합니다.</span> 
					<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold;">비밀번호가 일치하지 않습니다.</span>
				</div>
			</div>
			<div class="field">		
				<button type="submit" id="submit" class="regBtn">가입</button>
				<!-- <input type="button" id="submit" value="가입" class="regBtn"> -->
			</div>
		</div>
		</form:form>
	</div>
</div>
    
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>
