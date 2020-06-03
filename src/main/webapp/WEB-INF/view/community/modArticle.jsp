<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">
$(function(){
    $('#modifyBtn').click(function(){
    	var result = confirm('수정하시겠습니까?'); 
    	if(result) { 
    		//액션 경로 지정
    		$("#frm").attr("action", "/${pageContext.request.contextPath}/community/modifyDo");
    		$("#frm").submit();
   		} else {
   			return;
   		}
    });
    
    $('#deleteBtn').click(function(){
    	var result = confirm('삭제하시겠습니까?'); 
    	if(result) { 
    		//액션 경로 지정
    		$("#frm").attr("action", "/${pageContext.request.contextPath}/community/delArticle");
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
    <%-- <a href="<c:url value='/community/delArticle'/>" id="deleteBtn">[삭제]</a> --%>
    <input type="button" id="deleteBtn" value="삭제">
    
    </form:form> 
</body>
</html>