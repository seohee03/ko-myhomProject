<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/include/header.jsp"/>
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