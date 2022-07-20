<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <title>회원가입</title>

<!-- blog css -->
<%@include file="/WEB-INF/views/include/blog_plugin.jsp" %>

<!-- bootstrap 5.2 -->
<%@include file="/WEB-INF/views/include/plugin1.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>


<body>

<!-- header -->
<%@include file="/WEB-INF/views/include/header.jsp" %>

<!-- nav -->
<%@include file="/WEB-INF/views/include/nav.jsp" %>


<div class="container my-5 p-5">
	<h3 style="text-align:center;">Modify</h3>
		
		<form id="modifyForm" method="post" action="modify" class="contatiner p-5 my-5 border">
		
			<div class="mb-3 mt-3">
			<label for="mem_id" class="form-label">아이디:</label>
			<div class="row">
			  <div class="col-6">
				<input type="text" class="form-control" id="mem_id" name="mem_id" value="${memberVO.mem_id }" readonly>
			  </div>
			</div>
			</div>
			
			<div class="mb-3 mt-3">
			<label for="email" class="form-label">비밀번호:</label>
			<div class="col-6">
			<input type="password" class="form-control" id="mem_pw" name="mem_pw">
			</div>
			</div>
			
			<div class="mb-3 mt-3">
			<label for="email" class="form-label">비밀번호 확인:</label>
			<div class="col-6">
			<input type="password" class="form-control" id="mem_pw_ck" name="mem_pw_ck">
			</div>
			</div>
			
			<div class="mb-3 mt-3">
			<label for="email" class="form-label">휴대폰 번호:</label>
			<div class="col-6">
			<input type="text" class="form-control" id="mem_phone" value="${memberVO.mem_phone }" name="mem_phone">
			</div>
			</div>
			
			<div class="mb-3 mt-3">
			<label for="email" class="form-label">이름:</label>
			<div class="col-6">
			<input type="text" class="form-control" id="mem_name" value="${memberVO.mem_name }" name="mem_name">
			</div>
			</div>
			
			<div class="mb-3 mt-3">
			<label for="email" class="form-label">이메일:</label>
			<div class="col-6">
			<input type="email" class="form-control" id="mem_email" value="${memberVO.mem_email }" name="mem_email">
			</div>
			</div>
			
			<button type="button" class="btn btn-primary" id="btnModify">수정하기</button>
		</form>
</div>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>



<script>

	$(document).ready(function(){
		
	    let modifyForm = $("#modifyForm");

	    // 회원정보 저장하기
	    $("#btnModify").on("click", function(){
	      
	      console.log("회원수정 저장하기");
	      
	      modifyForm.submit();
	      alert("수정이 완료되었습니다.");
		});
	});

</script>



</body>

</html>