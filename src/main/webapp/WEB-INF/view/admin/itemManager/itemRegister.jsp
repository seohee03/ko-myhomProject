<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/admin/include/header.jsp"%>


<script type="text/javascript">
$(function(){
	var $registerForm = $('#registerForm');
	
    $('#submit').click(function(){	
    	//카테고리, 옵션1 이름, 옵션2 이름, 상품명, 상품 설명, 이미지
    	var categorieNo = $('#categorieNo').val();
    	var itemName = $.trim($('#itemName').val());
    	var itemDetail = $('#itemDetail').val().trim();
    	var option1Name = $('#option1Name').val();
    	var option2Name = $('#option2Name').val();
    	var price =$('#price').val();
    	var stock = $('#stock').val();
    	var files = $('#files').val();
    	
   		if(categorieNo.length == 0){
   			$('.categorieNo').text("카테고리를 선택해주세요");
   			$('#categorieNo').focus();
   			return false;
   		}else {
   			$('.errStr').text("");
   		}
   		
   		if(itemName.length == 0){
    		$('.itemName').text("상품명을 입력해주세요");
    		$('#itemName').focus();
    		return false;
   		}else{
   			$('.errStr').text("");
   		}
   		
   		if(isNaN(price)){
   			$('.price').text("숫자를 입력해주세요");
   			$('#price').focus();
   			return false;
   		}else if(price.length == 0){ 
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
   		}else if(stock.length == 0){
   				$('.stock').text("재고를 입력해주세요");
   	    		$('#stock').focus();
   	    		return false;
   			}else{
    		$('.errStr').text("");
    	}
   		
   		if(files.length == 0){
    		$('.files').text("이미지를 첨부해주세요");
    		$('#files').focus();
    		return false;
   		}else{
   			$('.errStr').text("");
   		}
   		
   		if(option1Name.length == 0){
    		$('.option1Name').text("옵션1을 입력해주세요");
    		$('#option1Name').focus();
    		return false;
   		}else{
   			$('.errStr').text("");
   		}
   		
   		if(option2Name.length == 0){
    		$('.option2Name').text("옵션2를 입력해주세요");
    		$('#option2Name').focus();
    		return false;
   		}else{
   			$('.errStr').text("");
   		}
   		
   		$("#regForm").submit();
    });
});



</script>

</head>
<body>
	
	<%@ include file="/WEB-INF/view/admin/include/nav.jsp"%>
	
	<div id="main-wrapper">
		<div class="main-content">
			<section id="register">
				<div class="content-header">
					<h1>상품 등록</h1>
				</div>
				<div class="form-style-5">
					<form:form id="regForm" modelAttribute="itemCommand" method="POST" enctype="multipart/form-data">
				    <div class="reg select">
					    <label>카테고리:</label>
					    <form:select path="item.categorieNo" id="categorieNo" >
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
					</div >
				    <div class="reg">
				        <label>상품명:</label>
				        	<form:input path="item.itemName" id="itemName"/>
				        	<span class="errStr itemName"></span>
				    </div>
				    <div class="reg">
				        <label>상세 설명:</label>
				        	<form:textarea path="item.itemDetail" id="itemDetail" rows="5" cols="5"/>
				        	<span class="errStr itemDetail"></span>
				    </div>
				    <div class="reg" style="width:47%">
				        <label>가격:</label>
				       		<form:input path="item.price" id="price" />
				        	<span class="errStr price"></span>
				    </div>
				     <div class="reg" style="width:47%">
				        <label>재고:</label>
				        	<form:input path="item.stock" id="stock" />
				        	<span class="errStr stock"></span>
				   </div>
				   <div style="padding-bottom:10px">
				        <label>파일 업로드:</label>
				        <form:input type="file" path="files" multiple="multiple" id ="files" class="filebox" />
				        <span class="errStr files"></span>
				   </div>
				   <div class="fileList"></div>
				   <br>
				   <div class="reg" style="clear:both; padding-top:10px; width:47%;">
						<label>옵션1:</label>
				       	<form:input path="option1.option1Name" id="option1Name"/>
				       	<span class="errStr option1Name"></span>
				   </div>
				   <div class="reg" style="width:47%; float:left">
						<label>가격:</label>
				       	<form:input path="option1.option1Price" id="option1Price"/>
				       	<span class="errStr option1Price"></span>
				   </div>
				    <div class="reg" style="width:47%; float:left; margin-left:45px" >
						<label>재고:</label>
				       	<form:input path="option1.option1Stock" id="option1Stock"/>
				       	<span class="errStr option1Stock"></span>
				   </div>
				   
				 	<div class="reg" style="width:47%">
				 		<label>옵션2:</label>
				    	<form:input path="option2.option2Name" id="option2Name"/>
				    	<span class="errStr option2Name"></span>
				 	</div>
				 	 <div class="reg" style="width:47%; float:left">
						<label>가격:</label>
				       	<form:input path="option2.option2Price" id="option2Price"/>
				       	<span class="errStr option2Price"></span>
				    </div>
				 	<div class="reg" style="width:47%; float:left; margin-left:45px" >
						<label>재고:</label>
				       	<form:input path="option2.option2Stock" id="option2Stock"/>
				       	<span class="errStr option2Stock"></span>
				    </div>
				   	<br>
				   	
					<button type="submit" id="submit" class= regBtn class="registerbtn">상품 등록</button>
   
					</form:form>  
				</div>
			</section>
		</div>
	</div>
	
<script>
var sel_files =[];

$(document).ready(function(){
	$("#files").on("change", handleImgFileSelect);
});

function fileUploadAction(){
	$("#files").trigger('click');
}

function handleImgFileSelect(e){
	
	sel_files = [];
	$(".fileList").empty();
	
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	var index = 0;
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e){
			var html = '<img style="display: inline-block; float:left; width:50px;" src="' +  e.target.result + '">';
			$(".fileList").append(html);
		}
		reader.readAsDataURL(f);
	});
}

/* $("#gdsImg").change(function(){
	const target = document.getElementsByName('files[]');
	var html ='';
	$.each(target[0].files, function(index, file){
		const fileName = file.name;
		html += '<div class="file">';
		html += '<img style="display: inline-block; float:left; width:50px;" src="' + URL.createObjectURL(file) + '">';
		html += '</div>';
		$('.fileList').html(html);
	});    
 }); */
 
</script>
</body>
</html>