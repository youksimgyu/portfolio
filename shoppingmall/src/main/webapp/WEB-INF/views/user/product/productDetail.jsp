<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>DocMall Shopping</title>

<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      #star_rv_score a.rv_score{
      	font-size: 22px;
      	text-decoration: none;
      	color: lightgray;      	
      }
      
      #star_rv_score a.rv_score.on{
      	color: black;
      	
      }
    </style>

    
<%@include file="/WEB-INF/views/include/common.jsp" %>
    
<link rel="stylesheet" href="http://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

  </head>
  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<%@include file="/WEB-INF/views/include/categoryMenu.jsp" %>

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h1 class="display-4">${cg_name }</h1>
  <p class="lead">Quickly build an effective pricing table for your potential customers with this Bootstrap example. It’s built with default Bootstrap components and utilities with little customization.</p>
</div>

    <div class="container">

      <div class="row">
      	<div class="col-6">
      		<img src="/user/product/displayFile?folderName=${productVO.pdt_img_folder }&fileName=s_${productVO.pdt_img }"
				 class="bd-placeholder-img card-img-top" width="100%" height="225" onerror="this.onerror=null; this.src='/image/no_client.png'">
      	</div>
		<div class="col-6">
      		<h5>${productVO.pdt_name }</h5>
      		<p>판매가격 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${productVO.pdt_price }"></fmt:formatNumber></p>
      		<p>
      			<input type="hidden" id="pdt_num" value="${productVO.pdt_num }">
      			수량 : <input type="number" class="form-control w-25" id="pdt_amount" min="1" value="1">
      		</p>
      		<button type="button" id="btnOrder" class="btn btn-primary">구매하기</button>
	        <button type="button" id="btnCart" class="btn btn-primary">장바구니</button>
      	</div>
      </div>
      
      <div class="row">
      	<div class="col-12">
      		<div id="productDetailTab">
			  <ul>
			    <li><a href="#productDetailInfo">상세정보</a></li>
			    <li><a href="#productDetailReview">상품리뷰</a></li>
			  </ul>
			  <div id="productDetailInfo">
			    <p>${productVO.pdt_detail }</p>
			  </div>
			  <div id="productDetailReview">
			    <div class="row">
			    	<div class="col-6">REVIEW</div>
			    	<div class="col-6">
			    		<button type="button" id="btnReview" class="btn btn-info" style="float: right;">상품리뷰 쓰기</button>
			    	</div>
			    </div>
			  </div>
			</div>
      	</div>
      </div>
      
      <form id="actionForm" action="/board/list" method="get">
			<input type="hidden" name="cg_code_c" value="${productVO.cg_num_2 }">
			<input type="hidden" name="cg_name" value="${productVO.pdt_name }">
      </form>
      
<!--  footer.jsp -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>
    </div>



<script>

  $(function(){
	  
	$("#productDetailTab").tabs();  

    $("button[name='btnBuyCart']").on("click", function(){
      
      $("#Modal_productDetail").modal('show');

      // 모달 띄울때 상품 상세내용 가져오기
      let url = "/user/product/productDetail/" + $(this).data("pdt_num");
      $.getJSON(url, function(result){
        // console.log("상세정보 : " + result.pdt_num);
        
        // 상품코드
        $("div#Modal_productDetail input#pdt_num").val(result.pdt_num);
        // 상품이름
        $("div#Modal_productDetail input#pdt_name").val(result.pdt_name);
        // 판매가격
        $("div#Modal_productDetail input#pdt_price").val(result.pdt_price);
        // 제조사
        $("div#Modal_productDetail input#pdt_company").val(result.pdt_company);
    	// 상품 이미지
     	// /user/product/displayFile?folderName=${productVO.pdt_img_folder }&fileName=${productVO.pdt_img }
    	let url = "/user/product/displayFile?folderName=" + result.pdt_img_folder + "&" + "fileName=" + result.pdt_img;
        
        console.log("파일경로 : " + url);
        $("div#Modal_productDetail img#modal_detail_image").attr("src", url);

      });

    });

    // 장바구니 담기
    $("#btnCart").on("click", function(){

      $.ajax({
        url: '/user/cart/cart_add',
        data: { pdt_num :$("#pdt_num").val(), cart_amount : $("#pdt_amount").val() },
        dataType: 'text',
        success: function(result){
        	
        	if(result == "success"){
        		alert("장바구니에 추가되었습니다");
        		if(confirm("장바구니로 이동하시겠습니까?")){
              		location.href="/user/cart/cart_list";
            }
        	}
        	
        }
      })

    });

  let actionForm = $("#actionForm");
    
  
  let searchForm = $("#searchForm");


  // 상품이미지, 상품제목 클릭
  $("div.container a.move").on("click", function(){
    e.preventDefault();

    let pdt_num = $(this).attr("href");
    actionForm.attr("method", "get");
    actionForm.attr("action", "/user/product/productDetail");

    actionForm.append("<input type='hidden' name='pdt_num' value='" + pdt_num + "'>");
    
    
    
    actionForm.submit();

  });
  
  // 상품후기 팝업대화상자
  $("div#productDetailReview button#btnReview").on("click", function() {
	
	  $("#reviewModal").modal("show");
	  
  });
  
  // 평점 및 클릭시 색상변경
  $("#star_rv_score a.rv_score").on("click", function(e) {
    e.preventDefault();

	  $(this).parent().children().removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
	  
  });

  // 상품 후기 쓰기 버튼 클릭
  $("#btnReviewWrite").on("click", function(){
  
    let rv_score = 0;
    let rv_content = $("#rv_content").val();
    let pdt_num = $("#pdt_num").val();

    // 별평점이 5개
    $("#star_rv_score a.rv_score").each(function(index, item){

      if($(this).attr('class') == 'rv_score on'){
        rv_score += 1;
      }

    });

    // console.log("별 갯수 : " + rv_score);

    if(rv_score == 0){
      alert("별 평점을 선택해주세요");
      return;
    }

    if(rv_content == ""){
      alert("상품후기를 입력해주세요");
      return;
    }

    // 자바스크립트 Object객체 구문
    let data = { pdt_num : pdt_num, rv_content : rv_content, rv_score : rv_score}
    
    $.ajax({
      url: '/user/review/new',
      headers: { "Content-Type" : "application/json", "X-HTTP-Method-Override" : "post"},
      type: 'post',
      dataType: 'text',
      data: JSON.stringify(data),
      success: function(result){
        if(result == "success"){
          alert("상품후기가 등록되었습니다");
          
          // 상품후기 목록
          $.getJSON("/user/review/list/4149/1", function(data){
            
            // console.log("목록 : " + data.list[0].rv_num);
            // console.log("페이지 : " + data.pageMaker.cri.amount);


          });

          // 상품후기 대화상자 숨기기
          $("#reviewModal").modal("hide");
          $("#star_rv_score a.rv_score").parent().children().removeClass("on");
          $("#rv_content").val("");
        }
      }
    });

  });
  
}); // ready이벤트 끝


</script>


<!-- 상품리뷰 작성 모달 -->
<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">상품후기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">상품평점:</label>
            <p id="star_rv_score">
            	<a class="rv_score" href="#">★</a>
            	<a class="rv_score" href="#">★</a>
            	<a class="rv_score" href="#">★</a>
            	<a class="rv_score" href="#">★</a>
            	<a class="rv_score" href="#">★</a>
            </p>
          </div>
          <div class="form-group">
            <label for="rv_content-text" class="col-form-label">리뷰내용:</label>
            <textarea class="form-control" id="rv_content"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="btnReviewWrite" class="btn btn-primary">리뷰쓰기</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- 모달 끝 -->

  </body>
</html>