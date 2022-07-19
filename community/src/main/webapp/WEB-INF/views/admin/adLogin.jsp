<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<link href="/resources/admin/dist/css/adLogin.css" rel="stylesheet" id="bootstrap-css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script>

      let msg = "${msg}";

      if(msg == 'idFailure'){
         alert("아이디를 확인해주세요");
         $("#adm_id").focus();
      } else if (msg == 'passFailure'){
         alert("비밀번호를 확인해주세요");
         $("#adm_pw").focus();
      }

</script>


</head>

<body>


<div class="sidenav">
         <div class="login-main-text">
            <h2>Admin<br> Login Page</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form id="adLoginForm" action="adLogin" method="post">
                  <div class="form-group">
                     <label>User Name</label>
                     <input type="text" class="form-control" id="adm_id" name="adm_id" placeholder="User Name" required>
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" id="adm_pw" name="adm_pw" placeholder="Password" required>
                  </div>
                  <button type="submit" class="btn btn-black">Login</button>
                  <button type="button" class="btn btn-secondary">Cancel</button>
               </form>
            </div>
         </div>
      </div>

<script>



</script>
      
</body>
</html>