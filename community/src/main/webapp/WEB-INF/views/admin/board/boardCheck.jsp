<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Starter</title>

<!-- AdminLTE v3.2.0 CDN -->
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">

<!-- css -->
<%@include file="/WEB-INF/views/admin/include/plugin2.jsp" %>

</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">

<!-- header -->
<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- sidebar -->
<%@include file="/WEB-INF/views/admin/include/sidebar.jsp" %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  
  
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Board Check</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin/main">Home</a></li>
              <li class="breadcrumb-item active">Board Check</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

<!-- Main -->
<form id="checkForm" method="get" action="boardList" class="contatiner p-5 my-5 border" enctype="multipart/form-data">
 
   <div class="content-body">
	<div class="form-group mb-3 mt-3 row">
	
			<!-- 페이징 및 검색정보(Criteria 클래스의 필드)? 원래상태의 리스트에서 필요한 정보 -->
			<input type="hidden" name="pageNum" value="${cri.pageNum }">
			<input type="hidden" name="amount" value="${cri.amount }">
			<input type="hidden" name="type" value="${cri.type }">
			<input type="hidden" name="keyword" value="${cri.keyword }">
					
		<label for="cat_name" class="col-sm-2 col-form-label">카테고리</label>
		<div class="col-sm-3">
		  <select name="cat_p" id="firstCategory" class="form-control" disabled>
  			<option>1차 카테고리 선택</option>
			<c:forEach items="${cateList }" var="categoryVO">
				<option value="${categoryVO.cat_c }" ${categoryVO.cat_c == boardVO.cat_p ? 'selected':'' }>${categoryVO.cat_name }</option>
			</c:forEach>
	  	  </select>
		</div>
		
		<div class="col-sm-3">
	  		<select name="cat_c" id="secondCategory" class="form-control" disabled>
	  			<option value="">2차 카테고리 선택</option>
	  			<c:forEach items="${subCateList }" var="subCategoryVO">
					<option value="${subCategoryVO.cat_c }" ${subCategoryVO.cat_c == boardVO.cat_c ? 'selected':'' }>${subCategoryVO.cat_name }</option>
				</c:forEach>
	  		</select>
	  	</div>
	</div>
	
	<div class="form-group mb-3 mt-3 row">
	    <label for="boa_title" class="col-sm-2 col-form-label">제목</label>
	    <div class="col-sm-4">
	    
	    <!-- 게시물 넘버를 숨겨서 넘겨줌 -->
      	<input type="hidden" id="boa_num" name="boa_num" value="${boardVO.boa_num }">
			      
	      <input type="text" class="form-control" id="boa_title" name="boa_title" value="${boardVO.boa_title }" readonly>
	    </div>
	</div>
	
	<div class="form-group mb-3 mt-3 row">
		<label for="boa_title" class="col-sm-2 col-form-label">작성자</label>
		<c:if test="${!empty boardVO.mem_name }">
		<div class="col-sm-4">
			<input type="text" class="form-control" value="${boardVO.mem_name }" readonly>
		</div>
		</c:if>
		<c:if test="${empty boardVO.mem_name }">
		<div class="col-sm-4">
			<input type="text" class="form-control" value="관리자" readonly>
		</div>
		</c:if>
	</div>
	
	<div class="form-group row">
	    <label for="boa_content" class="col-sm-2 col-form-label">내용</label>
	    <div class="col-sm-10">
	      <textarea class="form-control" row="3" id="boa_content" name="boa_content" readonly>${boardVO.boa_content }</textarea>
	    </div>
	</div>

 </div>
	
   <div class="content-footer">
	<div class="form-group">
		<ul class="uploadedList"></ul>
	</div>
	<div class="form-group row">
		<div class="col-sm-12 text-center">
			<button type="submit" class="btn btn-primary" id="btnRegister">돌아가기</button>
		</div>
	</div>
   </div>

	

</form>
    
    
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->

<!-- Main Footer -->
<%@include file="/WEB-INF/views/admin/include/footer.jsp" %>
  
</div>
<!-- ./wrapper -->

<!-- jQuery Bootstrap 4 AdminLTE App -->
<%@include file="/WEB-INF/views/admin/include/plugin1.jsp" %>
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

			let firstCategory = $(this).val();

			console.log("1차 카테 : " + firstCategory);

			let url = "/admin/board/subCategoryList/" + firstCategory;

			$.getJSON(url, function(subCategoryList){

				// console.log("첫번째 데이터 " + subCategoryList[0].cg_code_c);
				// console.log("첫번째 데이터 " + subCategoryList[0].cg_code_p);
				// console.log("첫번째 데이터 " + subCategoryList[0].cg_name);

				// 2차카테고리 태그를 참조
				let optionStr = "";
				let secondCategory = $("#secondCategory");

				secondCategory.find("option").remove(); // 기존 카테고리에 의해 출력되는 요소 제거
				secondCategory.append("<option value=''>2차 카테고리 선택</option>");

				for(let i=0; i<subCategoryList.length; i++){
					optionStr += "<option value='" + subCategoryList[i].cat_c + "'>" + subCategoryList[i].cat_name + "</option>";

				}
				secondCategory.append(optionStr);
			});
		});
		

		$("#checkForm").on("submit", function(){
			
			let boa_title = $("#boa_title");
			let boa_content = $("#boa_content");

			boa_title.remove();
			boa_content.remove();
		});

	});

</script>

</body>
</html>