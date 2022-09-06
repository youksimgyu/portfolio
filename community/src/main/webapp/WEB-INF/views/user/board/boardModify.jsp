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

<form id="boardModify" method="post" action="boardModify" class="contatiner p-5 my-5 border" enctype="multipart/form-data">
	<!-- 세션에서 받은 아이디 숨기기 -->
 	<input type="hidden" name="mem_id" value="${mem_id }">

<div class="p-5 my-5 border row">

	<div class="col-md-12">
		<div class="box box-primary">
			<h2 style="display: inline; margin-right: 30px;">${boardGet.cat_name }</h2><span>${boardGet.cat_name_c }</span>
			<input type="hidden" name="boa_num" value="${boardGet.boa_num }">
			<div class="row" style="margin-top: 20px; margin-bottom: 20px; padding: 11px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; background: #fcfcfc; line-height: 1.5em;">
				<div class="col-10">
				 	<input value="${boardGet.boa_title }" type="text" class="form-control" name="boa_title" id="boa_title">
				</div>
				<div class="col-2">
				 	<span><fmt:formatDate value="${boardGet.boa_date_up }" pattern="yyyy.MM.dd hh:mm" /></span>
				</div>
			</div>
			<div class="row" style="margin-top: 20px; margin-bottom: 20px; padding: 11px; padding-bottom: 25px; border-bottom: 1px solid #ccc; line-height: 1.5em;">
				<c:if test="${!empty boardGet.mem_name }">
				<div class="col">
					<span>${boardGet.mem_name }</span>
				</div>
				</c:if>
				<c:if test="${empty boardGet.mem_name }">
				<div class="col">
					<span>관리자</span>
				</div>
				</c:if>
				<div class="col-2">
					<span>조회수 ${boardGet.boa_hit }</span>
				</div>
				<div class="col-1">
					<span>추천수 ${rec_get.rec_up }</span>
				</div>
				<div class="col-1">
					<span>댓글 ${boardGet.boa_rep_num }</span>
				</div>
			</div>
			<div class="content-body">
			  <div class="row">
				<div class="col">
					<textarea row="3" id="boa_content" name="boa_content">${boardGet.boa_content }</textarea>
				</div>
			  </div>
			</div>
			<div class="content-footer" style="text-align: center;">
				<button type="submit" name="btnModify" id="btnModify" class="btn btn-primary"
						style="margin-top: 20px;">수정</button>
			</div>
			

		</div>
	</div>
</div>
</form>
		  
			<!--페이지 번호 클릭시 list주소로 보낼 파라미터 작업-->
			<form id="actionForm" action="/board/list" method="get">
			</form>
					



</main>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<script>

	let actionForm = $("#actionForm");

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

	$("button[name='btn_boa_up_down']").on("click", function(){

		if(${sessionScope.loginStatus == null }){
			alert("로그인 해주세요");
		}
		let type = $(this).data("type");
		let boa_num = $("input[name='boa_num']").val();
		let btn_boa_up_down = $(this);

		// 자바스크립트 Object객체 구문
		let data = { type : type, boa_num : boa_num}
		
		$.ajax({
			url: '/user/recommend/boa_up_down',
			type: 'get',
			data: data,
			dataType : 'json',
			beforeSend : function(xmlHttpRequest) {
		        xmlHttpRequest.setRequestHeader("AJAX", "true");
		    },
			success: function(result){

				 // console.log("result : " + result.boa_up);
				 $("#boa_up").text(result.boa_up);
				 $("#boa_down").text(result.boa_down);

			},
		    error: function(xhr, status, error){
		        
		        // 에러 났을 시 추가작업
		        // ajax이면 인터셉터에서 400번 에러를 보내고 ajax에서 400번에러를 받으면 로그인 페이지로 연결
		        if(xhr.status == 400){
		            location.href = "/member/login";
		        }
		        
		    }
		});

	});

});

</script>
    
  

</body></html>