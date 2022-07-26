<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">DocMall</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    <!-- 
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
       -->

      <!-- 1차 카테고리-->
      <c:forEach items="${mainCategoryList }" var="categoryVO">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="${categoryVO.cg_code_c }" role="button" data-toggle="dropdown" aria-expanded="false" style="display:inline;">
          ${categoryVO.cg_name }
        </a>

        <!-- 2차 카테고리 -->
        <div class="dropdown-menu subCategory">
        </div>
      </li>
      </c:forEach>
      
        <!-- 
      <li class="nav-item">
        <a class="nav-link disabled">Disabled</a>
      </li>
       -->
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<script>

  $(document).ready(function(){

    //1차 카테고리 클릭
    $("ul.navbar-nav li.nav-item a").on("click", function(){

      // ajax 구문 사용시 이전에 필요한 선택자의 정보를 변수에 넣어둔다
      let selectedCategory = $(this);
      let url = "/user/product/subCategoryList/" + $(this).attr("href");

      // console.log("2차 카테고리 : " + url);

      $.getJSON(url, function(result){
        // console.log("2차 카테고리 정보 : " + selectedCategory.attr("href"));
        //2차 카테고리 선택
        let subCategoryList = selectedCategory.next();

        subCategoryList.children().remove();

        let subCategoryStr = "";

        for(let i=0; i<result.length; i++){
          // 1) 직접 주소 작업
          // subCategoryStr += "<a class='dropdown-item' href='/prodcut/productList/"+ result[i].cg_code_c + "'>" + result[i].cg_name + "</a>";

          // 2) jQuery 문법을 사용하여, 이벤트 설정 통한 주소작업
          subCategoryStr += "<a class='dropdown-item' href='"+ result[i].cg_code_c + "'>" + result[i].cg_name + "</a>";

        }

        subCategoryList.append(subCategoryStr);

      });

    });

    // 2차 카테고리 클릭시
    $("ul.navbar-nav li.nav-item div.subCategory").on("click", "a", function(e){
      e.preventDefault(); // <a href=""></a>, <input type="submit"> 기능 제거
      
      let cg_code_c = $(this).attr("href");
      location.href = "/user/product/productList/" + cg_code_c;

    });

  });


</script>