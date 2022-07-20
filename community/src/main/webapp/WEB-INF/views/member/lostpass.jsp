<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.98.0">
    <title>Signin Template · Bootstrap v5.2</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>    

<style>
<!--
	.container-log{
		padding-left: 300px;
		padding-right: 300px;
	}
	
	h5 {
		padding: 20px;
	}
-->
</style>

<!-- blog css -->
<%@include file="/WEB-INF/views/include/blog_plugin.jsp" %>

<!-- bootstrap 5.2 -->
<%@include file="/WEB-INF/views/include/plugin1.jsp" %>

    <script>

		  if('${msg}' == 'noID'){
			  alert("내용과 일치하는 회원정보가 없습니다.");
		  }

	</script>

    
</head>

<body>

<!-- header -->
<%@include file="/WEB-INF/views/include/header.jsp" %>

<!-- nav -->
<%@include file="/WEB-INF/views/include/nav.jsp" %>
    
  


<div class="container-log">
	  <!-- 아이디찾기 -->
	  	<h5 style="text-align:center;">ID Search</h5>
	  	
	  	<form id="searchIDForm" action="searchID" method="post" class="contatiner p-5 my-5 border">
		  
		  <div class="mb-3 mt-3">
		    <label for="mem_name" class="form-label">이름</label>
		    <div class="row">
		      <div class="col-6">
		      	<input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="NAME">
		      </div>
	   		 </div>
	 	 </div>
		  
		  <div class="mb-3 mt-3">
		    <label for="mem_email" class="col-sm-4 col-form-label">이메일</label>
		    <div class="row">
		    <div class="col-6">
		      <input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="EMAIL">
		    </div>
		    </div>
		  </div>
		  
		  	<button type="submit" class="btn btn-primary" id="btnLogin">아이디 찾기</button>
	   		<button type="button" class="btn btn-primary" id="btnSearchIDPW" onclick="location.href='login'">로그인</button>
	 	</form>
	  
	  <!-- 임시비밀번호 발급 -->
	  <h5 style="text-align:center;">Temporary Password</h5>
	  
	  	<form id="searchPWForm" action="searchPW" method="post" class="contatiner p-5 my-5 border">
	  	
		  <div class="mb-3 mt-3">
		    <label for="mem_id" class="col-sm-4 col-form-label">아이디</label>
		    <div class="row">
		    <div class="col-6">
		      <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="ID">
		    </div>
		    </div>
		  </div>
		  
		  <div class="mb-3 mt-3">
		    <label for="mem_email" class="col-sm-4 col-form-label">이메일</label>
		    <div class="row">
		    <div class="col-6">
		      <input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="EMAIL">
		    </div>
		    </div>
		  </div>
		  
	  		<button type="submit" class="btn btn-primary" id="btnLogin">임시비밀번호 발급</button>
      		<button type="button" class="btn btn-primary" id="btnSearchIDPW" onclick="location.href='login'">로그인</button>
	 	</form>
	  </div>
  



<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<script>

		$(document).ready(function(){

			let searchIDForm = $("#searchIDForm");

			$("#searchIDForm").on("submit", function(){

				// 입력했는지 체크
				if($("#mem_name").val() == "") {
					alert("이름을 입력해주세요.");
					$("#mem_name").focus();
					return false;
				}

				if($("#mem_email").val() == "") {
					alert("이메일을 입력해주세요.");
					$("#mem_email").focus();
					return false;
				}
				
				return true;

			});
		});

</script>
  

</body></html>