<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="/WEB-INF/view/include/header.jsp"%>
	<%@ include file="/WEB-INF/view/include/nav.jsp"%>
<script>
	$(document).on('click', '#searchBtn', function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/searchArticle";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});	

</script>
	
	<section id="features" style="width: 60%; margin: auto;">
		<div class="container">
			<h1>게시판 홈</h1>
			
			<form action="searchItem" method="get">
				<select id="searchType" name="searchType">
					<option value="title">제목</option>
					<option value="content">본문</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" placeholder="검색" id="keyword" name="keyword">
				<input type="button" id="searchBtn" value="검색">
			</form>
			<a href="<c:url value="/community/writeDo" />">[글쓰기]</a>
			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>게시일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${articleList}">
						<tr
							onclick="location.href='community/readArticle/${article.articleNo}'">
							<td>${article.articleNo}</td>
							<td>${article.articleTitle}</td>
							<td>${article.writerId}</td>
							<td>${article.regdate}</td>
							<td>${article.readCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	<div>
                    <c:if test="${pagination.curRange ne 1 }">
                        <a href="#" onClick="fn_paging(1)">[처음]</a> 
                    </c:if>
                    <c:if test="${pagination.curPage ne 1}">
                        <a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
                    </c:if>
                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq  pagination.curPage}">
                                <span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                            </c:when>
                            <c:otherwise>
                                <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
                    </c:if>
                    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
                    </c:if>
                </div>
                
                <div>
                    총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
                </div>
	</section>
	
	<script type="text/javascript">
	function fn_paging(curPage) {
		location.href = "community?curPage=" + curPage;
		}
</script>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>
