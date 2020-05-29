<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">
$(function(){
    $('#modifyBtn').click(function(){
    	var result = confirm('수정하시겠습니까?'); 
    	if(result) { 
    		//액션 경로 지정
    		$("#frm").attr("action", "/test/admin/memberModify");
    		$("#frm").submit();
   		} else {
   			return;
   		}
    });
    
    $('#deleteBtn').click(function(){
    	var result = confirm('삭제하시겠습니까?'); 
    	if(result) { 
    		//액션 경로 지정
    		$("#frm").attr("action", "/test/admin/memberDelete");
    		$("#frm").submit();
   		} else {
   			return;
   		}
    });
});
</script>
</head>
<body>

<h1>회원수정</h1>
  <form:form modelAttribute="member" method="POST" id="frm">
    <form:errors />
    <p>
        <label>회원 아이디:<br>
        <form:input path="memberId" value="${member.memberId }"/>
        <form:errors path="memberId"/>
        </label>
    </p>
    <p>
        <label>회원 이름:<br>
        <form:input path="memberName" value="${member.memberName }"/>
        <form:errors path="memberName"/>
        </label>
    </p>
    <p>
        <label>비밀번호:<br>
        <form:input path="memberPw" value="${member.memberPw }"/>
        <form:errors path="memberPw"/>
        </label>
    </p>
	<form:hidden path="memberNo" value="${member.memberNo }"/>
    <input type="button" id="modifyBtn" value="수정">
    <input type="button" id="deleteBtn" value="삭제"">
    
    </form:form> 
</body>
</html>