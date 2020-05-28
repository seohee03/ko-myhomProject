<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/include/header.jsp"/>

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
  <form:form modelAttribute="item" method="POST" id="frm">
    <form:errors />
    <p>
        <label>상품명:<br>
        <form:input path="itemName" value="${item.itemName }"/>
        </label>
    </p>
    <p>
        <label>상품설명:<br>
        <form:input path="itemDetail" value="${item.itemDetail }"/>
        </label>
    </p>
     <p>
        <label>가격:<br>
        <form:input path="price"  value="${item.price }"/>
        </label>
    </p>
     <p>
        <label>재고:<br>
        <form:input path="stock" value="${item.stock }"/>
        </label>
    </p>
	<form:hidden path="itemNo" value="${item.itemNo }"/>
    <input type="button" id="modifyBtn" value="수정">
    <input type="button" id="deleteBtn" value="삭제">
    
    </form:form> 
</body>
</html>