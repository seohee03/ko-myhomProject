<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
    $('#modifyBtn').click(function(){
    	var result = confirm('수정하시겠습니까?'); 
    	if(result) { 
    		//액션 경로 지정
    		$("#frm").attr("action", "/www/admin/itemModify");
    		$("#frm").submit();
   		} else {
   			return;
   		}
    });
    
    $('#deleteBtn').click(function(){
    	var result = confirm('삭제하시겠습니까?'); 
    	if(result) { 
    		//액션 경로 지정
    		$("#frm").attr("action", "/www/admin/itemDelete");
    		$("#frm").submit();
   		} else {
   			return;
   		}
    });
});
</script>
</head>
<body>

<h1>상품수정</h1>
<a href="<c:url value="/admin/itemList" />">[상품목록]</a>

 <form:form modelAttribute="itemCommand" id="frm" action="post">
    <form:errors />
	<p>
    <label><spring:message code="categorie.categorieName" />
    <form:select path="item.categorieNo">
    	<option value="${itemCommand.item.categorieNo }"> ----카테고리 선택---- </option>
    	<option value="1">생활용품</option>
    	<option value="2">가전제품</option>
    	<option value="3">가구</option>
    	<option value="4">홈데코</option>
    	<option value="5">욕실용품</option>
	</form:select>
	</label>
	</p>
	<p>
	<label><spring:message code="option1.option1Name" />:
       <form:input path="option1.option1Name" value="${itemCommand.option1.option1Name }"/>
<%--         <form:errors path="itemCommand.item.itemName"/> --%>
    </label>
    <label><spring:message code="option1.price" />:
       <form:input path="option1.option1Price" value="${itemCommand.option1.option1Price }"/>
       <%--  <form:errors path="itemCommand.item.itemName"/> --%>
    </label>
    <label><spring:message code="option1.stock" />:
       <form:input path="option1.option1Stock" value="${itemCommand.option1.option1Stock }"/>
<%--         <form:errors path="itemCommand.item.itemName"/> --%>
    </label>
     </p>
      <p>
	   <label><spring:message code="option2.option2Name" />:
       <form:input path="option2.option2Name" value="${itemCommand.option2.option2Name }" />
<%--         <form:errors path="itemCommand.item.itemName"/> --%>
    </label>
	<label><spring:message code="option2.price" />:
       <form:input path="option2.option2Price" value="${itemCommand.option2.option2Price }"/>
<%--         <form:errors path="itemCommand.item.itemName"/> --%>
    </label>
    <label><spring:message code="option2.stock" />:
       <form:input path="option2.option2Stock" value="${itemCommand.option2.option2Stock }"/>
<%--         <form:errors path="itemCommand.item.itemName"/> --%>
    </label> 
	</p>
	<p>
        <label><spring:message code="itemImg.imgName" />:<br>
        <form:input type="file" path="itemImg.imgName" value="${itemCommand.itemImg.imgName }"/>
       <%--  <form:errors path="itemCommand.item.itemName"/> --%>
        </label>
    </p>  
    <p>
        <label><spring:message code="item.itemName" />:<br>
        <form:input path="item.itemName" value="${itemCommand.item.itemName }"/>
        <form:errors path="item.itemName"/>
        </label>
    </p>
    <p>
        <label><spring:message code="item.itemDetail" />:<br>
        <form:input path="item.itemDetail" value="${itemCommand.item.itemDetail }"/>
        <form:errors path="item.itemDetail"/>
        </label>
    </p>
     <p>
        <label><spring:message code="item.price" />:<br>
        <form:input path="item.price"  value="${itemCommand.item.price }"/>
        <form:errors path="item.price"/>
        </label>
    </p>
     <p>
        <label><spring:message code="item.stock" />:<br>
        <form:input path="item.stock" value="${itemCommand.item.stock }"/>
        <form:errors path="item.stock"/>
        </label>
    </p>
	<form:hidden path="item.itemNo" value="${itemCommand.item.itemNo }"/>
    <input type="button" id="modifyBtn" value="<spring:message code="item.btn.modify" />">
    <input type="button" id="deleteBtn" value="<spring:message code="item.btn.delete" />">
    </form:form> 
</body>
</html>