<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">
$(function(){
	var $loginForm = $('#loginForm');
	
    $('#submit').click(function(){
    	var memberId = $('#memberId').val();
    	var memberPw = $('#memberPw').val();
    	
    	if(memberId.length == 0){
    		$('.memberId').text("아이디를 입력해주세요");
    		$('#memberId').focus();
    		return false;
    	}else if(memberPw.length == 0){
    		$('.memberPw').text("비밀번호를 입력해주세요");
    		$('#memberPw').focus();
    		return false;
    	}else{
    		$('.errStr').text("");
    	}
    	
    	$.ajax({
    		url : "${pageContext.request.contextPath}/admin",
    		type : "post",
    		dataType : "json",
    		data : $loginForm.serialize(),
    		success : function(data){
    			if(data == 9){
    				$('#resultMSG').text('아이디 혹은 비밀번호가 맞지 않습니다');
    				return false;
    			}else if(data == 0){
    				location.href = "${pageContext.request.contextPath}/admin";
    			}
    		}
    	})

    });
});
</script>
</head>

<body>
<p>관리자 로그인</p>
    <form:form modelAttribute="loginCommand" id="loginForm">
    <form:errors />
    <p>
        <label>아이디:<br>
        <form:input path="memberId" />
        <span class="errStr memberId"></span>
        </label>
    </p>
    <p>
        <label>비밀번호:<br>
        <form:password path="memberPw" />
        <span class="errStr memberPw"></span>
        </label>
    </p>
    <p>
        <label>아이디 기억하기:
        <form:checkbox path="rememberId"/> 
        </label>
    </p>
    <span id="resultMSG"></span>
    <input type="button" id="submit" value="로그인">
    </form:form>
</body>
</html>
