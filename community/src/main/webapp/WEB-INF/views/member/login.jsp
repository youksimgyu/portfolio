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
		padding-left: 30%;
		padding-right: 30%;
	}
	
	h1 {
		padding: 40px;
	}
-->
</style>

<!-- blog css -->
<%@include file="/WEB-INF/views/include/blog_plugin.jsp" %>

<!-- bootstrap 5.2 -->
<%@include file="/WEB-INF/views/include/plugin1.jsp" %>

    <script>
      let msg = "${msg}";
      if(msg == "idFailure"){
        alert("아이디를 확인하세요.");
      }else if(msg == "passwdFailure"){
        alert("비밀번호를 확인하세요.");
      }
    </script>

    
</head>

<body class="text-center" cz-shortcut-listen="true">

<!-- header -->
<%@include file="/WEB-INF/views/include/header.jsp" %>

<!-- nav -->
<%@include file="/WEB-INF/views/include/nav.jsp" %>
    

  <form id= "loginForm" class="container-log" action="login" method="post">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating m-2">
      <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="ID">
      <label for="mem_id">ID</label>
    </div>
    <div class="form-floating m-2">
      <input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="Password">
      <label for="mem_pw">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me" checked="checked">아이디 저장
      </label>
    </div>
    <div class="row">
	    <div class="col">
	    <button class="w-100 btn btn-lg btn-primary" type="submit">log in</button>
	    </div>
	    
	    <div class="col">
	    <button class="w-100 btn btn-lg btn-primary" type="button" id="btnSearchIDPW">ID/PW Search</button>
	    </div>
    </div>
    <p class="mt-5 mb-3 text-muted">© 2017–2022</p>
  </form>



<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<script>

  /* 로그인 */
 
   // html문서와 내용을 브라우저가 읽고 난 이후에 동작되는 특징
   $(document).ready(function(){

      let loginForm = $("#loginForm");

      // 로그인 정보 전송
      $("#loginForm").on("submit", function(){
        
        console.log("로그인 진행");
        
        //유효성 검사작업 해야 함
        if($("#mem_id").val() == "") {
          alert("아이디를 입력하세요.");
          $("#mem_id").focus();
          return false;
        }

        if($("#mem_pw").val() == "") {
          alert("비밀번호를 입력하세요.");
          $("#mem_pw").focus();
          return false;
        }

        return true;
      });

      // ID/PW 찾기버튼
      $("#btnSearchIDPW").on("click", function(){
        
        location.href="/member/lostpass";
      });
    });

</script>
  

</body></html>