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
    		$('#articleContent').focus();
    		return false;
    	}else{
    		$('.errStr').text("");
    	}
    });
});
</script>

</head>
<body>

 <form:form modelAttribute="article">
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
        <form:textarea path="articleContent"/>
        </label>
    </p>
     <p>
    </p>
    <input type="submit" id="submit" value="등록">
    </form:form>
</body>
</html>