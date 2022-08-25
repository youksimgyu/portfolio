<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<!-- Admin LTE css. stylesheet 링크 -->
<%@include file="/WEB-INF/views/admin/include/plugin1.jsp"%>

<link rel="stylesheet" href="/resources/css/adLogin.css">

<script>

	let msg = "${msg}";
	if(msg == 'idFailure'){
		alert("아이디를 확인해주세요");
		$("#admin_id").focus();
	} else if (msg == 'passFailure'){
		alert("비밀번호를 확인해주세요");
		$("#admin_pw").focus();
	}


</script>

</head>

<body>

	<div class="main">
		<div class="container">
			<div class="middle">
				<div id="login">
				
					<form id="adLoginForm" action="adLogin" method="post">
						<fieldset class="clearfix">
							<p>
								<span class="fa fa-user"></span>
								<input type="text"Placeholder="Username" id="admin_id" name="admin_id" >
							</p>
							<!-- JS because of IE support; better: placeholder="Username" -->
							<p>
								<span class="fa fa-lock"></span>
								<input type="password"Placeholder="Password" id="admin_pw" name="admin_pw">
							</p>
							<!-- JS because of IE support; better: placeholder="Password" -->
							<div>
								<span style="width: 48%; text-align: left; display: inline-block;"><a class="small-text" href="#">Forgot password?</a></span>
								<span style="width: 50%; text-align: right; display: inline-block;"><input type="submit" value="Sign In"></span>
							</div>
						</fieldset>
						<div class="clearfix"></div>
					</form>
	
					<div class="clearfix"></div>
				</div>
				
				<!-- end login -->
				<div class="logo" style="text-align:center;">
					LOGO
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>

<!-- jQuery 3, Bootstrap 3.3.7, AdminLTE App -->
<%@include file="/WEB-INF/views/admin/include/plugin2.jsp"%>


<script>

	$(document).ready(function(){

		let adLoginForm = $("#adLoginForm");

		// 로그인 정보 전송
		$("#adLoginForm").on("submit", function(){
		
			console.log("로그인 진행");
			
			//유효성 검사작업 해야 함
			if($("#admin_id").val() == "") {
				alert("아이디를 입력하세요.");
				$("#admin_id").focus();
				return false;
			}

			if($("#admin_pw").val() == "") {
				alert("비밀번호를 입력하세요.");
				$("#admin_pw").focus();
				return false;n
			}

		});
	});


</script>


</body>
</html>