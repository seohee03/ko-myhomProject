<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/admin/include/header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/view/admin/include/nav.jsp"%>
<section>
	<div id="main-wrapper">
		<div class="main-content">
			<section id="member">
			<!-- 제목  -->
			
			<div class="content-header">
				<h1>&nbsp게시판 관리</h1>
			</div>
			<!-- 내용 -->
			<div class="features">
				<table class="itemListTable" >
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
		         	  onclick="location.href='${pageContext.request.contextPath}/community/readArticle/${article.articleNo}'">
		            <td><c:out value="${article.articleNo}" /></td>
		            <td><%-- <a href="<c:url value="/community/readArticle/${article.articleNo}"/>"> --%>${article.articleTitle}</td>
		            <td><c:out value="${article.writerId}" /></td>
		            <%-- <td><c:out value="${article.regdate}" /></td> --%>
		            <td><tf:formatDateTime value ="${article.regdate}" pattern="yyyy-MM-dd" /></td>
		            <td><c:out value="${article.readCount}" /></td>
		         </tr>
		      </c:forEach>

		<tr>
			<td colspan="5">
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
		      </td>
		      </tr>
		      </tbody>
			</table>
		</div>
		</section>
	</div>
	</div>	
	</section>
	
	<script type="text/javascript">
	function fn_paging(curPage) {
		location.href = "articleList?curPage=" + curPage;
		}
</script>
</body>
</html>