<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

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
		padding-left: 600px;
		padding-right: 600px;
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

    
</head>

<body class="text-center" cz-shortcut-listen="true">

<!-- header -->
<%@include file="/WEB-INF/views/include/header.jsp" %>

<!-- nav -->
<%@include file="/WEB-INF/views/include/nav.jsp" %>
    
<div class="container">
  <div class="mb-3 text-center row">
	  
	  <c:if test="${mem_id != null }">
	  	<p>ID : ${mem_id }</p>
	  </c:if>
	  
	  <c:if test="${mail != null }">
	  	<p>메일을 발송했습니다.</p>
	  </c:if>
	  
  </div>
</div>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>


  

</body></html>