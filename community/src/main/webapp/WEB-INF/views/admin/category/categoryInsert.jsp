<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Starter</title>

<!-- AdminLTE v3.2.0 CDN -->
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">

<!-- css -->
<%@include file="/WEB-INF/views/admin/include/plugin2.jsp" %>

</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">

<!-- header -->
<%@include file="/WEB-INF/views/admin/include/header.jsp" %>

<!-- sidebar -->
<%@include file="/WEB-INF/views/admin/include/sidebar.jsp" %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  
  
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Board Register</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Board Register</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

<!-- Main -->
<form id="categoryForm" method="post" action="categoryInsert" class="contatiner p-5 my-5 border">
		
	<div class="mb-3 mt-3">
		<label for="cat_name" class="form-label">Category Name:</label>
		<div class="row">
		  <div class="col-6">
			<input type="text" class="form-control" id="cat_name" name="cat_name">
		  </div>
		</div>
	</div>
	
	<button type="button" class="btn btn-primary" id="btnRegister">Register</button>
	
</form>
    
    
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->

<!-- Main Footer -->
<%@include file="/WEB-INF/views/admin/include/footer.jsp" %>
  
</div>
<!-- ./wrapper -->

<!-- jQuery Bootstrap 4 AdminLTE App -->
<%@include file="/WEB-INF/views/admin/include/plugin1.jsp" %>


</body>
</html>