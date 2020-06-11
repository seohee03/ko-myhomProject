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
				<h1>&nbsp회원 관리</h1>
			</div>
			<!-- 내용 -->
			<div class="features">
				<table class="itemListTable" >
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<!-- <th>이메일</th>
						<th>휴대전화</th>
						<th>성별</th>
						<th>생년월일</th> -->
						<th>등록일</th>
						<!-- <th>상세페이지</th> -->
						<th></th>
					</tr>
				</thead>
				<tbody class="tbody">
				<c:forEach var="member" items="${memberList}">
					<tr>
						<%-- <td><input type="text" value="${member.memberNo}" name="memberNo" id="memberNo" readonly=readonly></input></td> --%>
						<td><c:out value="${member.memberNo}" /></td>
						<td><c:out value="${member.memberId}" /></td>
						<td><c:out value="${member.memberName}" /></td>
						<%-- <td><c:out value="${member.regdate}" /></td> --%>
						<td><tf:formatDateTime
											value="${member.regdate}" pattern="yyyy-MM-dd" /></td>
						<!-- <td><button type="button" onclick="deleteMember(memberDelete/{member.memberNo}')">탈퇴</button></td> -->
						<!-- <td><button type="button" onclick="deleteMember(memberDelete/{member.memberNo}')">탈퇴</button></td> -->
						<c:if test="${member.power != 'admin'}">
						<td><button class="xBtn" type="button" onclick="deleteMember('${pageContext.request.contextPath}/admin/memberDelete/${member.memberNo}')">탈퇴</button></td>
						</c:if>
						<!-- <td><input type="submit" value="탈퇴"></td> -->
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
	location.href = "memberList?curPage=" + curPage;
	}
	
function deleteMember(url) {
   if(confirm("정말 삭제합니까?")){      
   location.href=url;
   }
}
</script>
</body>
</html>