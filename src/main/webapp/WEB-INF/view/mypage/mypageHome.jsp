<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
mypageHome

<c:set var="member" value="${member }" />
<c:out value="${member.memberNo}" />
<c:out value="${member.memberId}" />
<c:out value="${member.memberName}" />
<c:out value="${member.regdate}" />
<c:out value="${member.power}" />

<a href="<c:url value="/mypage/modify" />">[정보 수정하기]</a>
</body>
</html>