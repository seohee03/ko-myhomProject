<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="/WEB-INF/view/include/header.jsp"%>
	<%@ include file="/WEB-INF/view/include/nav.jsp"%>

<script type="text/javascript">
$(function(){
    $('#modifyBtn').click(function(){
    	var categorieNo = $('#categorieNo').val();
    	var itemName = $('#itemName').val();
    	var itemDetail = $('#itemDetail').val();
    	var option1Name = $('#option1Name').val();
    	var option2Name = $('#option2Name').val();
    	var price = $('#price').val();
    	var stock = $('#stock').val();
    	var files = $('#files').val();
    	
   		if(categorieNo == ""){
   			$('.categorieNo').text("카테고리를 선택해주세요");
   			$('#categorieNo').focus();
   			return false;
   		}else {
   			$('.errStr').text("");
   		}
   		
   		if(option1Name.length == 0){
    		$('.option1Name').text("상위 옵션을 입력해주세요");
    		$('#option1Name').focus();
    		return false;
   		}else{
   			$('.errStr').text("");
   		}
   		
   		if(option2Name.length == 0){
    		$('.option2Name').text("하위 옵션을 입력해주세요");
    		$('#option2Name').focus();
    		return false;
   		}else{
   			$('.errStr').text("");
   		}
   		
    	if(files == ""){
    		$('.files').text("이미지를 첨부해주세요");
    		$('#files').focus();
    		return false;
   		}else{
   			$('.errStr').text("");
   		}
    	
   		if(itemName == ""){
    		$('.itemName').text("상품명을 입력해주세요");
    		$('#itemName').focus();
    		return false;
   		}else{
   			$('.errStr').text("");
   		}
   		
   		if(itemDetail == ""){
    		$('.itemDetail').text("상품 내용을 입력해주세요");
    		$('#itemDetail').focus();
    		return false;
   		}else{
   			$('.errStr').text("");
   		}
   		
   		if(isNaN(price)){
   			$('.price').text("숫자를 입력해주세요");
   			$('#price').focus();
   			return false;
   		}else if(price == ""){ //문자 및 특수문자 체크
   				$('.price').text("가격을 입력해주세요");
   	    		$('#price').focus();
   	    		return false;
   		}else{
    		$('.errStr').text("");
    	}
   		
   		if(isNaN(stock)){
   			$('.stock').text("숫자를 입력해주세요");
   			$('#stock').focus();
   			return false;
   		}else if(stock == ""){
   				$('.stock').text("재고를 입력해주세요");
   	    		$('#stock').focus();
   	    		return false;
   			}else{
    		$('.errStr').text("");
    	}
   		
    	var result = confirm('수정하시겠습니까?'); 
    	if(result) { 
    		//액션 경로 지정
    		$("#frm").attr("action", "/myhome/admin/itemModify");
    		$("#frm").submit();
   		} else {
   			return;
   		}
    });
    
    $('#deleteBtn').click(function(){
    	var result = confirm('삭제하시겠습니까?'); 
    	if(result) { 
    		//액션 경로 지정
    		$("#frm").attr("action", "/myhome/admin/itemDelete");
    		$("#frm").submit();
   		} else {
   			return;
   		}
    });
});
</script>


<h1>상품수정</h1>
<a href="<c:url value="/admin/itemList" />">[상품목록]</a>

 <form:form modelAttribute="itemCommand" id="frm" enctype="multipart/form-data">

    <form:errors />
	<p>
    <label><spring:message code="categorie.categorieName" />
    <form:select path="item.categorieNo" id="categorieNo">
    	<option value="${itemCommand.item.categorieNo }"> ----카테고리 선택---- </option>
    	<option value="1">생활용품</option>
    	<option value="2">가전제품</option>
    	<option value="3">가구</option>
    	<option value="4">홈데코</option>
    	<option value="5">욕실용품</option>
	</form:select>
	<span class="errStr categorieNo"></span>
	</label>
	</p>
	<p>
	<label><spring:message code="option1.option1Name" />:
       <form:input path="option1.option1Name" id="option1Name" value="${itemCommand.option1.option1Name }"/>
    </label>
    <label><spring:message code="option1.price" />:
       <form:input path="option1.option1Price" value="${itemCommand.option1.option1Price }"/>
    </label>
    <label><spring:message code="option1.stock" />:
       <form:input path="option1.option1Stock" value="${itemCommand.option1.option1Stock }"/>
    </label><br>
    <span class="errStr option1Name"></span>
     </p>
      <p>
	   <label><spring:message code="option2.option2Name" />:
       <form:input path="option2.option2Name" id="option2Name" value="${itemCommand.option2.option2Name }" />
    </label>
	<label><spring:message code="option2.price" />:
       <form:input path="option2.option2Price" value="${itemCommand.option2.option2Price }"/>
    </label>
    <label><spring:message code="option2.stock" />:
       <form:input path="option2.option2Stock" value="${itemCommand.option2.option2Stock }"/>
    </label><br>
    <span class="errStr option2Name"></span>
	</p>
	<p>
        <label><spring:message code="itemImg.imgName" />:<br>
         <input multiple="multiple" type="file" name="files" id= "files"/>
        </label>
        <span class="errStr files"></span>
    </p>  
    <p>
        <label><spring:message code="item.itemName" />:<br>
        <form:input path="item.itemName" id="itemName" value="${itemCommand.item.itemName }"/>
        <form:errors path="item.itemName"/>
         <form:errors path="item.itemName"/>
        </label>
    </p>
    <p>
        <label><spring:message code="item.itemDetail" />:<br>
        <form:input path="item.itemDetail" id="itemDetail" value="${itemCommand.item.itemDetail }"/>
        <form:errors path="item.itemDetail"/>
        <span class="errStr itemDetail"></span>
        </label>
    </p>
     <p>
        <label><spring:message code="item.price" />:<br>
        <form:input path="item.price"  id="price" value="${itemCommand.item.price }"/>
        <form:errors path="item.price"/>
        <span class="errStr price"></span>
        </label>
    </p>
     <p>
        <label><spring:message code="item.stock" />:<br>
        <form:input path="item.stock" id="stock" value="${itemCommand.item.stock }"/>
        <form:errors path="item.stock"/>
        <span class="errStr stock"></span>
        </label>
    </p>
	<form:hidden path="item.itemNo" value="${itemCommand.item.itemNo }"/>
    <button type="submit" id="modifyBtn">상품 수정</button>
    <button type="submit" id="deleteBtn">상품 삭제</button>

    </form:form> 
   
</body>
</html>