<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<style>
img {
	max-width: 100%;
	height: auto;
}
</style>

</head>
<%@ include file="/WEB-INF/view/include/nav.jsp"%>
<!-- Features -->
<section id="features" style="width: 60%; margin: auto;">
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			style="width: 60%; margin: auto;">
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
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
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
							href="http://twitter.com/ajlkn">AJ’s</a> (= me). I started it as
						a way to both test my responsive tools and sharpen up my coding
						and design skills a bit.
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
</section>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>
