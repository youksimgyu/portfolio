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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="reviewTemplate" type="text/x-handlebars-template">
    {{#each .}}
    <div class="list-group">    
      <div class="d-flex w-100 justify-content-between">
          <h6 class="mb-1">{{idfourdisplay mem_id}}</h6>
          <p>
          <small>평점: {{displayStar rv_score}}</small>
		      {{modifyview mem_id rv_num}}
          <input type="hidden" name="rv_score" value="{{rv_score}}">
          </p>
      </div>
      <div class="d-flex w-100 justify-content-between">
          <p class="mb-1"><span class="rv_content">{{rv_content}}</span></p>
          <p>
          <small>{{prettifyDate rv_date_reg}}</small>
          {{deleteview mem_id rv_num}}
          </p>
      </div>
    </div>
    <hr>
  {{/each}}
</script>

  </head>
  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<%@include file="/WEB-INF/views/include/categoryMenu.jsp" %>

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h1 class="display-4">${cg_name }</h1>
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
			    
			    <!--상품후기 출력위치-->
				<div id="reviewListResult">
			    </div>
			    
				<!--상품후기 페이징 출력위치-->
		        <div>
		          <nav aria-label="Page navigation example">
		            <ul class="pagination" id="reviewPagingResult">
		            </ul>
		          </nav>
		        </div>  
			    
			  </div>
			</div>
      	</div>
      </div>
      

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
    
    
    // 직접구매 버튼 클릭시
    $("#btnOrder").on("click", function(){

      let pdt_num = $("#pdt_num").val(); // 구매 상품코드
      let odr_amount = $("#pdt_amount").val(); // 구매수량

      location.href = "/user/order/orderListInfo?pdt_num=" + pdt_num + "&odr_amount=" + odr_amount + "&type=direct";

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
	
      $("button.btnReview").hide();
      $("button#btnReviewWrite").show();
  	  $("#reviewModal").modal('show')
  
  });

  // 상품후기 수정 팝업대화상자
  $("div#reviewListResult").on("click", "p a.modify", function(e) {
   
	  e.preventDefault();
    
    $("button.btnReview").hide();
    $("button#btnReviewModify").show();
  
    
    // 1)리뷰내용 표시
    let rv_num = $(this).attr("href");
    let rv_content = $(this).parents("div.list-group").find("p span.rv_content").text();

    $("textarea#rv_content").val(rv_content);
    $("input#rv_num").val(rv_num);

    // 2)별명점표시
    let rv_score = $(this).parents("div.list-group").find("p input[name='rv_score']").val();

    // 별 a태그 5개
    $("#star_rv_score a").each(function(index, item){

      if(index < rv_score){
        $(item).addClass('on');
      }else{
        $(item).removeClass('on');
      }



    });


    $("#reviewModal").modal('show');


  });

        //상품후기 목록에서 delete 버튼 클릭
        $("div#reviewListResult").on("click", "p a.delete", function(e){

          e.preventDefault();

          let rv_num = $(this).attr("href"); // 상품후기번호

          console.log("상품후기 번호: " + rv_num);

          if(!confirm('상품후기' + rv_num + ' 번을 삭제하시겠습니까?')) return;


          $.ajax({
            url: '/user/review/delete/' + rv_num, // 주소를 경로형식을 사용한다.
            headers: {
                "Content-Type" : "application/json", "X-HTTP-Method-Override" : "DELETE"
              },
            type: 'delete',
            dataType: 'text',
            success : function(result) {
              if(result == "success") {
                alert("상품후기가 삭제됨.");
                
                //상품후기 목록
                url = "/user/review/list/" + $("#pdt_num").val() + "/" + reviewPage;

                getPage(url);

              }
            }
          });

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
          
          //상품후기 목록
          reviewPage = 1;
          // "/user/review/list/상품코드/첫번째 페이지"
          url = "/user/review/list/" + $("#pdt_num").val() + "/" + reviewPage;

          getPage(url);

          // 상품후기 대화상자 숨기기
          $("#reviewModal").modal("hide");
          $("#star_rv_score a.rv_score").parent().children().removeClass("on");
          $("#rv_content").val("");
        }
      }
    });

  });

  // 상품후기 수정버튼
  $("#btnReviewModify").on("click", function(){
  
    let rv_num = $("#rv_num").val();
    let rv_score = 0;
    let rv_content = $("#rv_content").val();

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
    let data = { rv_num : rv_num, rv_content : rv_content, rv_score : rv_score}
    
    $.ajax({
      url: '/user/review/modify',
      headers: { "Content-Type" : "application/json", "X-HTTP-Method-Override" : "PATCH"},
      type: 'PATCH',
      dataType: 'text',
      data: JSON.stringify(data),
      success: function(result){
        if(result == "success"){
          alert("상품후기가 수정되었습니다");
          
          //상품후기 목록
          // reviewPage = 1;
          // "/user/review/list/상품코드/첫번째 페이지"
          url = "/user/review/list/" + $("#pdt_num").val() + "/" + reviewPage;

          getPage(url);

          // 상품후기 대화상자 숨기기
          $("#reviewModal").modal("hide");
          $("#star_rv_score a.rv_score").parent().children().removeClass("on");
          $("#rv_content").val("");
        }
      }
    });

  });

  
}); // ready이벤트 끝

let reviewPage = 1;
let url = "/user/review/list/" + ${productVO.pdt_num } + "/" + reviewPage;

console.log("상품후기요청주소: " + url);

getPage(url);

function getPage(pageInfo) {

  $.getJSON(pageInfo, function(data) {
    // console.log("목록: " + data.list[0].rv_num);
    // console.log("페이지정보: " + data.pageMaker.startPage);

    if(data.list.length > 0) {

      //함수 : 상품후기목록
      printReviewList(data.list, $("#reviewListResult"), $("#reviewTemplate"));
      
      //함수 : 페이징기능
      printReviewPaging(data.pageMaker, $("#reviewPagingResult"));
    }
        	  
  });
}


//상품후기 출력하는 함수
let printReviewList = function(reviewArrData, target, templateObj) {

  //핸들바 코드가 존재하는 상품후기 디자인코드를 컴파일 함.
  let template = Handlebars.compile(templateObj.html());

  let html = template(reviewArrData); // 상품후기목록 데이타 + 상품후기UI템플릿 결합된 결과소스

  target.children().remove();
  target.append(html);
}

//상품후기 등록일 : 사용자정의 Helper함수.  템플릿에서 사용함.
Handlebars.registerHelper("prettifyDate", function(timeValue) {

  let dateObj = new Date(timeValue);
  let year = dateObj.getFullYear();
  let month = dateObj.getMonth() + 1;
  let date = dateObj.getDate();
  let hour = dateObj.getHours();
  let minute = dateObj.getMinutes();

  return year + "/" + month + "/" + date + " " + hour + ":" + minute;
});

//별평점 표시하기
Handlebars.registerHelper("displayStar", function(rating){

  let stars = "";
  switch(rating) {
    case 1:
      stars = "★☆☆☆☆";
      break;
    case 2:
      stars = "★★☆☆☆";
      break;
    case 3:
      stars = "★★★☆☆";
      break;
    case 4:
      stars = "★★★★☆";
      break;
    case 5:
      stars = "★★★★★";
      break;
      
  }

  return stars;

});

// 아이디 4글자만 보여주기
Handlebars.registerHelper("idfourdisplay", function(userid){

    return userid.substring(0, 4) + "*****";
});

// 로그인 사용자와 댓글작성자가 일치할 경우 수정버튼 표시
Handlebars.registerHelper("modifyview", function(review_mem_id, rv_num){

  let result = "";
  let login_mem_id = "${sessionScope.loginStatus.mem_id}";
  if(review_mem_id == login_mem_id){
    result = "<a href='" + rv_num + "' class='modify'>[modify]</a>";
  }

  return new Handlebars.SafeString(result);

});

// 로그인 사용자와 댓글작성자가 일치할 경우 삭제버튼 표시
Handlebars.registerHelper("deleteview", function(review_mem_id, rv_num){

  let result = "";
  let login_mem_id = "${sessionScope.loginStatus.mem_id}";
  if(review_mem_id == login_mem_id){
    result = "<a href='" + rv_num + "' class='delete'>[delete]</a>";
  }

  return new Handlebars.SafeString(result);

});




//상품후기 페이징 함수
let printReviewPaging = function(pageMaker, target) {

  let pagingStr = "";

  // 이전표시
  if(pageMaker.prev) {
    pagingStr += "<li class='page-item'><a class='page-link' href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
  }

  //페이지번호 표시
  for(let i= pageMaker.startPage; i <= pageMaker.endPage; i++) {
    let classStr = pageMaker.cri.pageNum == i ? "active'" : "";
    pagingStr += "<li  class='page-item " + classStr + "'><a  class='page-link' href='" + i + "'>" + i + "</a></i>";
  }

  // 다음표시
  if(pageMaker.next) {
    pagingStr += "<li class='page-item'><a class='page-link' href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
  }

  //console.log("페이지문자열: " + pagingStr);
  target.children().remove();
  target.append(pagingStr);
}

// 이전, 페이지번호, 다음 클릭
$("nav ul#reviewPagingResult").on("click", "li a.page-link", function(e){
  e.preventDefault();
  //console.log("페이지번호 클릭");

  //상품후기 목록
  reviewPage = $(this).attr("href");
  // "/user/review/list/상품코드/첫번째 페이지"
  url = "/user/review/list/" + $("#pdt_num").val() + "/" + reviewPage;

  getPage(url);

});


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
            <input type="hidden" name="rv_num" id="rv_num">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="btnReviewWrite" class="btn btn-primary btnReview">리뷰쓰기</button>
        <button type="button" id="btnReviewModify" class="btn btn-primary btnReview">리뷰수정</button>
        <button type="button" id="btnReviewDelete" class="btn btn-primary btnReview">리뷰삭제</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- 모달 끝 -->

  </body>
</html>