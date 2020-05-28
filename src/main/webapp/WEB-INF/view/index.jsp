<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
    <a href="<c:url value="/admin" />">[관리자페이지]</a>
</body>
</html>
