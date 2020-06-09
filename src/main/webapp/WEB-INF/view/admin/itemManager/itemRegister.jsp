<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="/WEB-INF/view/include/header.jsp"%>
	<%@ include file="/WEB-INF/view/include/nav.jsp"%>

<script type="text/javascript">
$(function(){
	var $registerForm = $('#registerForm');
	
    $('#submit').click(function(){	
    	//카테고리, 옵션1 이름, 옵션2 이름, 상품명, 상품 설명, 이미지
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
   		
   		$("#regForm").submit();
  
    });
});
</script>



<h1>상품등록</h1>
<form:form id="regForm" modelAttribute="itemCommand" method="POST" enctype="multipart/form-data">
    <p>
    <label><spring:message code="categorie.categorieName" />
    <form:select path="item.categorieNo" id="categorieNo">
    	<option value=""> ----카테고리 선택---- </option>
    	<option value="1">가구</option>
    	<option value="2">침구</option>
    	<option value="3">패브릭</option>
    	<option value="4">홈데코</option>
    	<option value="5">가전</option>
    	<option value="6">생활용품</option>
    	<option value="7">주방</option>
	</form:select>
	<span class="errStr categorieNo"></span>
	</label>
	</p>
	
	<p>
		<label><spring:message code="option1.option1Name" />:
       		<form:input path="option1.option1Name" id="option1Name"/>
    	</label>
    	<label><spring:message code="option1.price" />:
       		<form:input path="option1.option1Price" />
   		 </label>
   		 <label><spring:message code="option1.stock" />:
      		<form:input path="option1.option1Stock" />
   		 </label><br>
    		 <span class="errStr option1Name"></span>
   	</p>
    <p>
		<label><spring:message code="option2.option2Name" />:
    		<form:input path="option2.option2Name" id="option2Name"/>
   		</label>
		<label><spring:message code="option2.price" />:
       		<form:input path="option2.option2Price" />
    	</label>
    	<label><spring:message code="option2.stock" />:
        	<form:input path="option2.option2Stock" /><br>
   		</label>
    	<span class="errStr option2Name"></span>
	</p>
	
	<p>
        <label><spring:message code="itemImg.imgName" />:<br>
        <form:input type="file" path="files" multiple="multiple" id = "files"/>
        <span class="errStr files"></span>
        </label>
    </p>
	
    <p>
        <label><spring:message code="item.itemName" />:<br>
        <form:input path="item.itemName" id="itemName"/>
         <span class="errStr itemName"></span>
        <form:errors path="item.itemName"/>
        </label>
    </p>
    <p>
        <label><spring:message code="item.itemDetail" />:<br>
        <form:input path="item.itemDetail" id="itemDetail"/>
        <span class="errStr itemDetail"></span>
        </label>
    </p>
     <p>
        <label><spring:message code="item.price" />:<br>
        <form:input path="item.price" id="price"/>
        <span class="errStr price"></span>
        </label>
    </p>
     <p>
        <label><spring:message code="item.stock" />:<br>
        <form:input path="item.stock" id="stock"/>
        <span class="errStr stock"></span>
        </label>
    </p>
	<button type="submit" id="submit">상품 등록</button>
   
</form:form>  
</body>
</html>