<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script type="text/javascript">
$(function() {
	  $('#summernote').summernote();
	      var fileTarget = $('#file');
	      fileTarget.on('change', function() { // 값이 변경되면
	         var cur = $(".filebox input[type='file']").val();
	         $(".upload-name").val(cur);
	      });
      $('#submit').click(function() {
         var articleTitle = $('#articleTitle').val();
         var articleContent = $('#articleContent').val();

         if (articleTitle.length == 0) {
            $('.articleTitle').text("제목을 입력해주세요");
            $('#articleTitle').focus();
            return false;
         } else {
            $('.errStr').text("");
         }
         if (articleContent.length == 0) {
            $('.articleContent').focus();
            return false;
         } else {
            $('.errStr').text("");
         }
         if (multipartFile.length == 0) {
            $('#file').text("파일을 선택해주세요");
            return false;
         } else {
            $('.errStr').text("");
         }
      });
   });
</script>

</head>
<body>
   <%@ include file="/WEB-INF/view/include/nav.jsp"%>
   <section class="checkout_area section_padding">
      <form:form modelAttribute="article" enctype="multipart/form-data" class="row contact_form">
         <div class="billing_details" style="margin: auto;">
            <div class="row">
               <div class="col-lg-12  form-group">
                  <div style="margin: auto;">
                     <div class="col-md-12 form-group p_star">
                        제목<br> <input name="articleTitle" class="form-control"
                           style="width: 300px;" /> <span class="errStr articleTitle"></span>
                     </div>
                  </div>
                  <div class="col-md-12 form-group p_star">
                     내용<br>
                     <form:textarea path="articleContent" id="summernote" class="form-control" rows="1" />
                  </div>
                  <span class="filebox">
                     <label class="filebox">썸네일 <form:input
                           type="file" path="multipartFile" />
                     </label>
                  	 <input class="upload-name" value="파일선택">
                  </span>
                  <span class="filebox">
                  <label class="filebox">등록<input type="submit">
                  </label>
                  </span>
               </div>
            </div>
         </div>
      </form:form>
   </section>
<%-- <%@ include file="/WEB-INF/view/include/footer.jsp"%> --%>

<div>
  	<hr noshade size="2">
    	<!-- <address style="font-size: 10px; text-align:center">&copy; My Home Interior Community</address> -->
	</div>
	<footer id="footer">
		<div class="inner">
			<ul class="actions">
				<li>(000) 000-0000</li>
				<li>information@untitled.tld</li>
				<li>123 Somewhere Road, Nashville, TN 00000</li>
			</ul>
		</div>
		<div class="copyright">
			&copy; My Home Interior Community
		</div>
	</footer>
	
	
<!-- jquery plugins here-->
<%--     <script src="${pageContext.request.contextPath}/js/jquery-1.12.1.min.js"></script> --%>
	<!-- popper js -->
	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- magnific popup js -->
	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js"></script>
	<!-- carousel js -->
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/contact.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.ajaxchimp.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/mail-script.js"></script>
	<!-- custom js -->
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>
</body>
</html>