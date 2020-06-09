<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">
$(function(){
    $('#amount').change(function(){
		$('#selAmount').text(this.value);
		var price = $('#price').val();
		$('#totalPrice').text(price * this.value + "원");
    });
});

</script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/nav.jsp"%>


<!-- breadcrumb part start-->
    <section class="breadcrumb_part single_product_breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->
    
    <!--================Single Product Area =================-->
  <div class="product_image_area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="product_img_slide owl-carousel">
          <c:set var="itemCommand" value="${itemCommand}" />
          	<div class="single_product_img">
              <img src="${pageContext.request.contextPath }${itemCommand.itemImg.imgUrl}" alt="#" class="img-fluid">
            </div>
          	<%-- <c:forEach items="imgList" var="imgList">
            <div class="single_product_img">
              <img src="${pageContext.request.contextPath }${imgList.imgUrl}" class="img-fluid">
            </div>
            </c:forEach> --%>
            <!-- <div class="single_product_img">
              <img src="img/product/single_product.png" alt="#" class="img-fluid">
            </div>
            <div class="single_product_img">
              <img src="img/product/single_product.png" alt="#" class="img-fluid">
            </div> -->
          </div>
        </div>
        
        
        
<!-- 상품사진, 상품 명, 상품 설명, 가격-->
<%-- <span>상품 번호<c:out value="${itemCommand.item.itemNo}" /></span>
<span>상품 명 <c:out value="${itemCommand.item.itemName}" /></span>
<span>상품 설명<c:out value="${itemCommand.item.itemDetail}" /></span>
<span>가격<c:out value="${itemCommand.item.price}" /></span>
<span>재고<c:out value="${itemCommand.item.stock}" /></span>
<span>상품 번호<c:out value="${item.itemNo}" /></span>
<span>이미지<c:out value="${itemCommand.itemImg.thumbUrl}" /></span> --%>
        
        
        <div class="col-lg-8">
          <div class="single_product_text text-center">
            <h3><c:out value="${itemCommand.item.itemName}" /></h3>
            <p><c:out value="${itemCommand.item.itemDetail}" /></p>
            <div class="card_area">
            	<form:form modelAttribute="cart" method="POST" action="${pageContext.request.contextPath}/cart/cartAdd">
                <div class="product_count_area">
                    <p>Quantity</p>
                    <!-- 카트 추가 : 상품번호, 가격, 수량-->
					
                    <div class="product_count d-inline-block">
						<input type="number" id="amount" name="amount">
                        <form:hidden path="itemNo" value="${itemCommand.item.itemNo }"/>
                        <form:hidden path="price" value="${itemCommand.item.price }"/> 
						<input type="hidden" name="thumbUrl" value="${itemCommand.itemImg.thumbUrl }"/> 
						<form:hidden path="itemName" value="${itemCommand.item.itemName }"/> 
                    </div>
                    <p id="selAmount"></p>
                    <p id="totalPrice"></p>
                </div>
              <div class="add_to_cart">
              	<input type="submit" class="btn_3" value="장바구니 등록">
              </div>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--================End Single Product Area =================-->



<c:set var="itemCommand" value="${itemCommand}" />
<!-- 상품사진, 상품 명, 상품 설명, 가격-->
<span>상품 번호<c:out value="${itemCommand.item.itemNo}" /></span>
<span>상품 명 <c:out value="${itemCommand.item.itemName}" /></span>
<span>상품 설명<c:out value="${itemCommand.item.itemDetail}" /></span>
<span>가격<c:out value="${itemCommand.item.price}" /></span>
<span>재고<c:out value="${itemCommand.item.stock}" /></span>
<span>상품 번호<c:out value="${item.itemNo}" /></span>
<span>이미지<c:out value="${itemCommand.itemImg.thumbUrl}" /></span>

<!-- 카트 추가 : 상품번호, 가격, 수량-->
<form:form modelAttribute="cart" method="POST" action="${pageContext.request.contextPath}/cart/cartAdd">
	<form:hidden path="itemNo" value="${itemCommand.item.itemNo }"/>
 	<c:set var="numArr" value="<%= new int[]{1,2,3,4,5,6,7,8,9}%>" />
	<form:select path="amount">
		<option value="">수량 선택</option>
		<form:options items="${numArr}"/>
	</form:select>
	<form:hidden path="price" value="${itemCommand.item.price }"/> 
	<input type="hidden" name="thumbUrl" value="${itemCommand.itemImg.thumbUrl }"/> 
	<form:hidden path="itemName" value="${itemCommand.item.itemName }"/> 
	<p>수량 : <span id="selAmount"></span></p>
	<p>가격 : <span id="totalPrice"></span></p>
	
	<input type="submit" value="[장바구니 등록]">
</form:form>
<%@ include file="/WEB-INF/view/include/footer.jsp"%>

</body>
</html>