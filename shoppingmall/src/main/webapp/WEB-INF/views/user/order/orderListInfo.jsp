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
  <h1 class="display-4">ORDER LIST</h1>
  <!--  <p class="lead">Quickly build an effective pricing table for your potential customers with this Bootstrap example. It’s built with default Bootstrap components and utilities with little customization.</p> -->
</div>

    <div class="container">

<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
		
			<div class="box-header">
				LIST ORDER
			</div>
			
			<div class="box-body">
			
			  <table class="table table-hover" id="cartlistresult">
				  <thead>
				    <tr>
				      <th scope="col">상품</th>
				      <th scope="col">수량</th>
				      <th scope="col">적립</th>
				      <th scope="col">주문금액</th>
				    </tr>
				  </thead>
				  <tbody>
				  
				    <c:forEach items="${cartOrderList }" var="cartOrderInfo">
				    <c:set var="price" value="${cartOrderInfo.cart_amount * cartOrderInfo.pdt_price }"></c:set>
				    <tr>
				      <td scope="row">
				      	<a class="move" href="${cartOrderInfo.pdt_num }">
					      	<img src="/user/order/displayFile?folderName=${cartOrderInfo.pdt_img_folder }&fileName=s_${cartOrderInfo.pdt_img }"
					      		 style="width: 80px;height: 80px;" onerror="this.onerror=null; this.src='/image/no_client.png'">
					      	<c:out value="${cartOrderInfo.pdt_name }" />
				      	</a>
						<c:out value="${cartOrderInfo.pdt_price }" />
				      </td>
    				  <td>
	    				  	<input type="hidden" name="pdt_price" value='<c:out value="${cartOrderInfo.pdt_price }" />'>
	    				  	<input type="hidden" name="pdt_num" value='<c:out value="${cartOrderInfo.pdt_num }" />'>

    				  	<c:out value="${cartOrderInfo.cart_amount }" /> 개
    				  </td>
    				  <td><c:out value="${sessionScope.loginStatus.mem_point }" /></td>
    				  <td><span class="unitprice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${price }"></fmt:formatNumber></span></td>
				      <td>
				      </td>
				    </tr>
				    <c:set var="sum" value="${sum + price }"></c:set>
				    </c:forEach>
				  </tbody>
				  <tfoot>
				  	<tr>
				  		<c:if test="${!empty cartOrderList }">
				  		<td colspan="6" style="text-align: right">총 구매금액 : <span id="cartTotalPrice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${sum }"></fmt:formatNumber></span></td>
				  		</c:if>
				  		<c:if test="${empty cartOrderList }">
				  		<td colspan="6" style="text-align: center">장바구니에 담긴 상품이 없습니다.</td>
				  		</c:if>
				  	</tr>
				  </tfoot>
				</table>
				
				<div>
		<form id="joinForm" action="join" method="post">
		<h5>주문자 정보</h5>
		<hr>
		  <div class="form-group row">
		    <label for="mem_name" class="col-sm-2 col-form-label">이름</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mem_name" name="mem_name">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_email" class="col-sm-2 col-form-label">전자우편</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mem_email" name="mem_email">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_phone" class="col-sm-2 col-form-label">휴대폰 번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mem_phone" name="mem_phone">
		    </div>
		  </div>
		  <h5>배송 정보</h5>
		  <hr>
		  <div class="form-group row">
		    <label for="mem_name" class="col-sm-2 col-form-label">이름</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mem_name" name="mem_name">
		    </div>
		  </div>
  		  <div class="form-group row">
		    <label for="mem_phone" class="col-sm-2 col-form-label">휴대폰 번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mem_phone" name="mem_phone">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_phone" class="col-sm-2 col-form-label">배송지 선택</label>
		    <div class="col-sm-10">
		      배송지 작업
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="sample2_postcode" class="col-sm-2 col-form-label">우편번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="sample2_postcode" name="mem_zipcode">
		      <input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="sample2_address" class="col-sm-2 col-form-label">주소</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="sample2_address" name="mem_addr">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="sample2_detailAddress" class="col-sm-2 col-form-label">상세주소</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="sample2_detailAddress" name="mem_addr_d">
		      <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_phone" class="col-sm-2 col-form-label">배송지 메시지(100자 이내)</label>
		    <div class="col-sm-10">
		      배송 참고내용
		    </div>
		  </div>
		  <div class="box-footer text-center">
	        <button type="button" class="btn btn-primary">주문하기</button>
	        <button type="button" class="btn btn-primary">주문취소</button>
	      </div>

	 </form>
				
				</div>
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

<!-- 우편변호 관련 API -->
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        // 태그참조변수. style.css속석명령어 = '값';
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
  </body>
</html>