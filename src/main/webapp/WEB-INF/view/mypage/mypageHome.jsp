<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

</head>
<body>
<%@ include file="/WEB-INF/view/include/nav.jsp"%>

<h2>mypageHome</h2>
	<div>
		<c:set var="member" value="${member }" />
		<c:out value="${member.memberNo}" />
		<c:out value="${member.memberId}" />
		<c:out value="${member.memberName}" />
		<c:out value="${member.regdate}" />
		<c:out value="${member.power}" />
	</div>


</body>
</html>