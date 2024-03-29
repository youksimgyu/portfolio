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
    </style>

    
<%@include file="/WEB-INF/views/include/common.jsp" %>
    

  </head>
  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<%@include file="/WEB-INF/views/include/categoryMenu.jsp" %>

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h1 class="display-4">CART LIST</h1>

</div>

    <div class="container">

<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
		
			<div class="box-header">
				LIST CART
			</div>
			
			<div class="box-body">
			
			  <table class="table table-hover" id="cartlistresult">
				  <thead>
				    <tr>
				      <th scope="col">제품</th>
				      <th scope="col">수량</th>
				      <th scope="col">적립</th>
				      <th scope="col">배송비</th>
				      <th scope="col">가격</th>
				      <th scope="col">취소</th>
				    </tr>
				  </thead>
				  <tbody>
				  
				    <c:forEach items="${cartList }" var="cartVO">
				    <c:set var="price" value="${cartVO.cart_amount * cartVO.pdt_price }"></c:set>
				    <tr>
				      <td scope="row">
				      	<a class="move" href="${cartVO.pdt_num }">
					      	<img src="/user/product/displayFile?folderName=${cartVO.pdt_img_folder }&fileName=s_${cartVO.pdt_img }"
					      		 style="width: 80px;height: 80px;" onerror="this.onerror=null; this.src='/image/no_client.png'">
					      	<c:out value="${cartVO.pdt_name }" />
				      	</a>
						<c:out value="${cartVO.pdt_price }" />
				      </td>
    				  <td>
	    				  	<input type="hidden" name="pdt_price" value='<c:out value="${cartVO.pdt_price }" />'>
	    				  	<input type="hidden" name="pdt_num" value='<c:out value="${cartVO.pdt_num }" />'>

    				  	<input type="number" class="w-25" name="cart_amount" min="1" value='<c:out value="${cartVO.cart_amount }" />'>
    				  	<!--
    				  	<button type="button" name="btnCartAmountChange1" data-cart_code="${cartVO.cart_code }" class="btn btn-link">수량변경(Ajax)</button>
    				  	 -->
    				  	<button type="button" name="btnCartAmountChange2" data-cart_code="${cartVO.cart_code }" class="btn btn-link">수량변경</button>
    				  </td>
    				  <td><c:out value="${cartVO.mem_point }" /></td>
    				  <td>[기본배송]조건</td>
    				  <td><span class="unitprice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price }"></fmt:formatNumber></span></td>
				      <td>
				      	<!-- <button type="button" name="btnCartDelete" data-cart_code="${cartVO.cart_code }" class="btn btn-link">Delete</button> -->
				      	<a href="/user/cart/cart_delete?cart_code=${cartVO.cart_code }">Delete</a>
				      </td>
				    </tr>
				    <c:set var="sum" value="${sum + price }"></c:set>
				    </c:forEach>
				  </tbody>
				  <tfoot>
				  	<tr>
				  		<c:if test="${!empty cartList }">
				  		<td colspan="6" style="text-align: right">총 구매금액 : <span id="cartTotalPrice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${sum }"></fmt:formatNumber></span></td>
				  		</c:if>
				  		<c:if test="${empty cartList }">
				  		<td colspan="6" style="text-align: center">장바구니에 담긴 상품이 없습니다.</td>
				  		</c:if>
				  	</tr>
				  </tfoot>
				</table>
			</div>

      <div class="box-footer text-center">
        <button type="button" class="btn btn-primary" name="btncarttotaldelete">장바구니 비우기</button>
        <button type="button" class="btn btn-primary">계속 쇼핑하기</button>
        <button type="button" class="btn btn-primary" id="btnOrder">주문하기</button>
      </div>

      <form id="actionForm" action="/board/list" method="get">
			<input type="hidden" name="cg_code_c" value="${cg_code_c }">
			<input type="hidden" name="cg_name" value="${cg_name }">
      </form>


		</div>
	</div>
</div>
      
<!--  footer.jsp -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>
    </div>

<script>

  $(function(){

      // 수량변경(Ajax) 방식 버튼클릭
      $("button[name='btnCartAmountChange1']").on("click", function(){
        
        let btnAmountChange = $(this);

        let cart_code = $(this).data("cart_code");
        let cart_amount = $(this).parent().find("input[name='cart_amount']").val();

        // console.log("장바구니 코드 : " + cart_code);
        // console.log("변경 수량 : " + cart_amount);

        $.ajax({
          url: '/user/cart/cart_amount_update1',
          type : 'get',
          data: { cart_code : cart_code, cart_amount : cart_amount},
          dataType : 'text',
          success: function(result){
            if(result == "success"){
              alert("수량 변경이 되었습니다");

              //개발상품 금액, 총금액 변경작업 해야 함
              let pdt_price = btnAmountChange.parent().find("input[name='pdt_price").val();
              
              // 단위가격 변경
              btnAmountChange.parent().parent().find("span.unitprice").html($.numberWithCommas(pdt_price * cart_amount));

              // 총구매 가격 변경
              let total_price = 0;
              $("table#cartlistresult span.unitprice").each(function(index, item){
                // console.log("단위가격 : " + $(item).html());
                total_price += parseInt($.withoutCommas($(item).text()));
                $("table#cartlistresult span#cartTotalPrice").text($.numberWithCommas(total_price));
                
              });

              
            }
          }
        });

      });

  // 수량변경(Ajax 방식 버튼클릭
  $("button[name='btnCartAmountChange2']").on("click", function(){
    
    let btnAmountChange = $(this);

    let cart_code = $(this).data("cart_code");
    let cart_amount = $(this).parent().find("input[name='cart_amount']").val();

    console.log("장바구니 코드 : " + cart_code);
    console.log("변경 수량 : " + cart_amount);

    location.href= "/user/cart/cart_amount_update2?cart_code=" + cart_code + "&cart_amount=" + cart_amount;



  });

  // 장바구니 삭제
  $("button[name='btnCartDelete']").on("click", function(){

    let cart_code = $(this).data("cart_code");

    if(confirm("삭제 하시겠습니까?")){
      location.href="/user/cart/cart_delete?cart_code=" + cart_code;
    }

    // console.log("장바구니 코드  : " + cart_code);

  });

  // 장바구니 전체 삭제
  $("button[name='btncarttotaldelete']").on("click", function(){

    if(confirm("모두 삭제 하시겠습니까?")){
      location.href="/user/cart/cart_total_delete";
    }

  });
  
  // 주문하기 버튼클릭
   $("#btnOrder").on("click", function(){

	   let type = "cartOrder";
	   location.href = "/user/order/orderListInfo?type=" + type;
	
  });

  let actionForm = $("#actionForm");
  
  // 상품이미지, 상품제목 클릭
  $("a.move").on("click", function(e){
    e.preventDefault();

    let pdt_num = $(this).attr("href");

    actionForm.attr("method", "get");
    actionForm.attr("action", "/user/product/productDetail");
	
    actionForm.append("<input type='hidden' name='pdt_num' value='" + pdt_num + "'>");

    // 2차 카테고리 코드, 

    actionForm.submit();

  });
  
  // 주문하기 버튼클릭
  $("#btnOrder").on("click", function() {
	
	  let type = "cartOrder";
	  location.href = "/user/order/orderListInfo?type=" + type;
  
  });


}); // function 마지막

    // 숫자값을 3자리마다 콤마 찍기
    $.numberWithCommas = function(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }
    // 3자미마다 콤마를 제거하기(천단위)
    $.withoutCommas = function (x) {
    return x.toString().replace(",", '');
    }

</script>
  </body>
</html>