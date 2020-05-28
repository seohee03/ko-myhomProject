<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/include/header.jsp"/>
<script type="text/javascript">
$(function(){
    $('#submit').click(function(){
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


 <form:form modelAttribute="item">
    <form:errors />

    <p>
        <label>상품명:<br>
        <form:input path="itemName" />
        <span class="errStr itemName"></span>
        </label>
    </p>
    <p>
        <label>상품설명:<br>
        <form:input path="itemDetail" />
        </label>
    </p>
     <p>
        <label>가격:<br>
        <form:input path="price" />
        <span class="errStr price"></span>
        </label>
    </p>
     <p>
        <label>재고:<br>
        <form:input path="stock" />
        <span class="errStr stock"></span>
        </label>
    </p>

    <input type="submit" id="submit" value="등록">
    </form:form> 
</body>
</html>