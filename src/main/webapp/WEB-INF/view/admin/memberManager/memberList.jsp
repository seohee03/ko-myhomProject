<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
</head>
<body>


	<a href="<c:url value="/admin/memberList" />">[회원관리]</a>
    <a href="<c:url value="/admin/itemList" />">[상품관리]</a>
    <a href="<c:url value="/admin/itemRegister" />">[상품등록]</a>
    <a href="<c:url value="/admin" />">[주문관리]</a>
    <a href="<c:url value="/admin" />">[게시글 관리]</a>
	<a href="<c:url value="/admin" />">[비회원 관리]</a>
	<hr/>
	<h1>회원 조회</h1>
	<table border="1" >
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
		<tbody>
		<c:forEach var="member" items="${memberList}">
			<tr>
				<%-- <td><input type="text" value="${member.memberNo}" name="memberNo" id="memberNo" readonly=readonly></input></td> --%>
				<td><c:out value="${member.memberNo}" /></td>
				<td><c:out value="${member.memberId}" /></td>
				<td><c:out value="${member.memberName}" /></td>
				<td><c:out value="${member.regdate}" /></td>
				<%-- <td><a href="memberModify/${member.memberNo}">상세페이지</a></td> --%>
				<!-- <td><button type="button" onclick="deleteMember(memberDelete/{member.memberNo}')">탈퇴</button></td> -->
				<!-- <td><button type="button" onclick="deleteMember(memberDelete/{member.memberNo}')">탈퇴</button></td> -->
				<td><button type="button" onclick="deleteMember('${pageContext.request.contextPath}/admin/memberDelete/${member.memberNo}')">탈퇴</button></td>
				<!-- <td><input type="submit" value="탈퇴"></td> -->
			</tr>
		</c:forEach>
		</tbody>
	</table>
<script type="text/javascript">

function deleteMember(url) {
   if(confirm("정말 삭제합니까?")){      
   location.href=url;
   }
}
</script>
</body>
</html>