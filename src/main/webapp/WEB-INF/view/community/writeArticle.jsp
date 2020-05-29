<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">
$(function(){
    $('#submit').click(function(){
    	//상품명, 가격, 재고
    	var articleNo = $('#articleNo').val();
    	var articleTitle = $('#articleTitle').val();
    	var articleContent = $('#articleContent').val();
    	var writerId = $('#writerId').val();
    	var writerName = $('#writerName').val();
    	
    	if(articleTitle.length == 0){
    		$('.articleTitle').text("제목을 입력해주세요");
    		$('#articleTitle').focus();
    		return;
    	}else if(articleContent.length == 0){
    		$('.articleContent').textarea("내용을 입력해주세요");
    		$('#articleContent').focus();
    		return;
    	}else{
    		$('.errStr').text("");
    	}

    });
});
</script>

</head>
<body>


 <form:form modelAttribute="article">
    <form:errors />
	<p>
        ${articleNo }
    </p>
    <p>
        <label>제목<br>
        <form:input path="articleTitle" />
        <span class="errStr articleTitle"></span>
        </label>
    </p>
     <p>
        ${writerId }
    </p>
    <p>
        <label>내용<br>
        <form:textarea path="articleContent" />
        </label>
    </p>
     <p>
        ${writerName }
    </p>
    <input type="submit" id="submit" value="등록">
    </form:form>
</body>
</html>