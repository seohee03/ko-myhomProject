<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">
$(function(){
    $('#submit').click(function(){
    	var articleTitle = $('#articleTitle').val();
    	var articleContent = $('#articleContent').val();
    	
    	if(articleTitle.length == 0){
    		$('.articleTitle').text("제목을 입력해주세요");
    		$('#articleTitle').focus();
    		return false;
    	}else {
    		$('.errStr').text("");
    	}
    	if(articleContent.length == 0){
    		$('.articleContent').focus();
    		return false;
    	}else{
    		$('.errStr').text("");
    	}
    	if(multipartFile.length == 0){
    		$('#file').text("파일을 선택해주세요");
    		return false;
    	}else{
    		$('.errStr').text("");
    	}
    });
});
</script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	  $('#summernote').summernote();
	});
</script>
</head>
<body>

 <form:form modelAttribute="article" enctype="multipart/form-data">
	<p>
    </p>
    <p>
        <label>제목<br>
        <form:input path="articleTitle" />
        <span class="errStr articleTitle"></span>
        </label>
    </p>
     <p>
    </p>
    <p>
        <label>내용<br>
        <form:textarea path="articleContent" id="summernote" class="articleContent"/>
        </label>
    </p>
     <p>
    </p>
    <p>
		대표사진 업로드<form:input type="file" path="multipartFile"	 />
	</p>
    <input type="submit" id="submit" value="등록">
    </form:form>
</body>
</html>