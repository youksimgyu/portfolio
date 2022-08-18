<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    
<div class="container">
  <header class="blog-header lh-1 py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a class="link-secondary" href="#">Subscribe</a>
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="/">Large</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
      

			  	
		<input type="text" class="form-control" style="width: 150px">
        <a class="link-secondary" href="#" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24">
          <title>Search</title>
          <circle cx="10.5" cy="10.5" r="7.5"></circle>
          <path d="M21 21l-5.2-5.2"></path>
          </svg>
        </a>
       
        <!-- 로그인 이전상태 -->
        <c:if test="${sessionScope.loginStatus == null }">
        <a class="btn btn-sm btn-outline-secondary m-2" href="/member/login">login</a>
        <a class="btn btn-sm btn-outline-secondary m-2" href="/member/join">join</a>
        </c:if>
        
        <!-- 로그인 이후상태 -->
	    <!-- sessionScope.loginStatus는 MemberVO vo변수에 담긴 로그인 정보임 -->
	    <c:if test="${sessionScope.loginStatus != null }">
	    <a class="btn btn-sm btn-outline-secondary m-2" href="/member/logout">[${sessionScope.loginStatus.mem_id} 님]  logout</a>
	    <a class="btn btn-sm btn-outline-secondary m-2" href="/member/confirmPW">modify</a>
	    </c:if>
        
      </div>
    </div>
  </header>
</div>