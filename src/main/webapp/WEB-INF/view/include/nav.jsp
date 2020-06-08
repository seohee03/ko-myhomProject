<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function() {
		$('#searchForm').submit(function() {
			var keyword = $('#search_input').val().trim();
			if (keyword.length == "") {
				$('#keyword').focus();
				return false;
			} else {
				return true;
			}
		});
	});
</script>



	<!--::header part start::-->
	<header class="main_menu home_menu">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-12">
					<nav class="navbar navbar-expand-lg navbar-light">
						<a class="navbar-brand headerLogo" href="<c:url value="/" />">오늘의집</a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="menu_icon"><i class="fas fa-bars"></i></span>
						</button>

						<div class="collapse navbar-collapse main-menu-item"
							id="navbarSupportedContent">
							<ul class="navbar-nav">
								
								<li class="nav-item"><a class="nav-link" href="<c:url value="/store" />">스토어</a></li>
								<li class="nav-item"><a class="nav-link" href="<c:url value="/community" />">커뮤니티</a></li>
								<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_2" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> 고객센터 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<a class="dropdown-item" href="#"> 1:1문의</a> 
										<a class="dropdown-item" href="#">자주묻는 질문</a> 
										<a class="dropdown-item" href="contact.html">Contact</a>
									</div></li>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" id="navbarDropdown_3" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false" href="<c:url value="/mypage" />"> 마이페이지 </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<c:if test="${empty authInfo}">
											<a class="dropdown-item" href="<c:url value="/login" />">로그인</a>
										</c:if>
										<c:if test="${!empty authInfo}">
											<a class="dropdown-item" href="<c:url value="/logout" />">로그아웃</a>
											<a class="dropdown-item"
												href="<c:url value="/mypage/modify" />">회원정보 수정</a>
											<a class="dropdown-item" href="<c:url value="/cart" />">장바구니</a>
											<a class="dropdown-item" href="#">주문 내역</a>
											<c:if test="${authInfo.power eq 'normal'}">
												<a class="dropdown-item" href="#">회원 탈퇴</a>
											</c:if>
											<c:if test="${authInfo.power eq 'admin'}">
												<a class="dropdown-item" href="<c:url value="/admin/itemList" />">관리자페이지</a>
											</c:if>
										</c:if>
									</div></li>
							</ul>
						</div>
						<div class="hearer_icon d-flex align-items-center">
							<a id="search_1" href="javascript:void(0)"><i
								class="ti-search"></i></a> <a href="<c:url value="/cart" />"> <i
								class="flaticon-shopping-cart-black-shape"></i>
							</a>
							<c:if test="${empty authInfo}">
							<div class="loginBtn hearer_icon d-flex align-items-center">
								<a href="<c:url value="/login" />" class="genric-btn primary-border circle">로그인/회원가입</a>
							</div>
							</c:if>
						</div>
						
					</nav>
				</div>
			</div>
		</div>
		<!-- 검색창 -->
		<div class="search_input" id="search_input_box">
			<div class="container ">
				<form class="d-flex justify-content-between search-inner" id="searchForm" action="searchItem" method="get">
					<input type="text" class="form-control" id="search_input" placeholder="검색" name="keyword">
					<button type="submit" class="btn"></button>
					<span class="ti-close" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
	<!-- Header part end-->
	
	


