<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="container">
  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
    <c:forEach items="${mainCategoryList }" var="categoryVO">
      <a class="p-2 link-secondary" href="${categoryVO.cat_c }" style="display:inline;">${categoryVO.cat_name }</a>
    </c:forEach>
    </nav>
  </div>
</div>


<script>

$(document).ready(function(){
	
    //1차 카테고리 클릭
    $("div.nav-scroller nav a").on("click", function(e){

      e.preventDefault();
      
      let cat_name = $(this).text();
      
      console.log("cat_name");

      
      location.href = "/user/board/boardList/" + $(this).attr("href") + "/" + cat_name;


  });
});




</script>
