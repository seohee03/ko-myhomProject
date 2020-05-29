<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
    
<script type="text/javascript">

$(function(){
    $('#agreeBtn').click(function(){

		var checkbox = $('#agree').prop('checked'); 
		if(!checkbox){
			alert("약관 동의를 눌러주세요.");
			return false;
		}else{
			$("#regForm").attr("action", "/www/register/step2");
			$("#regForm").submit();
		}
		
    });
});

</script>
    
</head>
<body>
    <h2>회원가입</h2>
    <p>약관 내용</p>
    <form method="post" id="regForm">
    <label>
        <input type="checkbox" name="agree" id="agree" value="true" > 
        	동의
    </label>
    <input type="submit" id="agreeBtn" value="다음" />
    </form>
</body>
</html>
