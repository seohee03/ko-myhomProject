<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

</head>
<body>
<!-- home이 회원관리 -->
관리자페이지 
<a href="<c:url value="/admin/itemList" />">[상품관리]</a>
 <a href="<c:url value="/admin/memberList" />">[회원관리]</a>
 <a href="<c:url value="/admin/articleList" />">[게시글 관리]</a>
</body>
</html>