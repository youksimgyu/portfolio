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
<h1><a href="/user/board/boardList/${cat_c }/${cat_name}">${cat_name }</a></h1>

<nav class="navbar navbar-expand-lg bg-light my-3">
  <div class="container-fluid m-1">
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
      	<c:forEach items="${getSubList }" var="categoryVO">
        <li class="nav-item">
          <a class="nav-link" href="#">${categoryVO.cat_name }</a>
        </li>
        </c:forEach>
      </ul>
    </div>
  </div>
</nav>

	<div class="col-md-12">
		<div class="box box-primary">
			
			<div class="content-body">
			  
			  <table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">탭</th>
				      <th scope="col">제목</th>
				      <th scope="col">글쓴이</th>
				      <th scope="col">날짜</th>
				      <th scope="col">조회</th>
				      <th scope="col">추천</th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach items="${getMainList }" var="boardNameVO">
				    <!-- BoardVO클래스의 필드명으로 코딩했지만, 호출은 getter메서드가 사용됨. -->
				    <tr>
				      <th scope="row"><c:out value="${boardNameVO.cat_name_c }" /></th>
				      <td>
				      	<a class="move" href="#" data-boa_num="${boardNameVO.boa_num }"><c:out value="${boardNameVO.boa_title }" escapeXml="true" /></a>
				      </td>
				      	<c:if test="${!empty boardNameVO.mem_name }">
				      	<td scope="row">
						<c:out value="${boardNameVO.mem_name }" />
				      	</td>
				      	</c:if>
				      	<c:if test="${empty boardNameVO.mem_name }">
				      	<td scope="row">
						<c:out value="관리자" />
				      	</td>
				      	</c:if>
				      <td><fmt:formatDate value="${boardNameVO.boa_date_up }" pattern="yyyy-MM-dd" /></td>
				      <td scope="row"><c:out value="${boardNameVO.boa_hit }" /></td>
				      <td scope="row"><c:out value="${boardNameVO.boa_up }" /></td>
				    </tr>
				    </c:forEach>
				    
				  </tbody>
				</table>
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
						<input type="hidden" name="cat_c" value="${cat_c }">
						<input type="hidden" name="cat_name" value="${cat_name }">				
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

	let actionForm = $("#actionForm");
	
	// 페이지 번호 클릭
	$("ul.pagination li a.page-link").on("click", function(e){
		e.preventDefault(); // <a>태그의 링크기능 무력화
		
		let pageNum = $(this).attr("href");
	
		actionForm.find("input[name='pageNum']").val(pageNum);
	
		actionForm.attr("method", "get");
		actionForm.attr("action", "/user/board/boardList/${cat_c}/${cat_name}");
		actionForm.submit();
	});
	
	
	$("a.move").on("click", function(e){
		e.preventDefault();
	
		//상품코드를 자식으로 추가
		actionForm.append("<input type='hidden' name='boa_num' value='" + $(this).data("boa_num") + "'>");
		
		actionForm.attr("method", "get");
		actionForm.attr("action", "/user/board/boardGet");
		actionForm.submit();
	
	
	});
});
</script>
    
  

</body></html>