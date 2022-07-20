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

    <script>
    
    	let msg = "${msg}";
    	if(msg == "noPW"){
    		alert("비밀번호를 확인해주세요.");
    	}
    
    </script>

<body>

<!-- header -->
<%@include file="/WEB-INF/views/include/header.jsp" %>

<!-- nav -->
<%@include file="/WEB-INF/views/include/nav.jsp" %>


<div class="container my-5 p-5">
	<h3 style="text-align:center;">Password Check</h3>
		
		<form id="confirmPWForm" method="post" action="confirmPW" class="container p-5 my-5 border">
		
			<div class="mb-3 mt-3">
			<label for="mem_id" class="form-label">아이디:</label>
			<div class="row">
			  <div class="col-6">
				<input type="text" class="form-control" id="mem_id" name="mem_id" value="${sessionScope.loginStatus.mem_id }" readonly>
			  </div>
			</div>
			</div>
			
			<div class="mb-3 mt-3">
			<label for="mem_pw" class="form-label">비밀번호:</label>
			<div class="col-6">
			<input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="Password">
			</div>
			</div>
			
			<button type="submit" class="btn btn-primary" id="btnconfirmPW">확인</button>
		</form>
</div>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>



<script>

  /* 로그인 */
 
   // html문서와 내용을 브라우저가 읽고 난 이후에 동작되는 특징
   $(document).ready(function(){

      let confirmPWForm = $("#confirmPWForm");

      // 로그인 정보 전송
      $("#confirmPWForm").on("submit", function(){
        
        if($("#mem_pw").val() == "") {
          alert("비밀번호를 입력하세요.");
          $("#mem_pw").focus();
          return false;
        }

        return true;
      });

    });

</script>



</body>

</html>