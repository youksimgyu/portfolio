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
	<h3 style="text-align:center;">Join</h3>
		
		<form id="joinForm" method="post" action="join" class="contatiner p-5 my-5 border">
		
			<div class="mb-3 mt-3">
			<label for="email" class="form-label">아이디:</label>
			<div class="row">
			  <div class="col-6">
				<input type="text" class="form-control" id="mem_id" placeholder="Enter id" name="mem_id">
			  </div>
			  <div class="col-3">
				<button type="button" class="btn btn-link" id="btnIDCheck">ID중복체크</button>
			  </div>
			  <label class="col-sm-2 col-form-label" style="display:none" id="idCheckStatus">중복체크결과</label>
			</div>
			</div>
			
			<div class="mb-3 mt-3">
			<label for="email" class="form-label">비밀번호:</label>
			<div class="col-6">
			<input type="password" class="form-control" id="mem_pw" placeholder="Enter password" name="mem_pw">
			</div>
			</div>
			
			<div class="mb-3 mt-3">
			<label for="email" class="form-label">비밀번호 확인:</label>
			<div class="col-6">
			<input type="password" class="form-control" id="mem_pw_ck" placeholder="Enter password check" name="mem_pw_ck">
			</div>
			</div>
			
			<div class="mb-3 mt-3">
			<label for="email" class="form-label">휴대폰 번호:</label>
			<div class="col-6">
			<input type="text" class="form-control" id="mem_phone" placeholder="Enter phone" name="mem_phone">
			</div>
			</div>
			
			<div class="mb-3 mt-3">
			<label for="email" class="form-label">이름:</label>
			<div class="col-6">
			<input type="text" class="form-control" id="mem_name" placeholder="Enter name" name="mem_name">
			</div>
			</div>
			
			<div class="mb-3 mt-3">
			<label for="email" class="form-label">이메일:</label>
			<div class="col-6">
			<input type="email" class="form-control" id="mem_email" placeholder="Enter email" name="mem_email">
			</div>
			</div>
			
			<div class="row">
			  	<div class="col-1">
			      <button type="button" class="btn btn-primary" id="btnAuthcode">요청</button>
			    </div>
		    
			    <div class="col-4">
			      <input type="text" class="form-control" id="mem_authcode" name="mem_authcode">
			    </div>

	        	<div class="col-3">
			      <button type="button" class="btn btn-link" id="btnConfirmAuthcode">메일인증확인</button>
			    </div>
		  	</div>
			<br>
			<div class="form-check mb-3">
			<label class="form-check-label">
				<input class="form-check-input" type="checkbox" name="remember" checked="checked"> 개인정보 동의
			</label>
			</div>
			<button type="button" class="btn btn-primary" id="btnJoin">회원가입</button>
		</form>
</div>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<!-- 아이디 중복체크 js-->
<script>
/* 회원정보 저장 및 아이디 중복 체크 */

// html문서와 내용을 브라우저가 읽고 난 이후에 동작되는 특징
$(document).ready(function(){

	 let joinForm = $("#joinForm");
	
	 // 회원정보 저장하기
	 $("#btnJoin").on("click", function(){
	   
	   console.log("회원가입");
	   
	   //유효성 검사작업 해야 함
	   // 폼입력양식 태그 데이터 입력여부, 아이디, 비밀번호
	
	
	   // 아이디 중복체크 사용여부 isIDCheck
	   if(!isIDCheck) {
	     alert("아이디 중복체크를 해야 합니다.");
	     return;
	   }
	
	   // 메일 인증확인 여부 isAuthCode
	   /*
	   if(!isAuthCode) {
	     alert("메일 인증확인을 해야 합니다.");
	     return;
	   }
	   */
	
	   joinForm.submit();
	 });

 	let isIDCheck = false;

	 // 아이디 중복체크
	 $("#btnIDCheck").on("click", function(){
	
	   // 아이디에 공백일 경우 알람창 뜨고 아이디입력창으로 이동 후 return으로 빠져나옴
	   if($("#mem_id").val() == "") {
	     alert("아이디를 입력하세요.")
	     $("#mem_id").focus();
	     return;
	   }
	
	   $.ajax({
	     url: '/member/idCheck',
	     type: "get",
	     dataType: 'text',
	     data: { mem_id : $("#mem_id").val()},
	     success: function(result){
	         
	       console.log(result);
	
	       if(result == "yes") {
	           $("#idCheckStatus").css({'display':'inline', 'color':'blue'});
	           $("#idCheckStatus").html("<b>사용가능</b>");
	           isIDCheck = true;
	       }else {
	           $("#idCheckStatus").css({'display':'inline', 'color':'red'});
	           $("#idCheckStatus").html("<b>사용불가능</b>");
	           isIDCheck = false;
	       }
	     }
	   });
	 });
});

</script>

<script>

  $(document).ready(function(){

    // 메일 인증코드 요청
    $("#btnAuthcode").on("click", function(){

      if($("#mem_email").val() == "") {
        alert("메일을 입력해주세요.");
        return;
      }


      $.ajax({
          url: '/email/send',
          type: 'get',
          dataType: 'text',
          data: {receiveMail : $("#mem_email").val()},
          success: function(result){
        	  
			  if(result = "success"){
                alert("메일이 발송되어, 인증코드를 확인바랍니다.");
              } else {
                alert("메일이 발송이 실패되어, 메일주소 확인 또는 관리자에게 문의 바랍니다.");
              }
          }
      });
    });


    let isAuthCode = false; // 메일인증확인 여부
    
    // 메일 인증확인
    $("#btnConfirmAuthcode").on("click", function(){

      let authCode = $("#mem_authcode").val();

      $.ajax({
        url: '/member/confirmAuthCode',
        type: 'post',
        dataType: 'text',
        data: {uAuthCode: authCode},
        success: function(result){

          if(result == "success"){
              alert("인증번호 확인 완료");
              isAuthCode = true;
          }else if(result == "fail"){
              alert("인증번호가 틀렸습니다. \n 다시 진행해주세요.");
              isAuthCode = false;
          }
        }
      });
    });
  });

</script>



</body>

</html>