<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>

<script type="text/javascript">
	$(function() {
		$('#modifyBtn')
				.click(
						function() {
							var result = confirm('수정하시겠습니까?');
							if (result) {
								//액션 경로 지정
								$("#frm")
										.attr("action",
												"${pageContext.request.contextPath}/community/modifyDo/");
								$("#frm").submit();
							} else {
								return;
							}
						});

		$('#deleteBtn')
				.click(
						function() {
							var result = confirm('삭제하시겠습니까?');
							if (result) {
								//액션 경로 지정
								$("#frm")
										.attr("action",
												"${pageContext.request.contextPath}/community/delArticle");
								$("#frm").submit();
							} else {
								return;
							}
						});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote();
	});
</script>
<script>
	$(document).ready(function() {
		var fileTarget = $('#file');
		fileTarget.on('change', function() { // 값이 변경되면
			var cur = $(".filebox input[type='file']").val();
			$(".upload-name").val(cur);
		});
	});
</script>

<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


</head>
<body>
	<%@ include file="/WEB-INF/view/include/nav.jsp"%>
	
<%-- 	  <form:form modelAttribute="article" method="POST" id="frm" enctype="multipart/form-data">
    <form:errors />
    <p>
        <label>제목<br>
        <form:input path="articleTitle" value="${article.articleTitle }"/>
        </label>
    </p>
    <p>
        <label>내용<br>
        <form:textarea path="articleContent" value="${article.articleContent }" id="summernote"/>
        </label>
    </p>
    <p>
        <label>대표이미지<br>
    		   <form:input type="file" path="multipartFile" id="file" />
    		   <input class="upload-name" value="${article.articleThumbUrl} ">
        </label>
    </p>
	<form:hidden path="articleNo" value="${article.articleNo }"/>
<!--     <input type="button" id="modifyBtn" value="수정"> -->
    <input type="button" id="modifyBtn" value="수정">
    <a href="<c:url value='/community/delArticle'/>" id="deleteBtn">[삭제]</a>
    <input type="button" id="deleteBtn" value="삭제">
    
    </form:form>  --%>
	
<section class="checkout_area section_padding">
		<form:form modelAttribute="article" enctype="multipart/form-data"
			method="POST" id="frm" class="row contact_form">
			<form:errors />
			<div class="billing_details" style="margin: auto;">
				<div class="row">
					<div class="col-lg-12  form-group">
						<div style="margin: auto;">
							<div class="col-md-12 form-group p_star">제목<br>
								<form:input path="articleTitle" class="form-control" style="width: 300px;" value="${article.articleTitle }" />
									<span class="errStr articleTitle"></span>
							</div>
						</div>
						<div class="col-md-12 form-group p_star">내용<br>
							<form:textarea path="articleContent" id="summernote" class="form-control" rows="1" value="${article.articleContent }" />
						</div>
					<span class="filebox">
						<label class="filebox">대표이미지<form:input type="file" path="multipartFile" id="file" />
						</label>
						<input class="upload-name" value="${article.articleThumbUrl} ">
						<!-- <label class="filebox">등록 <input type="submit">
						</label> -->
						<form:hidden path="articleNo" value="${article.articleNo }" />
						<label class="filebox">수정<input type="button" id="modifyBtn">
						</label>
						<label class="filebox">삭제<input type="button" id="deleteBtn">
						</label>
					</span>
					</div>
				</div>
			</div>
			
		</form:form>
	</section>
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>
</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">
$(function(){
    $('#modifyBtn').click(function(){
    	var result = confirm('수정하시겠습니까?'); 
    	if(result) { 
    		//액션 경로 지정
    		$("#frm").attr("action", "${pageContext.request.contextPath}/community/modifyDo/");
    		$("#frm").submit();
   		} else {
   			return;
   		}
    });
    
    $('#deleteBtn').click(function(){
    	var result = confirm('삭제하시겠습니까?'); 
    	if(result) { 
    		//액션 경로 지정
    		$("#frm").attr("action", "${pageContext.request.contextPath}/community/delArticle");
    		$("#frm").submit();
   		} else {
   			return;
   		}
    });
});
</script>
</head>
<body>

<h1>글수정</h1>
  <form:form modelAttribute="article" method="POST" id="frm">
    <form:errors />
    <p>
        <label>제목<br>
        <form:input path="articleTitle" value="${article.articleTitle }"/>
        </label>
    </p>
    <p>
        <label>내용<br>
        <form:textarea path="articleContent" value="${article.articleContent }"/>
        </label>
    </p>
	<form:hidden path="articleNo" value="${article.articleNo }"/>
<!--     <input type="button" id="modifyBtn" value="수정"> -->
    <input type="button" id="modifyBtn" value="수정">
    <a href="<c:url value='/community/delArticle'/>" id="deleteBtn">[삭제]</a>
    <input type="button" id="deleteBtn" value="삭제">
    
    </form:form> 
</body>
</html> --%>