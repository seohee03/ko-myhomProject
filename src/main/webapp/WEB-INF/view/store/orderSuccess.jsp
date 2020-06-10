<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/view/include/nav.jsp"%>
	<div class="container">
		<div class="orderSuccessPage">
			<div class="txt">주문이 완료되었습니다</div>
			<div class="genric-btn success radius orderBtn"><a href="<c:url value="/store" />">쇼핑하러가기</a></div>
		</div>
	</div>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>