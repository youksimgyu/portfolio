<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.98.0">
    <title>Blog Template · Bootstrap v5.2</title>

<!-- blog css -->
<%@include file="/WEB-INF/views/include/blog_plugin.jsp" %>

<!-- bootstrap 5.2 -->
<%@include file="/WEB-INF/views/include/plugin1.jsp" %>


    <script>
    	if('${msg}' == 'logout'){
    		alert("로그아웃 되었습니다.");
    	}
    </script>
    
  </head>
  <body>

<!-- header -->
<%@include file="/WEB-INF/views/include/header.jsp" %>

<!-- nav -->
<%@include file="/WEB-INF/views/include/nav.jsp" %>



<main class="container">



<div class="p-5 my-5 border row">

	<div class="col-md-12">
		<div class="box box-primary">

<form id="adBoardForm" method="post" action="boardInsert" class="contatiner p-5 my-5 border" enctype="multipart/form-data">
	<!-- 세션에서 받은 아이디 숨기기 -->
 	<input type="hidden" name="mem_id" value="${mem_id }">
 	
   <div class="content-body">
	<div class="form-group mb-3 mt-3 row">
		<label for="cat_name" class="col-sm-2 col-form-label">카테고리</label>
		<div class="col-sm-3">
		  <select name="cat_p" id="firstCategory" class="form-control">
  			<option>1차 카테고리 선택</option>
			<c:forEach items="${cateList }" var="categoryVO">
				<option value="${categoryVO.cat_c }" id="cat_name">${categoryVO.cat_name }</option>
			<c:set var="cat_name" value=""></c:set>
			</c:forEach>
	  	  </select>
	  	  
 	  	<input type="hidden" id="cat_name" name="cat_name">
	  	<input type="hidden" id="cat_name_c" name="cat_name_c">
	  	  
		</div>
		
		<div class="col-sm-3">
	  		<select name="cat_c" id="secondCategory" class="form-control">
	  			<option value="">2차 카테고리 선택</option>
	  		</select>
	  	</div>
	</div>
	
	<div class="form-group mb-3 mt-3 row">
	    <label for="boa_title" class="col-sm-2 col-form-label">제목</label>
	    <div class="col-sm-4">
	      <input type="text" class="form-control" id="boa_title" name="boa_title">
	    </div>
	</div>
	
	<div class="form-group row">
	    <label for="boa_content" class="col-sm-2 col-form-label">내용</label>
	    <div class="col-sm-10">
	      <textarea class="form-control" row="3" id="boa_content" name="boa_content"></textarea>
	    </div>
	</div>

 </div>
	
   <div class="content-footer">
	<div class="form-group">
		<ul class="uploadedList"></ul>
	</div>
	<div class="form-group row">
		<div class="col-sm-12 text-center">
			<button type="submit" class="btn btn-primary" id="btnRegister">등록</button>
		</div>
	</div>
   </div>

	

</form>
			
				
			
		</div>
	</div>
</div>

			<nav aria-label="...">
				  <ul class="pagination">
				    <!-- 이전표시 -->
				    <c:if test="${pageMaker.prev }">
					    <li class="page-item">
					      <a class="page-link" href="${pageMaker.startPage - 1 }">Previous</a>
					    </li>
				    </c:if>
				    
				    <!-- 페이지번호 표시.  1  2  3  4  5 -->
				    
				    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num" >
				    	<li class='page-item ${pageMaker.cri.pageNum == num ? "active": "" }'><a class="page-link" href="${num}">${num}</a></li>
				    </c:forEach>
				    <!-- 
				    <li class="page-item active" aria-current="page">
				      <span class="page-link">2</span>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				     -->
				    <!-- 다음표시 -->
				    <c:if test="${pageMaker.next }">
					    <li class="page-item">
					      <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
					    </li>
				    </c:if>
					
				  </ul>
				  
				  	<!--페이지 번호 클릭시 list주소로 보낼 파라미터 작업-->
					<form id="actionForm" action="/board/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">				
					</form>
					
				</nav>


</main>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<script>

	$(document).ready(function(){

		// ckeditor 환경설정
		var ckeditor_config = {
			resize_enabled : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			toolbarCanCollapse : true,
			removePlugins : "elementspath",
			filebrowserUploadUrl: '/admin/board/imageUpload' //업로드 탭기능추가 속성. post 주소로 사용됨
		}

		CKEDITOR.replace("boa_content", ckeditor_config);
		
		
		//1차 카테고리 선택
		$("#firstCategory").on("change", function(){

			// 1차 카테고리 이름 작업
			let cat_name = $("#firstCategory option:selected").text();
			// console.log("cat_name : " + cat_name);
			$("input[name='cat_name']").val(cat_name);
			
			let firstCategory = $(this).val();

			let url = "/user/board/subCategoryList/" + firstCategory;

			$.getJSON(url, function(subCategoryList){

				// console.log("첫번째 데이터 " + subCategoryList[0].cg_code_c);
				// console.log("첫번째 데이터 " + subCategoryList[0].cg_code_p);
				// console.log("첫번째 데이터 " + subCategoryList[0].cg_name);

				// 2차카테고리 태그를 참조
				let optionStr = "";
				let secondCategory = $("#secondCategory");

				secondCategory.find("option").remove(); // 기존 카테고리에 의해 출력되는 요소 제거
				secondCategory.append("<option>2차 카테고리 선택</option>");

				for(let i=0; i<subCategoryList.length; i++){
					optionStr += "<option value='" + subCategoryList[i].cat_c + "'>" + subCategoryList[i].cat_name + "</option>";

				}
				secondCategory.append(optionStr);
				
			});


		});
		
		$("#secondCategory").on("change", function(){
			
			// 2차 카테고리 이름 작업
			let cat_name_c = $("#secondCategory option:selected").text();
			// console.log("cat_name_c : " + cat_name_c);
			$("input[name='cat_name_c']").val(cat_name_c);
			
			
		});
		
	});

</script>
    
  

</body></html>