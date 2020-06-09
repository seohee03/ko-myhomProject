<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>

<script type="text/javascript">
   $(function() {
      
      $('#modifyBtn').click(function() {
         var result = confirm('수정하시겠습니까?');
         if (result) {
            //액션 경로 지정
            $("#frm").attr("action", "${pageContext.request.contextPath}/community/modifyDo");
            $("#frm").submit();
         } else {
            return;
         }
      });

      $('#deleteBtn').click(function() {
         var result = confirm('삭제하시겠습니까?');
         if (result) {
            //액션 경로 지정
            $("#frm").attr("action", "${pageContext.request.contextPath}/community/delArticle");
            $("#frm").submit();
         } else {
            return;
         }
      });
      
   });
   
   
   
   /* $(document).ready(function(){
       
   }); */

   </script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/nav.jsp"%>
<section id="features" style="width: 60%; margin: auto;">
   <div class="container">

         <table border="1">
            <thead>
               <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>내용</th>
                  <th>작성자</th>
                  <th>게시일</th>
                  <th>조회수</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <c:set var="article" value="${article}" />
                  <td><c:out value="${article.articleNo}" /></td>
                  <td><c:out value="${article.articleTitle}" /></td>
                  <td>${article.articleContent}</td>
                  <td><c:out value="${article.writerId}" /></td>
                  <td><c:out value="${article.regdate}" /></td>
                  <td><c:out value="${article.readCount}" /></td>
               </tr>
            </tbody>
         </table>
         <a href="<c:url value="/community/writeDo" />">[글쓰기]</a>

            <c:if test="${authInfo.memberId == article.writerId}">
               <a href="<c:url value='/community/modifyDo/${article.articleNo}'/>">[수정]</a>
               <a href="<c:url value='#'/>" id="deleteBtn">[삭제]</a>
            </c:if>

   </div>
   <form id="commentForm">
      글내용 : <input type="text" name="commentContent" placeholder="댓글을 입력해주세요" id="commentBox">
      <input type="hidden" name= "articleNo" value="${article.articleNo}">
      <input type="button" name="commentInsertBtn" onclick="commmentInsertBtn();" value="등록">
   </form>
   <br><br><hr>
   <h4>Comments</h4>
            <c:forEach var="comment" items="${commentList}">
            <div><c:out value="${comment.commentContent}" />
            <div><p><c:out value="${comment.memberNo}" />  <c:out value="${comment.regdate}" /></p></div>
            
            <c:if test="${authInfo.memberNo == comment.memberNo}">
            <div class="commentList${comment.commentNo}"><input type="button" id="commentModifyBtn" onclick="commentModifyBtn('${comment.commentNo}', '${comment.commentContent}')" value="수정">
            <input type="button" id="commentDeleteBtn" onclick="commentDeleteBtn('${comment.commentNo}')" value="삭제"></div>
            </c:if>
            </div><br><hr>
         </c:forEach>

</section>
<script type="text/javascript">
function commmentInsertBtn(){
   var commentBox = $('#commentBox').val().trim();
   if(commentBox == ''){
      $('#commentBox').focus();
      return false;
   }else{
      $.ajax({
         url : "${pageContext.request.contextPath}/community/insertComment",
         type : "post",
         dataType : "json",
         data : $('#commentForm').serialize(),
         success : function(data){
            if(data == 0){
               //alert('등록 성공');
               location.reload();
            } else if(data == 9) {
               alert('등록 실패');
            }
         }
      });
   }
}

function commentModifyBtn(commentNo, commentContent){
   /* var commentNo = "${comment.commentNo}"; */
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="contentText" name="content_'+commentNo+'" value="'+commentContent+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+commentNo+');">완료</button> </span>';
    a += '</div></td>';
    
    $('.commentList'+commentNo).html(a);
}

function commentUpdateProc(commentNo){
    var updateContent = $('[name=content_'+commentNo+']').val();
    var articleNo = "${comment.articleNo}"
    $.ajax({
        url : '${pageContext.request.contextPath}/community/commentUpdate',
        type : 'post',
        dataType : "json",
        data : {'commentContent' : updateContent, 'commentNo' : commentNo},
        success : function(data){
            if(data == 0) {
               alert("수정완료");
               location.reload();
            }else if(data == 9){
               alert("수정실패");
               $('.contentText').focus();
            }
        }
    });
}

function commentDeleteBtn(commentNo){
    var articleNo = "${comment.articleNo}"
   $.ajax({
      url : '${pageContext.request.contextPath}/community/commentDelete/'+ commentNo,
      type : 'post',
      dataType : "json",
      success : function(data){
         confirm('삭제하시겠습니까?');
         if(data == 0){
            alert("삭제성공")
            location.reload();
         } else if(data == 9){
            alert("삭제실패")
         }
      }   
   });
}

</script>

<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>