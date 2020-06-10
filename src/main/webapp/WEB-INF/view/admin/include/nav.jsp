<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<aside class="left-sidebar">
		<div class="logo">
			<a href="<c:url value="/" />">
				<h1>Adminator</h1>
			</a>
		</div>
		<nav class="left-nav">
			<ul id="nav">
				<li class="current"><a href="#member">회원관리</a></li>
				<li><a href="#order">주문관리</a></li>
				<li><a href="#article">게시글관리</a></li>
				<li><a href="<c:url value="/admin/itemList" />">상품관리</a></li>
				<li><a href="#nomember">비회원관리</a></li>
			</ul>
		</nav>
	</aside>
