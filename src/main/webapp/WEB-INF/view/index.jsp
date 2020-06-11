<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/view/include/nav.jsp"%>
<!-- Features -->
	<div class="container">
		<!-- <div class="row">
		<div class="row align-items-center justify-content-center"> -->
			<!-- <div class="col-lg-12"> -->
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img src="images/01.jpg" />
						</div>
						<div class="item">
							<img src="images/02.jpg" />
						</div>
						<div class="item">
							<img src="images/03.jpg" />
						</div>
						<div class="item">
							<img src="images/04.jpg" />
						</div>
					</div>
					<a class="left carousel-control" href="#myCarousel"	data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				<!-- </div> -->
			<!-- </div> -->
		<!-- </div> -->
	</div>
</div>
<!-- trending item start-->
<section class="trending_items">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section_tittle text-left">
					<h4>인기 상품</h4>
					<a href="${pageContext.request.contextPath}/store" >전체보기</a>
					<hr>
				</div>
			</div>
		</div>
		<div class="pdList">
		<ul class="clearfix">
			<c:set var="path" value="${pageContext.request.contextPath }" />
			<c:forEach var="itemC" items="${itemCommandList}">
			<li>
				<a href="<c:url value="/itemDetail?itemNo=${itemC.item.itemNo }"/>">
					<div class="imgArea">
						<img alt="" src="${path }${itemC.itemImg.thumbUrl}">
					</div>
					<div class="infoArea">
					 	<p class="brand"><c:out value="${itemC.categorie.categorieName}" /></p>
					 	<p class="ttl"><c:out value="${itemC.item.itemName}" /></p>
					 	<p class="pdSum"><c:out value="${itemC.item.price}" />원</p>
					</div>
				</a>
				
			</li>
			</c:forEach>
		</ul>
	</div>
	</div>
</section>
<!-- trending item end-->

<!-- trending item start-->
<section class="trending_items">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section_tittle text-left">
					<h4>베스트 사진</h4>
					<a href="${pageContext.request.contextPath}/community" >전체보기</a>
					<hr>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-sm-6">
				<div class="single_product_item">
					<div class="single_product_item_thumb">
						<img src="img/tranding_item/tranding_item_1.png" alt="#"
							class="img-fluid">
					</div>
					<h3>
						<a href="single-product.html">Cervical pillow for airplane car
							office nap pillow</a>
					</h3>
					<p>From $5</p>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6">
				<div class="single_product_item">
					<img src="img/tranding_item/tranding_item_2.png" alt="#"
						class="img-fluid">
					<h3>
						<a href="single-product.html">Foam filling cotton slow rebound pillows</a>
					</h3>
					<p>From $5</p>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6">
				<div class="single_product_item">
					<img src="img/tranding_item/tranding_item_3.png" alt="#"
						class="img-fluid">
					<h3>
						<a href="single-product.html">Memory foam filling cotton Slow
							rebound pillows</a>
					</h3>
					<p>From $5</p>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6">
				<div class="single_product_item">
					<img src="img/tranding_item/tranding_item_4.png" alt="#"
						class="img-fluid">
					<h3>
						<a href="single-product.html">Cervical pillow for airplane car
							office nap pillow</a>
					</h3>
					<p>From $5</p>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6">
				<div class="single_product_item">
					<img src="img/tranding_item/tranding_item_5.png" alt="#"
						class="img-fluid">
					<h3>
						<a href="single-product.html">Foam filling cotton slow rebound
							pillows</a>
					</h3>
					<p>From $5</p>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6">
				<div class="single_product_item">
					<img src="img/tranding_item/tranding_item_6.png" alt="#"
						class="img-fluid">
					<h3>
						<a href="single-product.html">Memory foam filling cotton Slow
							rebound pillows</a>
					</h3>
					<p>From $5</p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- trending item end-->

<div class="container">
	<header>
		<h2>
			Gentlemen, behold! This is <strong>Strongly Typed</strong>!
		</h2>
	</header>
	<div class="row aln-center">
		<div class="col-4 col-6-medium col-12-small">

			<!-- Feature -->
			<section>
				<a href="#" class="image featured"><img src="images/01.jpg"
					alt="" /></a>
				<header>
					<h3>Okay, so what is this?</h3>
				</header>
				<p>
					This is <strong>Strongly Typed</strong>, a free, fully responsive
					site template by <a href="http://html5up.net">HTML5 UP</a>. Free
					for personal and commercial use under the <a
						href="http://html5up.net/license">CCA 3.0 license</a>.
				</p>
			</section>

		</div>
		<div class="col-4 col-6-medium col-12-small">

			<!-- Feature -->
			<section>
				<a href="#" class="image featured"><img src="images/02.jpg"
					alt="" /></a>
				<header>
					<h3>Nice! What is HTML5 UP?</h3>
				</header>
				<p>
					<a href="http://html5up.net">HTML5 UP</a> is a side project of <a
						href="http://twitter.com/ajlkn">AJ’s</a> (= me). I started it as a
					way to both test my responsive tools and sharpen up my coding and
					design skills a bit.
				</p>
			</section>

		</div>
		<div class="col-4 col-6-medium col-12-small">

			<!-- Feature -->
			<section>
				<a href="#" class="image featured"><img src="images/03.jpg"
					alt="" /></a>
				<header>
					<h3>What's this built with?</h3>
				</header>
				<p>
					<strong>Responsive Tools</strong> is a simple set of tools for
					building responsive sites and apps. All of my templates at <a
						href="http://html5up.net">HTML5 UP</a> are built using these
					tools.
				</p>
			</section>

		</div>
		<div class="col-12">
			<ul class="actions">
				<li><a href="#" class="button icon solid fa-file">Tell Me
						More</a></li>
			</ul>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>
