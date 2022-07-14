<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>DocMall Shopping</title>

<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
    
    <script>

		  if('${msg}' == 'noID'){
			  alert("내용과 일치하는 회원정보가 없습니다.");
		  }

	</script>
     
  </head>
  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<h3>ID/PW Search</h3>

<div class="container">
  <div class="mb-3 text-center row">
	  <!-- 아이디찾기 -->
	  <div class="col-6">
	  <h5>아이디 찾기</h5>
	  	<form id="searchIDForm" action="searchID" method="post">
		  <div class="form-group row">
		    <label for="mem_name" class="col-sm-4 col-form-label">이름</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="NAME">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_email" class="col-sm-4 col-form-label">이메일</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="EMAIL">
		    </div>
		  </div>
		  
		  <div class="form-group row">
			  <div class="col-sm-12 text-center">
			  	<button type="submit" class="btn btn-dark" id="btnLogin">아이디 찾기</button>
          		<button type="button" class="btn btn-dark" id="btnSearchIDPW" onclick="location.href='login'">로그인</button>
			  </div>
		  </div>
	 	</form>
	  </div>
	  
	  <!-- 임시비밀번호 발급 -->
	  <div class="col-6">
	  <h5>임시비밀번호 발급</h5>
	  	<form id="searchPWForm" action="searchPW" method="post">
		  <div class="form-group row">
		    <label for="mem_id" class="col-sm-4 col-form-label">아이디</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="ID">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_email" class="col-sm-4 col-form-label">이메일</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="mem_email" name="mem_email" placeholder="EMAIL">
		    </div>
		  </div>
		  
		  <div class="form-group row">
			  <div class="col-sm-12 text-center">
			  	<button type="submit" class="btn btn-dark" id="btnLogin">임시비밀번호 발급</button>
          		<button type="button" class="btn btn-dark" id="btnSearchIDPW" onclick="location.href='login'">로그인</button>
			  </div>
		  </div>
	 	</form>
	  </div>
  </div>


<!--  footer.jsp -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

</div>

<%@include file="/WEB-INF/views/include/common.jsp" %>


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


    
    
  </body>
</html>
    