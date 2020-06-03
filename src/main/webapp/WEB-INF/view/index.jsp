<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

</head>
<body>

<p>인덱스 페이지 수정</p>
	
    <c:if test="${empty authInfo}">
    <p>환영합니다.</p>
    <p>
        <a href="<c:url value="/register/step1" />">[회원 가입하기]</a>
        <a href="<c:url value="/login" />">[로그인]</a>
    </p>
    </c:if>
    
    <c:if test="${! empty authInfo}">
    <p>${authInfo.memberName}님, 환영합니다.</p>
    <p>
	   <a href="<c:url value="/cart" />">[장바구니]</a>
	   <a href="<c:url value="/mypage" />">[마이페이지]</a>
       <a href="<c:url value="/logout" />">[로그아웃]</a>
    </p>
    </c:if>
    
    
    <br />
    <a href="<c:url value="/community" />">[커뮤니티]</a>
    <a href="<c:url value="/store" />">[스토어]</a>
    
    
    <hr/>
    <a href="<c:url value="/admin/itemList" />">[상품관리]</a>
    <a href="<c:url value="/admin/itemRegister" />">[상품등록]</a>
    <a href="<c:url value="/admin/articleList" />">[게시글 관리]</a>
    <a href="<c:url value="/admin" />">[관리자페이지]</a>
    

   
</body>
</html>
