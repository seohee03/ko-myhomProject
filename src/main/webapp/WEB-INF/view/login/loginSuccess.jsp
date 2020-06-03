<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

</head>
<body>
    <p>
        로그인 성공
    </p>
    <p>
        <a href="<c:url value='/'/>">
            [홈]
        </a>
    </p>
        <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
	var naverLogin = new naver.LoginWithNaverId({
            clientId: "tJYAbvknm5tqkNMeY_HI",
            callbackUrl: "http://localhost:8085/myhome/loginSuccess",
            callbackHandle: true
         });
	naverLogin.init();

	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {

            if (status) {
               var email = naverLogin.user.getEmail();
               var name = naverLogin.user.getName();
               var id = naverLogin.user.getId();
               var contextPath = "${pageContext.request.contextPath}";
               if( email == undefined || email == null) {
                  alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                  naverLogin.reprompt();
                  return;
               }
               var loginURL = contextPath+"/naverLogin?memberId="+email+"&name="+name+"&id="+id;
               loadDoc(loginURL);

               //alert( email ); // 로그인 한 이메일 ***@naver.com 이 출력된다.
               //window.location.replace("http://127.0.0.1/test2.html");
            } else {
               console.log("callback 처리에 실패하였습니다.");
            }
         });
      });
	
	function loadDoc(url){
		window.location.href = url;
	}
   </script>
</body>
</html>
