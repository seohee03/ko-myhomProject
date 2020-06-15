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
          </div>
        </div>
        
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

<%@ include file="/WEB-INF/view/include/footer.jsp"%>

</body>
</html>