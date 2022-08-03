<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.98.0">
    <title>Blog Template · Bootstrap v5.2</title>

<!-- blog css -->
<%@include file="/WEB-INF/views/include/blog_plugin.jsp" %>

<!-- bootstrap 5.2 -->
<%@include file="/WEB-INF/views/include/plugin1.jsp" %>


    <script>
    	if('${msg}' == 'logout'){
    		alert("로그아웃 되었습니다.");
    	}
    </script>
    
  </head>
  <body>

<!-- header -->
<%@include file="/WEB-INF/views/include/header.jsp" %>

<!-- nav -->
<%@include file="/WEB-INF/views/include/nav.jsp" %>



<main class="container">



<div class="p-5 my-5 border row">

	<div class="col-md-12">
		<div class="box box-primary">
			<h5><c:out value="${boardGet.boa_title }" /></h5>
			<div class="content-body">
			  
			  
				<nav aria-label="...">
				  <ul class="pagination">
				    <!-- 이전표시 -->
				    <c:if test="${pageMaker.prev }">
					    <li class="page-item">
					      <a class="page-link" href="${pageMaker.startPage - 1 }">Previous</a>
					    </li>
				    </c:if>
				    
				    <!-- 페이지번호 표시.  1  2  3  4  5 -->
				    
				    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num" >
				    	<li class='page-item ${pageMaker.cri.pageNum == num ? "active": "" }'><a class="page-link" href="${num}">${num}</a></li>
				    </c:forEach>
				    <!-- 
				    <li class="page-item active" aria-current="page">
				      <span class="page-link">2</span>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				     -->
				    <!-- 다음표시 -->
				    <c:if test="${pageMaker.next }">
					    <li class="page-item">
					      <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
					    </li>
				    </c:if>
					
				  </ul>
				  
				  	<!--페이지 번호 클릭시 list주소로 보낼 파라미터 작업-->
					<form id="actionForm" action="/board/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">				
					</form>
					
				</nav>
			</div>
			

			
		</div>
	</div>
</div>


</main>

<!-- footer -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

<script>

$(document).ready(function(){


});
</script>
    
  

</body></html>