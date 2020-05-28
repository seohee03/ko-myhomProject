<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>오늘의집</title>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    $('#submit').click(function(){
    	//상품명, 가격, 재고
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

    });
});
</script>
</head>

<body>
<p>관리자 로그인</p>
    <form:form modelAttribute="loginCommand">
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
    <input type="submit" value="로그인">
    </form:form>
</body>
</html>
