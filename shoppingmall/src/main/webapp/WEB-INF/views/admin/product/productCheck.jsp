<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Starter</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<!-- Admin LTE css. stylesheet 링크 -->
<%@include file="/WEB-INF/views/admin/include/plugin1.jsp"%>

</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

<!-- Header -->
<%@include file="/WEB-INF/views/admin/include/header.jsp"%>


<!-- nav -->
<%@include file="/WEB-INF/views/admin/include/nav.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Page Header <small>Optional description</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

<!-- Main content -->
<section class="content container-fluid">

<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
		
			<div class="box-header">
				PRODUCT
			</div>
			
			<form id="checkForm" action="productList" method="get" enctype="multipart/form-data">
			 <div class="box-body">
			
			  <div class="form-group row">

					<!-- 페이징 및 검색정보(Criteria 클래스의 필드)? 원래상태의 리스트에서 필요한 정보 -->
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
					<input type="hidden" name="type" value="${cri.type }">
					<input type="hidden" name="keyword" value="${cri.keyword }">

			  	<label for="cg_name" class="col-sm-2 col-form-label">카테고리</label>
			  	<div class="col-sm-3">
			  		<select name="cg_num_1" id="firstCategory" class="form-control" disabled>
			  			<option>1차 카테고리 선택</option>
						<c:forEach items="${cateList }" var="categoryVO">
							<option value="${categoryVO.cg_code_c }" ${categoryVO.cg_code_c == productVO.cg_num_1 ? 'selected':'' }>${categoryVO.cg_name }</option>
						</c:forEach>
			  		</select>
			  	</div>
			  	<div class="col-sm-3">
			  		<select name="cg_num_2" id="secondCategory" class="form-control" disabled>
			  			<option>2차 카테고리 선택</option>
						<c:forEach items="${subCateList }" var="subCategoryVO">
							<option value="${subCategoryVO.cg_code_c }" ${subCategoryVO.cg_code_c == productVO.cg_num_2 ? 'selected':'' }>${subCategoryVO.cg_name }</option>
						</c:forEach>
			  		</select>
			  	</div>
			  </div>
			  
			   <div class="form-group row">
			    <label for="pdt_name" class="col-sm-2 col-form-label">상품명</label>
			    <div class="col-sm-4">
			    
			      <!-- 게시물 넘버를 숨겨서 넘겨줌 -->
			      <input type="hidden" id="pdt_num" name="pdt_num" value="${productVO.pdt_num }">
			      
			      <input type="text" class="form-control" id="pdt_name" name="pdt_name" value="${productVO.pdt_name }" readonly>
			    </div>
			    <label for="pdt_price" class="col-sm-2 col-form-label">상품가격</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="pdt_price" name="pdt_price" value="${productVO.pdt_price }" readonly>
			    </div>
			  </div>

			  <div class="form-group row">
			    <label for="pdt_discount" class="col-sm-2 col-form-label">할인율</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="pdt_discount" name="pdt_discount" value="${productVO.pdt_discount }" readonly>
			    </div>
			    <label for="pdt_company" class="col-sm-2 col-form-label">제조사</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="pdt_company" name="pdt_company" value="${productVO.pdt_company }" readonly>
			    </div>
			  </div>
			  
			      <input type="hidden" class="form-control" id="uploadFile" name="uploadFile">
			      
			      <!-- 날짜폴더, 상품이미지 파일명 -->
			      <!-- 사진 변경하지 않으면 있던 자료 그대로 넘어감 -->
			      <input type="hidden" id="pdt_img_folder" name="pdt_img_folder" value="${productVO.pdt_img_folder }">
			      <input type="hidden" id="pdt_img" name="pdt_img" value="${productVO.pdt_img }">
			  
			  <div class="form-group row">
			    <label for="pdt_img" class="col-sm-2 col-form-label">현재이미지</label>
			    <div class="col-sm-4">
			      <img src="/admin/product/displayFile?folderName=${productVO.pdt_img_folder }&fileName=${productVO.pdt_img }" alt="" style="width: 80px;height: 80px;">
			    </div>
			  </div>
			  
			  <div class="form-group row">
			    <label for="pdt_detail" class="col-sm-2 col-form-label">상품설명</label>
			    <div class="col-sm-10">
			      <textarea class="form-control" row="3" id="pdt_detail" name="pdt_detail" readonly>${productVO.pdt_detail }</textarea>
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="pdt_amount" class="col-sm-2 col-form-label">수량</label>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" id="pdt_amount" name="pdt_amount" value="${productVO.pdt_amount }" readonly>
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="pdt_buy" class="col-sm-2 col-form-label">판매여부</label>
			    <div class="col-sm-4">
			      <select id="pdt_buy" name="pdt_buy" disabled>
			      	<option value="Y" ${productVO.pdt_buy == 'Y' ? 'selected':'' }>판매가능</option>
			      	<option value="N" ${productVO.pdt_buy == 'N' ? 'selected':'' }>판매불가능</option>
			      </select>
			    </div>
			  </div>
				
			</div>
			
			<div class="box-footer">
				<div class="form-group">
					<ul class="uploadedList"></ul>
				</div>
				<div class="form-group row">
					<div class="col-sm-12 text-center">
						<button type="submit" class="btn btn-dark" id="btnProduct">돌아가기</button>
						<button type="button" name="btnProductEdit" data-pdt_num="${productVO.pdt_num }" class="btn btn-link">Edit</button>
					
						<input type="hidden" name="pdt_img" value="${productVO.pdt_img }">
						<input type="hidden" name="pdt_img_folder" value="${productVO.pdt_img_folder }">
						<button type="button" name="btnProductDelete" data-pdt_num="${productVO.pdt_num }" class="btn btn-link">Delete</button>
					</div>
				</div>
			</div>
		  </form>
			
				<!--페이지 번호 클릭시 list주소로 보낼 파라미터 작업-->
				<form id="actionForm" action="/board/list" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<input type="hidden" name="type" value="${pageMaker.cri.type}">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				</form>
					
		</div>
	</div>
</div>
	

</section>
<!-- /.content -->


</div>
<!-- /.content-wrapper -->


<!-- Footer -->
<%@include file="/WEB-INF/views/admin/include/footer.jsp"%>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
	<!-- Create the tabs -->
	<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
		<li class="active"><a href="#control-sidebar-home-tab"
			data-toggle="tab"><i class="fa fa-home"></i></a></li>
		<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
				class="fa fa-gears"></i></a></li>
	</ul>
	<!-- Tab panes -->
	<div class="tab-content">
		<!-- Home tab content -->
		<div class="tab-pane active" id="control-sidebar-home-tab">
			<h3 class="control-sidebar-heading">Recent Activity</h3>
			<ul class="control-sidebar-menu">
				<li><a href="javascript:;"> <i
						class="menu-icon fa fa-birthday-cake bg-red"></i>

						<div class="menu-info">
							<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

							<p>Will be 23 on April 24th</p>
						</div>
				</a></li>
			</ul>
			<!-- /.control-sidebar-menu -->

			<h3 class="control-sidebar-heading">Tasks Progress</h3>
			<ul class="control-sidebar-menu">
				<li><a href="javascript:;">
						<h4 class="control-sidebar-subheading">
							Custom Template Design <span class="pull-right-container">
								<span class="label label-danger pull-right">70%</span>
							</span>
						</h4>

						<div class="progress progress-xxs">
							<div class="progress-bar progress-bar-danger"
								style="width: 70%"></div>
						</div>
				</a></li>
			</ul>
			<!-- /.control-sidebar-menu -->

		</div>
		<!-- /.tab-pane -->
		<!-- Stats tab content -->
		<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
			Content</div>
		<!-- /.tab-pane -->
		<!-- Settings tab content -->
		<div class="tab-pane" id="control-sidebar-settings-tab">
			<form method="post">
				<h3 class="control-sidebar-heading">General Settings</h3>

				<div class="form-group">
					<label class="control-sidebar-subheading"> Report panel
						usage <input type="checkbox" class="pull-right" checked>
					</label>

					<p>Some information about this general settings option</p>
				</div>
				<!-- /.form-group -->
			</form>
		</div>
		<!-- /.tab-pane -->
	</div>
</aside>
<!-- /.control-sidebar -->

<!-- Add the sidebar's background. This div must be placed
immediately after the control sidebar -->
	<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3, Bootstrap 3.3.7, AdminLTE App -->
<%@include file="/WEB-INF/views/admin/include/plugin2.jsp"%>

<script type="text/javascript" src="/resources/bower_components/ckeditor/ckeditor.js"></script>
<script>

	$(document).ready(function(){

		// ckeditor 환경설정
		var ckeditor_config = {
			resize_enabled : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			toolbarCanCollapse : true,
			removePlugins : "elementspath",
			filebrowserUploadUrl: '/admin/product/imageUpload' //업로드 탭기능추가 속성. post 주소로 사용됨
		}

		CKEDITOR.replace("pdt_detail", ckeditor_config);

		
		//1차 카테고리 선택
		$("#firstCategory").on("change", function(){

			let firstCategory = $(this).val();

			console.log("1차 카테 : " + firstCategory);

			let url = "/admin/product/subCategoryList/" + firstCategory;

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
					optionStr += "<option value='" + subCategoryList[i].cg_code_c + "'>" + subCategoryList[i].cg_name + "</option>";

				}
				secondCategory.append(optionStr);
			});
		});


		// 이미지 미리보기
		$("#uploadFile").on("change", function(e){

			let file = e.target.files[0];

			let reader = new FileReader();
			reader.onload = function(e){
				$("#change_img").attr("src", e.target.result);
			}

			reader.readAsDataURL(file);
		});
		
		// 1) 상품수정 클릭시
		$("button[name='btnProductEdit']").on("click", function(){
			// console.log("상품코드 : " $(this).data("pdt_num"));

			//상품코드를 자식으로 추가
			actionForm.append("<input type='hidden' name='pdt_num' value='" + $(this).data("pdt_num") + "'>");
			actionForm.attr("method", "get");
			actionForm.attr("action", "/admin/product/productModify");
			actionForm.submit();

		});


		// 2) 상품삭제 클릭시
		$("button[name='btnProductDelete']").on("click", function(){
			
			if(!confirm($(this).data("pdt_num") + " 번 상품을 삭제하겠습니까?")) return;

			//상품코드를 자식으로 추가
			actionForm.append("<input type='hidden' name='pdt_num' value='" + $(this).data("pdt_num") + "'>");
			
			//날짜폴더 추가
			let pdt_img_folder = $(this).parent().children("input[name='pdt_img_folder']").val();
			actionForm.append("<input type='hidden' name='pdt_img_folder' value='" + pdt_img_folder + "'>");
			
			//파일이름 추가
			let pdt_img = $(this).parent().children("input[name='pdt_img']").val();
			actionForm.append("<input type='hidden' name='pdt_img' value='" + pdt_img + "'>");

			actionForm.attr("method", "get");
			actionForm.attr("action", "/admin/product/productDelete");
			actionForm.submit();
		});
	});

</script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
    Both of these plugins are recommended to enhance the
    user experience. -->
    
</body>
</html>
