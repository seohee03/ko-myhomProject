<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>

<script type="text/javascript">
	$(function() {
		$('#modifyBtn').click(function() {
			var result = confirm('수정하시겠습니까?');
			if (result) {
				//액션 경로 지정
				$("#frm").attr("action", "${pageContext.request.contextPath}/community/modifyDo");
				$("#frm").submit();
			} else {
				return;
			}
		});

		$('#deleteBtn').click(function() {
			var result = confirm('삭제하시겠습니까?');
			if (result) {
				//액션 경로 지정
				$("#frm").attr("action", "${pageContext.request.contextPath}/community/delArticle");
				$("#frm").submit();
			} else {
				return;
			}
		});
		
	});
	
	function commmentInsertBtn(){
		var commentBox = $('#commentBox').val().trim();
		if(commentBox == ''){
			$('#commentBox').focus();
			return false;
		}else{
			$.ajax({
				url : "${pageContext.request.contextPath}/community/insertComment",
				type : "post",
				dataType : "json",
				data : $('#commentForm').serialize(),
				success : function(data){
					if(data == 0){
						//alert('등록 성공');
						location.reload();
					} else if(data == 9) {
						alert('등록 실패');
					}
				}
			});
		}
	}

	</script>
</head>
<%@ include file="/WEB-INF/view/include/nav.jsp"%>
<section id="features" style="width: 60%; margin: auto;">
	<div class="container">

			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
						<th>게시일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:set var="article" value="${article}" />
						<td><c:out value="${article.articleNo}" /></td>
						<td><c:out value="${article.articleTitle}" /></td>
						<td>${article.articleContent}</td>
						<td><c:out value="${article.writerId}" /></td>
						<td><c:out value="${article.regdate}" /></td>
						<td><c:out value="${article.readCount}" /></td>
					</tr>
				</tbody>
			</table>
			<a href="<c:url value="/community/writeDo" />">[글쓰기]</a>

				<c:if test="${authInfo.memberId == article.writerId}">
					<a href="<c:url value='/community/modifyDo/${article.articleNo}'/>">[수정]</a>
					<a href="<c:url value='#'/>" id="deleteBtn">[삭제]</a>
				</c:if>

	</div>
	<form id="commentForm">
		글내용 : <input type="text" name="commentContent" placeholder="댓글을 입력해주세요" id="commentBox">
		<input type="hidden" name= "articleNo" value="${article.articleNo}">
		<input type="button" name="commentInsertBtn" onclick="commmentInsertBtn();" value="등록">
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>댓글번호</th>
				<th>글번호</th>
				<th>회원번호</th>
				<th>댓글내용</th>
				<th>작성일1</th>
				<th>수정일2</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="comment" items="${commentList}">
			<tr>
				<td><c:out value="${comment.commentNo}" /></td>
				<td><c:out value="${comment.articleNo}" /></td>
				<td><c:out value="${comment.memberNo}" /></td>
				<td><c:out value="${comment.commentContent}" /></td>
				<td><c:out value="${comment.regdate}" /></td>
				<td><c:out value="${comment.moddate}" /></td>
				<c:if test="${authInfo.memberNo == comment.memberNo}">
				<td><a href="<c:url value='/community/modify/${comment.commentNo}'/>">[수정]</a></td>
				<td><a href="<c:url value='/community/delete/${comment.commentNo}'/>">[삭제]</a></td>
				</c:if>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</section>
</body>
</html>