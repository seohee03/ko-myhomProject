<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>

<script type="text/javascript">
/* $(function(){
	 $('#searchForm').submit(function(){	
		var keyword = $('#keyword').val().trim();
		console.log(keyword);
		if(keyword.length == ''){
			$('#keyword').focus();
			return false;
		}else{
			return true;
		}
	}); 
}); */
</script>

</head>
<body>

<%@ include file="/WEB-INF/view/include/nav.jsp"%>

	<div class="gnbList">
		<ul class="clearfix">
			<li class="on">
				<a href="${pageContext.request.contextPath }/store/category?type=1">
					<div class="imgArea"><img alt="" src="${pageContext.request.contextPath }/images/categorie01.jpg"></div>
					<div class="txt">가구</div>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/store/category?type=2">
					<div class="imgArea"><img alt="" src="${pageContext.request.contextPath }/images/categorie07.jpg"></div>
					<div class="txt">침구</div>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/store/category?type=3">
					<div class="imgArea"><img alt="" src="${pageContext.request.contextPath }/images/categorie02.jpg"></div>
					<div class="txt">패브릭</div>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/store/category?type=4">
					<div class="imgArea"><img alt="" src="${pageContext.request.contextPath }/images/categorie03.jpg"></div>
					<div class="txt">홈데코</div>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/store/category?type=5">
					<div class="imgArea"><img alt="" src="${pageContext.request.contextPath }/images/categorie04.jpg"></div>
					<div class="txt">가전</div>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/store/category?type=6">
					<div class="imgArea"><img alt="" src="${pageContext.request.contextPath }/images/categorie05.jpg"></div>
					<div class="txt">생활용품</div>
				</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath }/store/category?type=7">
					<div class="imgArea"><img alt="" src="${pageContext.request.contextPath }/images/categorie06.jpg"></div>
					<div class="txt">주방</div>
				</a>
			</li>
		</ul>
	</div>
<div class="container">
	
<!-- 	<form action="searchItem" method="get" id="searchForm">
		<input type="text" placeholder="검색" name="keyword" value="" id="keyword">
		<input type="button" value="검색" id="searchBtn">
	</form> -->
	
	<c:set var="path" value="${pageContext.request.contextPath }" />
	
	<div class="pdList">
		<ul class="clearfix">
		<c:forEach var="itemC" items="${itemPage.content}">
			<li onclick="javascript:moveItemViewPage('${path }','${itemC.item.itemNo} ','${path }${itemC.itemImg.thumbUrl}'); return false;">
				
				<a>
				<div class="imgArea">
					<img alt="" src="${path }${itemC.itemImg.thumbUrl}">
				</div>
				<div class="infoArea">
				 	<p class="brand"><c:out value="${itemC.categorie.categorieName}" /></p>
				 	<p class="ttl"><c:out value="${itemC.item.itemName}" /></p>
				 	<p class="pdSum"><c:out value="${itemC.item.price}" />원</p>
				</div>
				</a>
				
			</li>
			</c:forEach>
			<c:forEach var="itemC" items="${itemCommandList}">
			<li onclick="javascript:moveItemViewPage('${path }','${itemC.item.itemNo} ','${path }${itemC.itemImg.thumbUrl}'); return false;">
				
				<a>
				<div class="imgArea">
					<img alt="" src="${path }${itemC.itemImg.thumbUrl}">
				</div>
				<div class="infoArea">
				 	<p class="brand"><c:out value="${itemC.categorie.categorieName}" /></p>
				 	<p class="ttl"><c:out value="${itemC.item.itemName}" /></p>
				 	<p class="pdSum"><c:out value="${itemC.item.price}" />원</p>
				</div>
				</a>
				
			</li>
			</c:forEach>
		</ul>
	</div>
	
	<%-- <table border="1">
		<thead>
			<tr>
				<th>이미지</th>
				<th>번호</th>
				<th>카테고리</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
				<th>옵션1</th>
				<th>옵션2</th>
				<th>이미지 경로</th>
				<th>등록일</th>
			</tr>
		</thead>
		<c:if test="${itemPage.hasNoItems()}">
			<tr>
				<td colspan="11">등록된 상품이 없습니다.</td>
			</tr>
		</c:if>
		<tbody>
			<c:set var="path" value="${pageContext.request.contextPath }" />
			<input type="hidden" id="path" value="${pageContext.request.contextPath }">
			<c:forEach var="itemC" items="${itemPage.content}">
				<tr onclick="javascript:moveItemViewPage('${path }','${itemC.item.itemNo} ','${path }${itemC.itemImg.thumbUrl}'); return false;">
				<tr onclick="javascript:itemDetailBtn('${path }','${itemC.item.itemNo}','${itemC.itemImg.thumbUrl}');">
					<td><img src="${path }${itemC.itemImg.thumbUrl}"
						style="width: 50px"></td>
					<td><c:out value="${itemC.item.itemNo}" /></td>
					<td><c:out value="${itemC.categorie.categorieName}" /></td>
					<td><c:out value="${itemC.item.itemCode}" /></td>
					<td><c:out value="${itemC.item.itemName}" /></td>
					<td><c:out value="${itemC.item.price}" /></td>
					<td><c:out value="${itemC.item.stock}" /></td>
					<td><c:out value="${itemC.option1.option1Name}" /></td>
					<td><c:out value="${itemC.option2.option2Name}" /></td>
					<td><c:out value="${itemC.itemImg.thumbUrl}" /></td>
					<td><tf:formatDateTime value="${itemC.item.itemRegDateTime }"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table> --%>
	<c:if test="${itemPage.hasItems()}">
				<tr>
					<td colspan="11"><c:if test="${itemPage.startPage > 5}">
							<a href="<c:url value="/store/${itemPage.startPage - 5}" />">[이전]</a>
						</c:if> <c:forEach var="pNo" begin="${itemPage.startPage}"
							end="${itemPage.endPage}">
							<a href="<c:url value="/store/${pNo}" />">[${pNo}]</a>
						</c:forEach> <c:if test="${itemPage.endPage < itemPage.totalPages}">
							<a href="<c:url value="/store/${itemPage.startPage + 5}" />">[다음]</a>
						</c:if></td>
				</tr>
			</c:if>
	
	<div id="latelyViewItemListPageing_div" class="recentArea">
			<button class="topBtn">TOP</button>
		<ul id="latelyViewItemList_ul">
		</ul>
		<!-- <strong id="nowLatelyViewItemPage_strong"></strong>
		<span id="totalLatelyViewItemPage_span"></span> -->
	</div>
</div>

	<script type="text/javascript">
	
	//최근본 아이템 삭제 기간
	var LATELY_VIEW_ITEM_EXPIRATION_DATE = 1;
	//최근본 아이템 최대 저장 개수
	var LATELY_VIEW_ITEM_MAX_SAVE_COUNT = 20;
	//최근본 아이템 페이징 사이즈
	var LATELY_VIEW_ITEM_PAGEING_SIZE = 5;
	
	//필요한 함수

	//@param obj
	//@returns
	function isNull(obj){
	 if(obj == '' || obj == null || obj == undefined || obj == NaN){ 
	  return true;
	 }else{
	  return false;
	 }
	}
	
	// 로컬스토리지 저장
	// @param name
	// @param obj
	// @returns
	function setLocalStorage(name,obj){
	 localStorage.setItem(name, obj);
	}

	//로컬 스토리지 삭제
	//@param name
	//@returns
	function removeLocalStorage(name){
	 localStorage.removeItem(name);
	}

	//로컬스토리지에서 특정 객체 가져오기
	//@param name
	//@returns
	function getItemLocalStorage(name){
	 return localStorage.getItem(name);
	}
	
	//1.모든 페이지에서 수행되야 하므로 common.js document.ready() 함수내에 정의한다.
	$(document).ready(function(){
	 
		initLatelyViewItemList();
	});	 
	//2.initLatelyViewItemList() 함수를 정의한다. 
	
	//최근 본 상품 관련 로컬 스토리지 공간 확보 일정 시간 지난 것 뺴고 재저장 페이지별 무조건 호출
	//@returns
	function initLatelyViewItemList(){
		//로컬스토리지에서 latelyViewItemList 로 저장된 정보가 있는지 확인후
		if(isNull(getItemLocalStorage('latelyViewItemList'))){
			//없을경우 공간 생성
			setLocalStorage('latelyViewItemList',null);
			//상품을 표시할 ul에 없을경우 화면 표시
			$("ul#latelyViewItemList_ul").append('<li>찾아본<br>상품이<br>없습니다.</li>');
			//기존 정보가 있을 경우
		}else{
			//저장된 정보를 가져오고
			var latelyViewItemListJson = getItemLocalStorage('latelyViewItemList');
			//실제 저장된 데이터가 있는경우 
			if(latelyViewItemListJson != "null" || isNull(latelyViewItemListJson)){
			
				var nowDate = new Date();
				//문자열을 javascript 객체로 변환
				var latelyViewItemList = JSON.parse(latelyViewItemListJson);
				
				//일정시간 경과된 아이템을 제외하고 다시 넣기 위한 새로운 Array
				var latelyViewItemListNew = new Array();
				    
				//상품 리스트를 돌면서 상품별 저장된 시간이 현재 시간보다 클경우만 다시 latelyViewItemListNew  에 추가
				for(var i in latelyViewItemList){
					var viewTime = new Date(latelyViewItemList[i].viewTime);
					//시간이 경과된경우 를 제외하고 재 저장
					if(nowDate.getTime() < viewTime.getTime()){
						latelyViewItemListNew.push(latelyViewItemList[i]);
					}
				}
				
				//시간이 모두 경과된 경우 담긴 새로운 배열요소가 없으므로 로컬 스토리지를 비워줌.
				if(latelyViewItemListNew.length == 0){
					setLocalStorage('latelyViewItemList',null);
					//재저장
				}else{
					setLocalStorage('latelyViewItemList',JSON.stringify(latelyViewItemListNew));
				}
			 
			}
			//화면 을 그리는 함수호출
			LatelyViewItemRender(1);
		}
	}
	
	//3.상품을 보기시 호출될 moveItemViewPage() 정의
	//화면단에 아래체럼 상품링크를 구성한다.
	//<a href="#" onclick="javascript:moveItemViewPage('상품번호 ','상품이미지경로'); return false;">
	
	//로컬 스토리지 저장 후 아이템 상세보기 페이지 이동
	//@param itemSeq
	//@returns
	function moveItemViewPage(path, itemSeq,itemImagePath){
	
		var latelyViewItemListJson = getItemLocalStorage('latelyViewItemList');
		var viewTime = new Date();
		//최근 본 상품이 아얘 없을경우 무조건 저장
		if(latelyViewItemListJson == "null" || isNull(latelyViewItemListJson)){
			
			//새로 저장될 
			var latelyViewItemListNew = new Array();
			 
			var latelyViewItem = {
				"itemNo" : itemSeq,
				"thumbUrl" : itemImagePath,
				"viewTime" :viewTime.setDate(viewTime.getDate() + Number(LATELY_VIEW_ITEM_EXPIRATION_DATE))
			}
			 
			latelyViewItemListNew.unshift(latelyViewItem);
			setLocalStorage('latelyViewItemList',JSON.stringify(latelyViewItemListNew));
			//있을경우 
		}else{
			var latelyViewItemList = JSON.parse(latelyViewItemListJson);
			var isExistsItem = false;
			 
			
			breakPoint : for(var i in latelyViewItemList){
				if(Number(latelyViewItemList[i].itemSeq) == Number(itemSeq)){
					isExistsItem = true; 
					break breakPoint;
				}
			}
			 
			//새로본 상품일경우만 저장
			if(!isExistsItem){
				 
				//최대 50개 일경우 마지막꺼 삭제 후제일 앞에 저장
				if(latelyViewItemList.length == Number(LATELY_VIEW_ITEM_MAX_SAVE_COUNT)) latelyViewItemList.pop();
				 
				var latelyViewItem = {
					"itemNo" : itemSeq,
					"thumbUrl" : itemImagePath,
					"viewTime" :viewTime.setDate(viewTime.getDate() + Number(LATELY_VIEW_ITEM_EXPIRATION_DATE))
				}
				latelyViewItemList.unshift(latelyViewItem);
				setLocalStorage('latelyViewItemList',JSON.stringify(latelyViewItemList));
			}
		}
	
		//상품페이지로 이동
		// location.href="/item/itemView.do?item_seq=" + itemSeq;
		location.href = path + "/itemDetail?itemNo=" + itemSeq;
	}
	
	//4.LatelyViewItemRender() 함수를 정의한다. 
	//(html 선택자는 각각 다를수 있으므로 참조만 하자.)
	
	// 최근 본 상품 화면 셋팅(페이징)
	// @param list
	// @returns
	function LatelyViewItemRender(page){
		var path = $('#path').val();
		//기본적으로 일단 상품리스트를 비움
		$("ul#latelyViewItemList_ul").empty();
		
		//로컬스토리지에서 latelyViewItemList 값 확인
		if(getItemLocalStorage('latelyViewItemList') != "null" || isNull(getItemLocalStorage('latelyViewItemList'))){
			 
			var latelyViewItemList = JSON.parse(getItemLocalStorage('latelyViewItemList'));
			
			//페이징을 해야하기때문에 전체 개수가 필요함
			var length = latelyViewItemList.length;
			              
			//최대 나올수 있는 페이지를 셋팅.
			var maxPage = length / LATELY_VIEW_ITEM_PAGEING_SIZE;
			
			//페이징 처리부분 레이어 노출시킴
			$("div#latelyViewItemListPageing_div").css("display","block");
			              
			//함수호출시 전달받은 페이지 값으로 현재페이지 셋팅.
			$("strong#nowLatelyViewItemPage_strong").text(page);
			
			//최대 페이지 개수 셋팅
			$("span#totalLatelyViewItemPage_span").text(Math.ceil(maxPage))
			 
			
			//가져온 최근본상품리스트에서 노출해야할 인덱스을 구해서 노출
			for(var i = ((page-1) * LATELY_VIEW_ITEM_PAGEING_SIZE); i < (page*LATELY_VIEW_ITEM_PAGEING_SIZE); i++){
			                     
				if(!isNull(latelyViewItemList[i])){
				                            //상품 그리는 부분
					$("ul#latelyViewItemList_ul").append($("<li>").append($("<a>")
					.attr("href","${pageContext.request.contextPath }/itemDetail?itemNo="+latelyViewItemList[i].itemNo)
					.append($("<img>").attr("src",latelyViewItemList[i].thumbUrl)
					.attr("alt","최근본상품"))));
				}
			}
		
		}else{
			//상품이 없을경우
			$("ul#latelyViewItemList_ul").append('<li>찾아본<br>상품이<br>없습니다.</li>');
			$("div#latelyViewItemListPageing_div").css("display","none");
		}
	
	}
	
	//최근 본 상품 페이지 버튼 클릭
	//@param type
	//@returns
	function latelyViewItemPageingPlusMinus(type){
	
		if(type == "minus"){
			if(Number($("strong#nowLatelyViewItemPage_strong").text()) > 1){
				$("strong#nowLatelyViewItemPage_strong").text(Number($("strong#nowLatelyViewItemPage_strong").text()) - 1);
				LatelyViewItemRender($("strong#nowLatelyViewItemPage_strong").text());
			}
			 
		}else{
			if(Number($("strong#nowLatelyViewItemPage_strong").text()) < Number($("span#totalLatelyViewItemPage_span").text())){
				$("strong#nowLatelyViewItemPage_strong").text(Number($("strong#nowLatelyViewItemPage_strong").text()) + 1);
				LatelyViewItemRender($("strong#nowLatelyViewItemPage_strong").text());
			}
		}
	}

</script>
	
<%@ include file="/WEB-INF/view/include/footer.jsp"%>

</body>
</html>