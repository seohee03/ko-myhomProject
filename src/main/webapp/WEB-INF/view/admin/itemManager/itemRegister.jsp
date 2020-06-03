<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    $('#submit').click(function(){
    	var result = confirm('등록하시겠습니까?'); 
    	if(result) { 
    		//액션 경로 지정
    		$("#submit").submit();
   		} else {
   			return;
   		}
    	//상품명, 가격, 재고
    	var itemName = $('#itemName').val();
    	var price = $('#price').val();
    	var stock = $('#stock').val();
    	
    	if(itemName.length == 0){
    		$('.itemName').text("상품명을 입력해주세요");
    		$('#itemName').focus();
    		return;
    	}else if(price.length == 0){
    		$('.price').text("가격을 입력해주세요");
    		$('#price').focus();
    		return;
    	}else if(stock.length == 0){
    		$('.stock').text("재고를 입력해주세요");
    		$('#stock').focus();
    		return;
    	}else{
    		$('.errStr').text("");
    	}
    });
});
</script>

</head>
<body>

<h1>상품등록</h1>
<form:form  modelAttribute="itemCommand" method="POST" enctype="multipart/form-data">
    <form:errors />
    <p>
    <label><spring:message code="categorie.categorieName" />
    <form:select path="item.categorieNo">
    	<option value=""> ----카테고리 선택---- </option>
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
       <form:input path="option1.option1Name" />
       <%--  <form:errors path="itemCommand.item.itemName"/> --%>
    </label>
    <label><spring:message code="option1.price" />:
       <form:input path="option1.option1Price" />
       <%--  <form:errors path="itemCommand.item.itemName"/> --%>
    </label>
    <label><spring:message code="option1.stock" />:
       <form:input path="option1.option1Stock" />
       <%--  <form:errors path="itemCommand.item.itemName"/> --%>
    </label>
     </p>
     <p>
	   <label><spring:message code="option2.option2Name" />:
       <form:input path="option2.option2Name" />
     <%--    <form:errors path="itemCommand.item.itemName"/> --%>
    </label>
	<label><spring:message code="option2.price" />:
       <form:input path="option2.option2Price" />
      <%--   <form:errors path="itemCommand.item.itemName"/> --%>
    </label>
    <label><spring:message code="option2.stock" />:
       <form:input path="option2.option2Stock" />
<%--         <form:errors path="itemCommand.item.itemName"/> --%>
    </label> 
	</p>
	
	<p>
        <label><spring:message code="itemImg.imgName" />:<br>
        <form:input type="file" path="files" multiple="multiple"/>
       <!--  <input multiple="multiple" type="file" name="files" /> -->
     <%--    <form:errors path="item.stock"/> --%>
        </label>
    </p>
	
    <p>
        <label><spring:message code="item.itemName" />:<br>
        <form:input path="item.itemName" />
       <%--  <form:errors path="item.itemName"/> --%>
        </label>
    </p>
    <p>
        <label><spring:message code="item.itemDetail" />:<br>
        <form:input path="item.itemDetail" />
   <%--      <form:errors path="item.itemDetail"/> --%>
        </label>
    </p>
     <p>
        <label><spring:message code="item.price" />:<br>
        <form:input path="item.price" />
     <%--    <form:errors path="item.price"/> --%>
        </label>
    </p>
     <p>
        <label><spring:message code="item.stock" />:<br>
        <form:input path="item.stock" />
     <%--    <form:errors path="item.stock"/> --%>
        </label>
    </p>
	
    <input type="submit" id="submit" value="<spring:message code="item.btn" />">
   
    </form:form>  
</body>
</html>