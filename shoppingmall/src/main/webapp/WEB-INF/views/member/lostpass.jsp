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
     
  </head>
  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<h3>ID/PW Search</h3>

<div class="container">
  <div class="mb-3 text-center row">
	  <!-- 아이디찾기 -->
	  <div class="col-6">
	  	<form id="loginForm" action="loginPost" method="post">
		  <div class="form-group row">
		    <label for="mem_id" class="col-sm-2 col-form-label">아이디</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="아이디를  8~15이내로 입력">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_pw" class="col-sm-2 col-form-label">비밀번호</label>
		    <div class="col-sm-5">
		      <input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="비밀번호를  8~15이내로 입력">
		    </div>
		  </div>
		  
		  <div class="form-group row">
			  <div class="col-sm-9 text-center">
			  	<button type="submit" class="btn btn-dark" id="btnLogin">아이디 찾기</button>
          <button type="button" class="btn btn-dark" id="btnSearchIDPW">로그인</button>
			  </div>
		  </div>
	 	</form>
	  </div>
	  
	  <!-- 임시비밀번호 발급 -->
	  <div class="col-6">
	  	<form id="loginForm" action="loginPost" method="post">
		  <div class="form-group row">
		    <label for="mem_id" class="col-sm-2 col-form-label">아이디</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="아이디를  8~15이내로 입력">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_pw" class="col-sm-2 col-form-label">비밀번호</label>
		    <div class="col-sm-5">
		      <input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="비밀번호를  8~15이내로 입력">
		    </div>
		  </div>
		  
		  <div class="form-group row">
			  <div class="col-sm-9 text-center">
			  	<button type="submit" class="btn btn-dark" id="btnLogin">임시비밀번호 발급</button>
          <button type="button" class="btn btn-dark" id="btnSearchIDPW">로그인</button>
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

  /* 로그인 */
 
   // html문서와 내용을 브라우저가 읽고 난 이후에 동작되는 특징
   $(document).ready(function(){

      
    });

</script>



    
    
  </body>
</html>
    