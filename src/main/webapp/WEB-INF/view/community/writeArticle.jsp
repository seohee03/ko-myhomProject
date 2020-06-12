<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<script type="text/javascript">
   $(function() {
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
<!-- include libraries(jQuery, bootstrap) -->
<link
   href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
   rel="stylesheet">
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
   src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
   href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
   rel="stylesheet">
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
   $(document).ready(function() {
      var fileTarget = $('#file');
      fileTarget.on('change', function() { // 값이 변경되면
         var cur = $(".filebox input[type='file']").val();
         $(".upload-name").val(cur);
      });
   });
</script>
<style>
.filebox input[type="file"] {
   position: absolute;
   width: 0;
   height: 0;
   padding: 0;
   overflow: hidden;
   border: 0;
}
.filebox input[type="submit"] {
   position: absolute;
   width: 0;
   height: 0;
   padding: 0;
   overflow: hidden;
   border: 0;
}

.filebox label {
   display: inline-block;
   padding: 10px 20px;
   color: #999;
   vertical-align: middle;
   background-color: #fdfdfd;
   cursor: pointer;
   border: 1px solid #ebebeb;
   border-radius: 5px;
}

/* named upload */
.filebox .upload-name {
   display: inline-block;
   height: 35px;
   font-size: 18px;
   padding: 0 10px;
   vertical-align: middle;
   background-color: #f5f5f5;
   border: 1px solid #ebebeb;
   border-radius: 5px;
}
</style>
<script type="text/javascript">
   $(document).ready(function() {
      $('#summernote').summernote();
   });
</script>
</head>
<body>
   <%@ include file="/WEB-INF/view/include/nav.jsp"%>
   <section class="checkout_area section_padding">
      <form:form modelAttribute="article" enctype="multipart/form-data"
         class="row contact_form">
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
                     <form:textarea path="articleContent" id="summernote"
                        class="form-control" rows="1" />
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
</body>
</html>