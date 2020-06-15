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
			$(".container").attr("action", "${pageContext.request.contextPath}/community/delArticle");
			$(".container").submit();
		} else {
			return;
		}
	});
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/nav.jsp"%>
<c:set var="article" value="${article}" />
<div class="container">
	<div class="articleArea">
		<div class="articleInfo">
			<div class="articleImg">
				<img src="${pageContext.request.contextPath }${article.articleImgUrl}">
			</div>
			<div class="title">${article.articleTitle}</div>
			<ul>
				<li>작성자  : ${article.writerId}</li>
				<li>등록날짜  : <tf:formatDateTime value ="${article.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></li>
				<li>조회수  : ${article.readCount}</li>
				<c:if test="${authInfo.memberId == article.writerId}">
					<a href="<c:url value='/community/modifyDo/${article.articleNo}'/>">[수정]</a>
					<a href="<c:url value='#'/>" id="deleteBtn">[삭제]</a>
				</c:if>
			</ul>
			<div class="contentArea">
				${article.articleContent}
			</div>
		</div>
		<div class="commentArea">
			<form id="commentForm">
				<input type="text" name="commentContent" placeholder="댓글을 입력해주세요" id="commentBox"> 
				<input type="hidden" name="articleNo" value="${article.articleNo}">
				<input type="button" name="commentInsertBtn" onclick="commmentInsertBtn();" value="등록">
			</form>
			<section>
				<h4>Comments</h4>
				<hr>
				<c:forEach var="comment" items="${commentList}">
					<div class="commentSec">
						<div class="contentSec">
							<c:out value="${comment.commentContent}" />
						</div>
						
						<div class="commentInfo">
							<ul>
								<li>
									등록 : <tf:formatDateTime value="${comment.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</li>
								<li>
									<c:if test="${!empty comment.moddate }">
									수정 :<tf:formatDateTime value ="${comment.moddate}" pattern="yyyy-MM-dd HH:mm:ss" />
							        </c:if>
								</li>
							</ul>
							<%-- <c:out value="${comment.memberNo}" /> --%>
							<%-- 등록 날짜 : <tf:formatDateTime value="${comment.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</p>
							<p>
							<c:if test="${!empty comment.moddate }">
							수정한 날짜 :<tf:formatDateTime value ="${comment.moddate}" pattern="yyyy-MM-dd HH:mm:ss" />
					        </c:if>
							</p> --%>
						</div>
						<c:if test="${authInfo.memberNo == comment.memberNo}">
							<div class="commentList${comment.commentNo}">
								<input type="button" id="commentModifyBtn" onclick="commentModifyBtn('${comment.commentNo}', '${comment.commentContent}')" value="수정"> 
								<input type="button" id="commentDeleteBtn" onclick="commentDeleteBtn('${comment.commentNo}')" value="삭제">
							</div>
						</c:if>
					</div>
					<hr>
				</c:forEach>
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
			</section>
		</div>
	</div>
	
</div>


<%-- 글쓰기 버튼 없앨지 말지
글 보는 페이지에 표시할 내용이 무엇인지 (제목, 대표사진, 작성자, 등록날짜, 조회수, 내용, 댓글-내용, 작성자, 등록날짜)
	<section id="features" style="width: 60%; margin: auto;">
		<div class="container">

			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>이미지</th>
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
						<td><img src="${pageContext.request.contextPath }${article.articleThumbUrl}" style="width: 150px"></td>
						<a href="<c:url value="community/byWriterId" />">
						<td><c:out value="${article.writerId}" /></td>
						<!-- </a> -->
						<td><c:out value="${article.regdate}" /></td>
						<td><c:out value="${article.readCount}" /></td>
					</tr>
				</tbody>
			</table>
			<a href="<c:url value="/community/writeDo" />">[글쓰기]</a>

			<c:if test="${authInfo.memberId == article.writerId}">
				<form:hidden path="articleNo" value="${article.articleNo }" />
				<a href="<c:url value='/community/modifyDo/${article.articleNo}'/>">[수정]</a>
				<a href="<c:url value='#'/>" id="deleteBtn">[삭제]</a>
			</c:if>

		</div>
		
		<br>
		<br>
		<section>
		<h4>Comments</h4>
		<hr>
		<c:forEach var="comment" items="${commentList}">
			<div>
				<c:out value="${comment.commentContent}" />
				<div>
					<p>
						<c:out value="${comment.memberNo}" />
						등록 날짜 : <tf:formatDateTime value="${comment.regdate}" pattern="yyyy-MM-dd" />
						<c:if test="${!empty comment.moddate }">
						수정한 날짜 :<tf:formatDateTime value ="${comment.moddate}" pattern="yyyy-MM-dd" />
                        </c:if>
					</p>
				</div>

				<c:if test="${authInfo.memberNo == comment.memberNo}">
					<div class="commentList${comment.commentNo}">
						<input type="button" id="commentModifyBtn"
							onclick="commentModifyBtn('${comment.commentNo}', '${comment.commentContent}')"
							value="수정"> <input type="button" id="commentDeleteBtn"
							onclick="commentDeleteBtn('${comment.commentNo}')" value="삭제">
					</div>
				</c:if>
			</div>
			<br>
			<hr>
		</c:forEach>
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
</section> --%>

<script type="text/javascript">
function fn_paging(curPage) {
	var articleNo = "${article.articleNo}"
	location.href = articleNo +"?curPage=" + curPage;
	}

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
				} else if (data == 5) {
					location.href='${pageContext.request.contextPath}/login';
				}
			
			}
		});
	}
}

function commentModifyBtn(commentNo, commentContent){
	/* var commentNo = "${comment.commentNo}"; */
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="contentText" name="content_'+commentNo+'" value="'+commentContent+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+commentNo+');">완료</button> </span>';
    a += '</div></td>';
    
    $('.commentList'+commentNo).html(a);
}

function commentUpdateProc(commentNo){
    var updateContent = $('[name=content_'+commentNo+']').val();
    var articleNo = "${comment.articleNo}"
    $.ajax({
        url : '${pageContext.request.contextPath}/community/commentUpdate',
        type : 'post',
        dataType : "json",
        data : {'commentContent' : updateContent, 'commentNo' : commentNo},
        success : function(data){
            if(data == 0) {
            	alert("수정완료");
            	location.reload();
            }else if(data == 9){
            	alert("수정실패");
            	$('.contentText').focus();
            }
        }
    });
}

function commentDeleteBtn(commentNo){
    var articleNo = "${comment.articleNo}"
	$.ajax({
		url : '${pageContext.request.contextPath}/community/commentDelete/'+ commentNo,
		type : 'post',
		dataType : "json",
		success : function(data){
			confirm('삭제하시겠습니까?');
			if(data == 0){
				alert("삭제성공")
				location.reload();
			} else if(data == 9){
				alert("삭제실패")
			}
		}	
	});
	
}

</script>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>