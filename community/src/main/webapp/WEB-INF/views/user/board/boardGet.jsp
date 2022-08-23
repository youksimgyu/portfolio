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
			<h2 style="display: inline; margin-right: 30px;">${boardGet.cat_name }</h2><span>${boardGet.cat_name_c }</span>
			<input type="hidden" name="boa_num" value="${boardGet.boa_num }">
			<div class="row" style="margin-top: 20px; margin-bottom: 20px; padding: 11px; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; background: #fcfcfc; line-height: 1.5em;">
				<div class="col-10">
				 	<span>${boardGet.boa_title }</span>
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
					<p>${boardGet.boa_content }</p>
				</div>
			  </div>
			</div>
			
			<div class="content-footer">
				<div class="row">
					<div class="col" style="text-align: center;">
					<span id="rec_up">${rec_get.rec_up }</span>
					<input type="hidden" name="rec_up" value="${rec_get.rec_up }">
					<button type="button" class="btn btn-outline-success" name="btn_rec_up_down" data-type="1">추천</button>
					<button type="button" class="btn btn-outline-danger" name="btn_rec_up_down" data-type="2">비추천</button>
					<span id="rec_down">${rec_get.rec_down }</span>
					<input type="hidden" name="rec_down" value="${rec_get.rec_down }">
					</div>
				</div>
			</div>
			<div>
				<!-- boardGet.mem_id는 글쓴이 아이디, mem_id는 로그인한 아이디  -->
				<c:if test="${boardGet.mem_id == mem_id and boardGet.mem_id != null }">
					<button class="btn btn-primary" type="button" id="btnModify" data-boa_num="${boardGet.boa_num }">수정</button>
					<button class="btn btn-primary" type="button" id="btnDelete" data-boa_num="${boardGet.boa_num }">삭제</button>
				</c:if>

			</div>
			
			<!-- Reply단 -->
			<div>
				<span style="display: inline-block; padding-left:5px; margin-top: 20px; margin-bottom: 10px">댓글 쓰기</span>
				<div class="row">
					<div class="col-8">
						<textarea style="resize: none; width: 100%;" name="rep_content"></textarea>
					</div>
					<div class="col-1">
						<button type="button" class="form-control" name="btnReplyInsert" id="btnReplyInsert" data-boa_num="${boardGet.boa_num }">등록</button>
					</div>
				</div>
			</div>
			
			<!--페이지 번호 클릭시 list주소로 보낼 파라미터 작업-->
			<form id="actionForm" action="/board/list" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				<input type="hidden" name="cat_c" value="${cat_c }">
				<input type="hidden" name="cat_name" value="${cat_name }">
			</form>
			
				
			
		</div>
	</div>
</div>


</main>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<script>

$(document).ready(function(){

	let actionForm = $("#actionForm");
	
	$("button[name='btn_rec_up_down']").on("click", function(){

		if(${sessionScope.loginStatus == null }){
			alert("로그인 해주세요");
		}
		
		let type = $(this).data("type");
		let boa_num = $("input[name='boa_num']").val();

		// 자바스크립트 Object객체 구문
		let data = { type : type, boa_num : boa_num};
		
		$.ajax({
			url: '/user/recommend/boa_up_down',
			type: 'get',
			data: data,
			success: function(result){
				
				if(result.rec_id == null){
					$("#rec_up").text(result.rec_up);
					$("#rec_down").text(result.rec_down);
				} else if(result.rec_id != null) {
					alert("이미 진행 했습니다");
				}

			}
		});

	});
	
	// 1) 상품수정 클릭시
	$("#btnModify").on("click", function(){

		// console.log("상품코드 : " $(this).data("pdt_num"));

		//상품코드를 자식으로 추가
		actionForm.append("<input type='hidden' name='boa_num' value='" + $(this).data("boa_num") + "'>");
		actionForm.attr("method", "get");
		actionForm.attr("action", "/user/board/boardModify");
		actionForm.submit();

	});
	
	// 게시글 삭제
	$("#btnDelete").on("click", function(){
		
		if(confirm("글을 삭제하시겠습니까")){
			actionForm.append("<input type='hidden' name='boa_num' value='" + $(this).data("boa_num") + "'>");
			actionForm.attr("method", "get");
			actionForm.attr("action", "/user/board/boardDelete");
			actionForm.submit();
		}
		
	});
	
	// 댓글 쓰기
	$("#btnReplyInsert").on("click", function(){

		if(${sessionScope.loginStatus == null }){
			alert("로그인 해주세요");
			return;
		}

		let rep_content = $("textarea[name='rep_content']").val();
		let boa_num =$(this).data("boa_num");
		let data = { rep_content : rep_content, boa_num : boa_num}
		
		if(rep_content == ""){
			alert("댓글을 입력해주세요");
			return;
		}
		
		if(rep_content) {
	
			$.ajax({
				url: '/user/reply/replyInsert',
				type: 'post',
				data: data,
				success: function(result){

						if(result) {
							alert("상품후기가 등록되었습니다");
							// console.log("result : " + result);

							$.ajax({
							url: '/user/reply/replyList',
							type: 'get',
							data: result,
							success: function(result){
								
								}
							});
						}
				}
			});
		}
	
	});

});

</script>
    
  

</body></html>