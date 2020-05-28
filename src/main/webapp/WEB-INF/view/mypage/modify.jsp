<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

</head>
<body>

<p>modify page</p>
    <form:form action="step3" modelAttribute="registerRequest">
    <p>
        <label>아이디:<br>
        <form:input path="memberid" />
        <form:errors path="memberid"/>
        </label>
    </p>
    <p>
        <label>이름:<br>
        <form:input path="name" />
        <form:errors path="name"/>
        </label>
    </p>
    <p>
        <label>비밀번호:<br>
        <form:password path="memberPw" />
        <form:errors path="memberPw"/>
        </label>
    </p>
    <p>
        <label>비밀번호 확인:<br>
        <form:password path="confirmPassword" />
        <form:errors path="confirmPassword"/>
        </label>
    </p>
    <input type="submit" value="수정">
    </form:form>

</body>
</html>