<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets2/css/main.css" />
	</head>
	<body class="is-preload">
	<!-- Header -->
			<div id="header">

				<div class="top">

					<!-- Logo -->
						<div id="logo">
							<h1 id="title">관리자 페이지</h1>
							<p>오늘의 집</p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="<c:url value="/admin/itemList" />" id="top-link">상품 관리</a></li>
								<li><a href="<c:url value="/admin/memberList" />" id="portfolio-link">회원 관리</a></li>
								<li><a href="<c:url value="/admin/articleList" />" id="about-link">커뮤니티 관리</a></li>
							</ul>
						</nav>
				</div>
			</div>
<!-- Main -->
			<div id="main">

				<!-- Intro -->
					<section id="top" class="one dark cover">
						<div class="container">

							<header>
								<h2 class="alt">Hi! I'm <strong>Prologue</strong>, a <a href="http://html5up.net/license">free</a> responsive<br />
								site template designed by <a href="http://html5up.net">HTML5 UP</a>.</h2>
								<p>Ligula scelerisque justo sem accumsan diam quis<br />
								vitae natoque dictum sollicitudin elementum.</p>
							</header>

							<footer>
								<a href="#portfolio" class="button scrolly">Magna Aliquam</a>
							</footer>

						</div>
					</section>

				<!-- Portfolio -->
					<section id="portfolio" class="two">
					
					
					<c:set var = "path" value = "${pageContext.request.contextPath }"/>

<a href="<c:url value="/admin/itemRegister" />">[상품등록]</a>

<h1>Item List</h1>
	<table border="1">
		<thead>
			<tr>
				<th>이미지</th>
				<th>번호</th>
				<th>카테고리</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
				<th>옵션1</th>
				<th>옵션2</th>
				<th>이미지 경로</th>
				<th>등록일</th>
			</tr>
		</thead>
		<c:if test="${itemPage.hasNoItems()}">
			<tr>
				<td colspan="11">등록된 상품이 없습니다.</td>
			</tr>
		</c:if>
		<tbody>
		<c:forEach var="itemC" items="${itemPage.content}">
			<tr onclick="location.href='${path }/admin/itemModify/${itemC.item.itemNo}'">
				<td><img src="${path }${itemC.itemImg.thumbUrl}" style="width: 50px"></td>
				<td><c:out value="${itemC.item.itemNo}" /></td>
				<td><c:out value="${itemC.categorie.categorieName}" /></td>
				<td><c:out value="${itemC.item.itemCode}" /></td>
				<td><c:out value="${itemC.item.itemName}" /></td>
				<td><c:out value="${itemC.item.price}" /></td>
				<td><c:out value="${itemC.item.stock}" /></td>
				<td><c:out value="${itemC.option1.option1Name}" /></td>
				<td><c:out value="${itemC.option2.option2Name}" /></td>
				<td><c:out value="${itemC.itemImg.thumbUrl}" /></td>
				<td><tf:formatDateTime value="${itemC.item.itemRegDateTime }" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
		<c:if test="${itemPage.hasItems()}">
			<tr>
				<td colspan="11">
					<c:if test="${itemPage.startPage > 5}">
						<a href="<c:url value="/admin/itemList/${itemPage.startPage - 5}" />" >[이전]</a>
					</c:if>
					<c:forEach var="pNo" begin="${itemPage.startPage}" end="${itemPage.endPage}">
						<a href="<c:url value="/admin/itemList/${pNo}" />">[${pNo}]</a>
					</c:forEach> 
					<c:if test="${itemPage.endPage < itemPage.totalPages}">
						<a href="<c:url value="/admin/itemList/${itemPage.startPage + 5}" />">[다음]</a>
					</c:if>
				</td>
			</tr>
		</c:if>
		</tbody>
	</table>
					
					
					
					
					
					
					
						<div class="container">

							<header>
								<h2>Portfolio</h2>
							</header>

							<p>Vitae natoque dictum etiam semper magnis enim feugiat convallis convallis
							egestas rhoncus ridiculus in quis risus amet curabitur tempor orci penatibus.
							Tellus erat mauris ipsum fermentum etiam vivamus eget. Nunc nibh morbi quis
							fusce hendrerit lacus ridiculus.</p>

							<div class="row">
								<div class="col-4 col-12-mobile">
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic02.jpg" alt="" /></a>
										<header>
											<h3>Ipsum Feugiat</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic03.jpg" alt="" /></a>
										<header>
											<h3>Rhoncus Semper</h3>
										</header>
									</article>
								</div>
								<div class="col-4 col-12-mobile">
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic04.jpg" alt="" /></a>
										<header>
											<h3>Magna Nullam</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic05.jpg" alt="" /></a>
										<header>
											<h3>Natoque Vitae</h3>
										</header>
									</article>
								</div>
								<div class="col-4 col-12-mobile">
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic06.jpg" alt="" /></a>
										<header>
											<h3>Dolor Penatibus</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic07.jpg" alt="" /></a>
										<header>
											<h3>Orci Convallis</h3>
										</header>
									</article>
								</div>
							</div>

						</div>
					</section>

				<!-- About Me -->
					<section id="about" class="three">
						<div class="container">

							<header>
								<h2>About Me</h2>
							</header>

							<a href="#" class="image featured"><img src="images/pic08.jpg" alt="" /></a>

							<p>Tincidunt eu elit diam magnis pretium accumsan etiam id urna. Ridiculus
							ultricies curae quis et rhoncus velit. Lobortis elementum aliquet nec vitae
							laoreet eget cubilia quam non etiam odio tincidunt montes. Elementum sem
							parturient nulla quam placerat viverra mauris non cum elit tempus ullamcorper
							dolor. Libero rutrum ut lacinia donec curae mus vel quisque sociis nec
							ornare iaculis.</p>

						</div>
					</section>

				<!-- Contact -->
					<section id="contact" class="four">
						<div class="container">

							<header>
								<h2>Contact</h2>
							</header>

							<p>Elementum sem parturient nulla quam placerat viverra
							mauris non cum elit tempus ullamcorper dolor. Libero rutrum ut lacinia
							donec curae mus. Eleifend id porttitor ac ultricies lobortis sem nunc
							orci ridiculus faucibus a consectetur. Porttitor curae mauris urna mi dolor.</p>

							<form method="post" action="#">
								<div class="row">
									<div class="col-6 col-12-mobile"><input type="text" name="name" placeholder="Name" /></div>
									<div class="col-6 col-12-mobile"><input type="text" name="email" placeholder="Email" /></div>
									<div class="col-12">
										<textarea name="message" placeholder="Message"></textarea>
									</div>
									<div class="col-12">
										<input type="submit" value="Send Message" />
									</div>
								</div>
							</form>

						</div>
					</section>

			</div>

		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	</body>
</html>