<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
  </head>
  <body>

<!-- header -->
<%@include file="/WEB-INF/views/include/header.jsp" %>
    
    

<div class="container">
  <div class="mb-3 text-center">
	  <form id="joinForm" action="join" method="post">
	  	<h3 style="padding: 30px;">회원가입</h3>
		  <div class="form-group row">
		  
		    <label for="mem_id" class="col-sm-2 col-form-label">아이디</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="아이디를  8~15이내로 입력">
		    </div>
		    
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-link" id="btnIDCheck">ID중복체크</button>
		    </div>
		    <label class="col-sm-2 col-form-label" style="display:none" id="idCheckStatus">중복체크결과</label>
		    
		  </div>
		  
		  <div class="form-group row">
		    <label for="mem_pw" class="col-sm-2 col-form-label">비밀번호</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="비밀번호를  8~15이내로 입력">
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="mem_pw_2" class="col-sm-2 col-form-label">비밀번호확인</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="mem_pw_2">
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="mem_name" class="col-sm-2 col-form-label">이름</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mem_name" name="mem_name">
		    </div>
		  </div>
		  
		  <div class="form-group row">
		    <label for="mem_email" class="col-sm-2 col-form-label">전자우편</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mem_email" name="mem_email">
		    </div>
		  </div>
		  
		  <div class="form-group row">
		  	<label for="mem_authcode" class="col-sm-2 col-form-label">메일인증코드</label>
		  	<div class="col-sm-3">
		      <button type="button" class="btn btn-primary" id="btnAuthcode">메일인증요청</button>
		    </div>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mem_authcode" name="mem_authcode">
		    </div>
        	<div class="col-sm-3">
		      <button type="button" class="btn btn-link" id="btnConfirmAuthcode">메일인증확인</button>
		    </div>
		  </div>

		  <div class="form-group row">
		    <label for="mem_phone" class="col-sm-2 col-form-label">휴대폰 번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mem_phone" name="mem_phone">
		    </div>
		  </div>

		  <div class="form-group row">
			  <div class="col-sm-12 text-center">
			  	<button type="button" class="btn btn-dark" id="btnJoin">회원가입</button>
			  </div>			
		  </div>
	 </form>
  </div>
</div>
    
    
    
<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<%@include file="/WEB-INF/views/include/common.jsp" %>



<script>


</script>

  </body>
</html>