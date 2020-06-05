<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

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
    	
    	$.ajax({
    		url : "${pageContext.request.contextPath}/login",
    		type : "post",
    		dataType : "json",
    		data : $loginForm.serialize(),
    		success : function(data){
    			if(data == 9){
    				$('#resultMSG').text('아이디 혹은 비밀번호가 맞지 않습니다');
    				return false;
    			}else if(data == 0){
    				location.href = "${pageContext.request.contextPath}/";
    			}
    		}
    	})
    });
});


</script>
</head>
<body>
<p>회원 로그인</p>
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
    <div id = "naverIdLogin"></div>
    
    <!-- <a href="/oauth/authorize?client_id={7f5e40851f7ba4a73047e1af6ce22531}&redirect_uri={http://localhost:8085/www/}&response_type=code">카카오로그인</a> -->
    </form:form>
    
    
    
 
<script type="text/javascript">
 
	var naverLogin = new naver.LoginWithNaverId(
	      {
	         clientId: "tJYAbvknm5tqkNMeY_HI",
	         callbackUrl: "http://localhost:8085/myhome/loginSuccess",
	         loginButton: {color: "green", type: 3, height: 60}
	      }
   );
   naverLogin.init();
</script>
     
    
</body>
</html>
