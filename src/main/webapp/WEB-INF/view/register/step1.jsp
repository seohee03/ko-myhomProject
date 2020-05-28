<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/include/header.jsp"/>
    
</head>
<body>
    <h2>회원가입</h2>
    <p>약관 내용</p>
    <form action="step2" method="post">
    <label>
        <input type="checkbox" name="agree" value="true"> 
        	동의
    </label>
    <input type="submit" id="agreeBtn" value="다음" />
    </form>
</body>
</html>
