<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/admin/include/header.jsp"%>


</head>
<body id="welcome">

	<%@ include file="/WEB-INF/view/admin/include/nav.jsp"%>

	<div id="main-wrapper">
		<div class="main-content">
			<section id="member">
				<div class="content-header">
					<h1>회원 관리</h1>
				</div>

				<div class="features">
					<h2 class="twenty">Template Features</h2>

					<ul>
						<li>Clean &amp; Simple Design</li>
						<li>HTML5 &amp; CSS3</li>
						<li>Fully Responsive Design</li>
						<li>PHP/Ajax Powered Working Contact Form</li>
						<li>All files are well commented</li>
						<li>Cross Browser Compatible with IE11+, Firefox, Safari, Opera, Chrome</li>
						<li>Extensive Documentation</li>
					</ul>
				</div>

			</section>

			<section id="order">
				<div class="content-header">
					<h1>주문 관리</h1>
				</div>
				<h2 class="title">Installing Template.</h2>

				<div class="section-content">
					<ol>
						<li>After unzip the download pack, you'll found a Template Folder with all the files.</li>
						<li>You can view this Template in any browser, you can display or edit the Template without an internet connection.(May not wotrk fonts and google map).</li>
						<li>The only section that will not work is the Contact Section which contains PHP code and requires a server environment for send messages.</li>
						<li>Now go to your cpanel or open your FTP Client (like <a target="_blank" href="https://filezilla-project.org/download.php">Filezilla</a>) and upload the content of the Template on your server root.</li>
						<li>Once the files are done uploading go to www.yourdomainname.com/index.html</li>
					</ol>
				</div>

			</section>
			
			<section id="article">
				<div class="content-header">
					<h1>게시글 관리</h1>
				</div>
				<h2 class="title">Installing Template.</h2>

				<div class="section-content">
					<ol>
						<li>After unzip the download pack, you'll found a Template Folder with all the files.</li>
						<li>You can view this Template in any browser, you can display or edit the Template without an internet connection.(May not wotrk fonts and google map).</li>
						<li>The only section that will not work is the Contact Section which contains PHP code and requires a server environment for send messages.</li>
						<li>Now go to your cpanel or open your FTP Client (like <a target="_blank" href="https://filezilla-project.org/download.php">Filezilla</a>) and upload the content of the Template on your server root.</li>
						<li>Once the files are done uploading go to www.yourdomainname.com/index.html</li>
					</ol>
				</div>

			</section>
			
			<section id="product">
				<!-- 제목  -->
				<div class="content-header">
					<h1>상품 관리</h1>
				</div>
				<!-- 내용 -->
				<div class="feature">
				<a href="<c:url value="/admin/itemRegister" />">[상품등록]</a>
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
								<th>이미지 경로</th>
								<th>등록일</th>
							</tr>
						</thead>
						<c:if test="${itemPage.hasNoItems()}">
							<tr>
								<td colspan="9">등록된 상품이 없습니다.</td>
							</tr>
						</c:if>
						<tbody>
							<c:forEach var="itemC" items="${itemPage.content}">
								<tr
									onclick="location.href='${path }/admin/itemModify/${itemC.item.itemNo}'">
									<td><img src="${path }${itemC.itemImg.thumbUrl}"
										style="width: 50px"></td>
									<td><c:out value="${itemC.item.itemNo}" /></td>
									<td><c:out value="${itemC.categorie.categorieName}" /></td>
									<td><c:out value="${itemC.item.itemCode}" /></td>
									<td><c:out value="${itemC.item.itemName}" /></td>
									<td><c:out value="${itemC.item.price}" /></td>
									<td><c:out value="${itemC.item.stock}" /></td>
									<td><c:out value="${itemC.itemImg.thumbUrl}" /></td>
									<td><tf:formatDateTime
											value="${itemC.item.itemRegDateTime }" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
							<c:if test="${itemPage.hasItems()}">
								<tr>
									<td colspan="9"><c:if test="${itemPage.startPage > 5}">
											<a
												href="<c:url value="/admin/itemList/${itemPage.startPage - 5}" />">[이전]</a>
										</c:if> <c:forEach var="pNo" begin="${itemPage.startPage}"
											end="${itemPage.endPage}">
											<a href="<c:url value="/admin/itemList/${pNo}" />">[${pNo}]</a>
										</c:forEach> <c:if test="${itemPage.endPage < itemPage.totalPages}">
											<a
												href="<c:url value="/admin/itemList/${itemPage.startPage + 5}" />">[다음]</a>
										</c:if></td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</section>
			
			<section id="nomember">
				<div class="content-header">
					<h1>비회원 관리</h1>
				</div>
				<h2 class="title">Installing Template.</h2>

				<div class="section-content">
					<ol>
						<li>After unzip the download pack, you'll found a Template Folder with all the files.</li>
						<li>You can view this Template in any browser, you can display or edit the Template without an internet connection.(May not wotrk fonts and google map).</li>
						<li>The only section that will not work is the Contact Section which contains PHP code and requires a server environment for send messages.</li>
						<li>Now go to your cpanel or open your FTP Client (like <a target="_blank" href="https://filezilla-project.org/download.php">Filezilla</a>) and upload the content of the Template on your server root.</li>
						<li>Once the files are done uploading go to www.yourdomainname.com/index.html</li>
					</ol>
				</div>

			</section>
    
  </div>
</div>
</body>
</html>
