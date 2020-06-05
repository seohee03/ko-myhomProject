<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<!-- font -->
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<!-- 
font-family: 'Jua', sans-serif;
font-family: 'Noto Sans KR', sans-serif; 
-->

<style>
<!--
.logo{
	display: inline-block;
	margin: 20px 20px 12px 20px;
	
	font-family: 'Jua', sans-serif;
}
.logo_a{
	text-decoration: none!important;
	color: #35c5f0!important;
	font-size: 27px;
	border: none!important;
}
.nav_ul > li{
	font-family: 'Noto Sans KR', sans-serif!important;
	font-weight: 600;
	margin-right: 16px;
}
-->
</style>

<script type="text/javascript">
$(function(){
	$('#searchForm').submit(function(){
		var keyword = $('#keyword').val().trim();
		if(keyword.length == ""){
			$('#keyword').focus();
			return false;
		}else{
			return true;
		}
	});
});
</script>
</head>

<body class="homepage is-preload">
	<!-- Header -->
	<section id="header" style=" margin: auto; width: 70%;">
		<div class="container">
			<!-- Nav -->
			<nav id="nav" class="nav_ul" style="margin: auto;">
			
				<ul class="nav_ul" style="text-align: left">
				<div class="logo"><a class="logo_a" href="<c:url value="/" />">오늘의 집</a></div>
					<%-- <li><a href="<c:url value="/" />">오늘의 집</a></li> --%>
					<li><a href="<c:url value="/community" />">커뮤니티</a></li>
					<li><a href="<c:url value="/store" />">스토어</a></li>
					
					
					<li><form action="searchItem" method="get" class="searchForm" id="searchForm">
					<input class="input_box" type="text" style="padding: .5em .3em;" placeholder="검색" name="keyword" id="keyword">
					</form></li> 
					
					
					<c:if test="${empty authInfo}">
						<li><a href="<c:url value="/register/step1" />">회원가입</a></li>
						<li><a href="<c:url value="/login" />">로그인</a></li>
					</c:if>
					<c:if test="${!empty authInfo}">
						<c:if test="${authInfo.power eq 'admin'}">
							<li><a href="<c:url value="/admin" />">관리자페이지</a></li>
						</c:if>
						<%-- <c:if test="${authInfo.power eq 'normal'}"> --%>
							<li><a href="<c:url value="/cart" />">장바구니</a></li>
							<li><a href="<c:url value="/logout" />">로그아웃</a>
							<li><span>마이페이지</span>
								<ul>
									<li><a href="<c:url value="/mypage/modify" />">회원정보 수정</a></li>
									<li><a href="#">주문 내역</a>
									<li><a href="#">내가 쓴 글</a></li>
									<li><a href="#">회원 탈퇴</a></li>
								</ul>
							</li>
						<%-- </c:if> --%>
					</c:if>
					<!-- <li><a class="icon solid fa-cog" href="left-sidebar.html"><span>Left Sidebar</span></a></li>
					<li><a class="icon solid fa-retweet" href="right-sidebar.html"><span>Right Sidebar</span></a></li> -->
				</ul>
			</nav>
			<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
		</div>
	</section>