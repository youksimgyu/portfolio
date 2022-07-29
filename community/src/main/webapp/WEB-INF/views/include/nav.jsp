<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach items="${mainCategoryList }" var="categoryVO">
<div class="container">
  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 link-secondary" href="${categoryVO.cat_c }" style="display:inline;">${categoryVO.cat_name }</a>

    </nav>
  </div>
</div>
</c:forEach>