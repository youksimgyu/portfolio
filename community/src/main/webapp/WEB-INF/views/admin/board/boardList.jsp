<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            <h1 class="m-0">Board List</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin/main">Home</a></li>
              <li class="breadcrumb-item active">Board List</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

<!-- Main -->
<div class="p-5 my-5 border row">
	<div class="col-md-12">
		<div class="box box-primary">
			
			<div class="content-body">
			
				<!-- 검색기능 -->
				<form id="searchForm" action="/admin/board/boardList" method="get">
					
					<!-- 카테고리 선택부분 -->
					<div class="form-group mb-3 mt-3 row">
					<div class="col-sm-3">
					  <select name="cat_p" id="firstCategory" class="form-control">
			  			<option>1차 카테고리 선택</option>
						<c:forEach items="${cateList }" var="categoryVO">
							<option value="${categoryVO.cat_c }">${categoryVO.cat_name }</option>
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
				<div class="col-sm-3">
				  <select name="type" class="form-control">
					  <option value="NC" <c:out value="${pageMaker.cri.type eq null ? 'selected' : '' }" />>전체</option>
					  <option value="N" <c:out value="${pageMaker.cri.type eq 'N' ? 'selected' : '' }" />>제목</option><!-- Title -->
					  <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }" />>내용</option><!-- Content -->
				  </select>
				</div>
			    <div class="col-sm-3">
				  <input type="text" name="keyword" value="${pageMaker.cri.keyword }" class="form-control">
				  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				  <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				</div>
			    <div class="col-sm-3">
				  <button type="button" id="btnSearch" class="btn btn-link">Search</button>
				</div>
				</div>
			  	</form>
			  
			  <table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">1차</th>
				      <th scope="col">2차</th>
				      <th scope="col">제목</th>
				      <th scope="col">작성자</th>
				      <th scope="col">업데이트 날짜</th>
				      <th scope="col">수정</th>
				      <th scope="col">삭제</th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach items="${boardList }" var="boardVO">
				    <!-- BoardVO클래스의 필드명으로 코딩했지만, 호출은 getter메서드가 사용됨. -->
				    <tr>
				      <th scope="row"><c:out value="${boardVO.boa_num }" /></th>
				      
				      <!-- 카테고리 값 넣어야 함 -->
				      <td scope="row" style="width: 250px;"><c:out value="${boardVO.cat_name }" /></td>
				      <td scope="row" style="width: 250px;"><c:out value="${boardVO.cat_name_c }" /></td>
				      
				      <td scope="row"><c:out value="${boardVO.adm_id }" /></td>
				      <td>
				      	<a class="move" href="#" data-boa_num="${boardVO.boa_num }"><c:out value="${boardVO.boa_title }" escapeXml="true" /></a>
				      </td>
				      <td><fmt:formatDate value="${boardVO.boa_date_up }" pattern="yyyy-MM-dd hh:mm" /></td>
				      <td><button type="button" name="btnBoardEdit" data-boa_num="${boardVO.boa_num }" class="btn btn-link">Edit</button></td>
				      <td><button type="button" name="btnBoardDelete" data-boa_num="${boardVO.boa_num }" class="btn btn-link">Delete</button></td>
				    </tr>
				    </c:forEach>
				    
				  </tbody>
				</table>
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
			</div>
			

			
		</div>
	</div>
</div>
    
    
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


<script>

	$(document).ready(function(){

		let actionForm = $("#actionForm");

		// 1) 상품수정 클릭시
		$("button[name='btnBoardEdit']").on("click", function(){
			// console.log("상품코드 : " $(this).data("pdt_num"));

			//상품코드를 자식으로 추가
			actionForm.append("<input type='hidden' name='boa_num' value='" + $(this).data("boa_num") + "'>");
			actionForm.attr("method", "get");
			actionForm.attr("action", "/admin/board/boardModify");
			actionForm.submit();

		});

		let searchForm = $("#searchForm");

		// 검색버튼 클릭시 pageNum 초기화
		$("#btnSearch").on("click", function(){

			searchForm.find("input[name='pageNum']").val();

		});

		// 2) 상품삭제 클릭시
		$("button[name='btnBoardDelete']").on("click", function(){
			
			if(!confirm($(this).data("boa_num") + " 번 상품을 삭제하겠습니까?")) return;

			//상품코드를 자식으로 추가
			actionForm.append("<input type='hidden' name='boa_num' value='" + $(this).data("boa_num") + "'>");

			actionForm.attr("method", "get");
			actionForm.attr("action", "/admin/board/boardDelete");
			actionForm.submit();
		});

		// 3) 페이지 번호 클릭
		$("ul.pagination li a.page-link").on("click", function(e){
			e.preventDefault(); // <a>태그의 링크기능 무력화
			
			let pageNum = $(this).attr("href");

			actionForm.find("input[name='pageNum']").val(pageNum);

			actionForm.attr("method", "get");
			actionForm.attr("action", "/admin/board/boardList");
			actionForm.submit();
		});


		$("a.move").on("click", function(e){
			e.preventDefault();

			//상품코드를 자식으로 추가
			actionForm.append("<input type='hidden' name='boa_num' value='" + $(this).data("boa_num") + "'>");
			actionForm.attr("method", "get");
			actionForm.attr("action", "/admin/board/boardCheck");
			actionForm.submit();


		});
		
		//1차 카테고리 선택
		$("#firstCategory").on("change", function(){

			let firstCategory = $(this).val();

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


	});
	
</script>

</body>
</html>