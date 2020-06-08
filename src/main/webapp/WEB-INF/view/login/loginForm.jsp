<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script> --%>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


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

<%@ include file="/WEB-INF/view/include/nav.jsp"%>

<!--================login_part Area =================-->
    <section class="login_part section_padding ">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_text text-center">
                        <div class="login_part_text_iner">
                            <h2>New to our Shop?</h2>
                            <p>There are advances being made in science and technology
                                everyday, and a good example of this is the</p>
                            <a href="<c:url value="/register/step1" />" class="btn_3">회원가입</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>환영합니다 ! <br>
                              	로그인 해주세요</h3>
                                 <form:form modelAttribute="loginCommand" id="loginForm" name="loginForm" novalidate="novalidate">
                                <div class="col-md-12 form-group p_star">
                                	<form:input path="memberId" class="form-control" id="memberId" placeholder="아이디"/>
     	  								<span class="errStr memberId"></span>
                                </div>
                                <div class="col-md-12 form-group p_star">
	                                <form:password path="memberPw" class="form-control" id="memberPw" name="memberPw" placeholder="비밀번호"/>
	        							<span class="errStr memberPw"></span>
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="creat_account d-flex align-items-center">
                                        <input type="checkbox" id="f-option" name="rememberId">
                                        <label for="f-option">아이디 기억</label>
                                    </div>
                                    <span id="resultMSG"></span>
                                    <ul class="buttonArea">
	                                    <li><input type="button" id="submit" value="로그인" class="btn_3"></li>
	                                    <li><input type="button" onclick="location.href='${pageContext.request.contextPath}/register/step1'" value="회원가입" class="btn_3"></li>
                                    </ul>
                                    <div id = "naverIdLogin"></div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================login_part end =================-->
    
 
<script type="text/javascript">
 
	var naverLogin = new naver.LoginWithNaverId(
	      {
	         clientId: "tJYAbvknm5tqkNMeY_HI",
	         callbackUrl: "http://localhost:8085/myhome/loginSuccess",
	         loginButton: {color: "green", type: 3, height: 40}
	      }
   );
   naverLogin.init();
</script>
     
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>
