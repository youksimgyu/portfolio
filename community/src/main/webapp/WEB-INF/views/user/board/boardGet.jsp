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
			<h3>${cat_name }</h3>
			<input type="hidden" name="boa_num" value="${boardGet.boa_num }">
			<hr>
			<div class="row">
				<div class="col-10">
				 	<span>${boardGet.boa_title }</span>
				</div>
				<div class="col-2">
				 	<span><fmt:formatDate value="${boardGet.boa_date_up }" pattern="yyyy.MM.dd hh:mm" /></span>
				</div>
			</div>
			<hr>
			<div class="row">
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
					<span>추천수 ${boardGet.boa_up }</span>
				</div>
				<div class="col-1">
					<span>댓글 ${boardGet.boa_rep_num }</span>
				</div>
			</div>
			<hr>
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
					<span>추천수 값</span>
					<button type="button" class="btn btn-outline-success" name="btn_boa_up_down" data-type="1">추천</button>
					<button type="button" class="btn btn-outline-danger" name="btn_boa_up_down" data-type="2">비추천</button>
					<span>비추천수 값</span>
					</div>
				</div>
			</div>
			
				
			
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

<script>

$(document).ready(function(){

	$("button[name='btn_boa_up_down']").on("click", function(){

		let type = $(this).data("type");
		let boa_num = $("input[name='boa_num']").val();
		let btn_boa_up_down = $(this);

		// 자바스크립트 Object객체 구문
		let data = { type : type, boa_num : boa_num}
		
		$.ajax({
			url: '/user/recommend/boa_up_down',
			type: 'get',
			data: data,
			success: function(result){
				if(result == "success"){
				alert("선택완료");
				
				}
			}
		});

	});

});

</script>
    
  

</body></html>