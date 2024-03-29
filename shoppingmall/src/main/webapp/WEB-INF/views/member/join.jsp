<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

    
    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
  </head>
  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<h3>회원가입</h3>

<div class="container">
  <div class="mb-3 text-center">
	  <form id="joinForm" action="join" method="post">
		  <div class="form-group row">
		    <label for="mem_id" class="col-sm-2 col-form-label">아이디</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="아이디를  8~15이내로 입력">
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-link" id="btnIDCheck">ID중복체크</button>
		    </div>
		    <label class="col-sm-2 col-form-label" style="display:none" id="idCheckStatus">중복체크결과</label>
		  </div>
		  <div class="form-group row">
		    <label for="mem_pw" class="col-sm-2 col-form-label">비밀번호</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="mem_pw" name="mem_pw" placeholder="비밀번호를  8~15이내로 입력">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_pw_2" class="col-sm-2 col-form-label">비밀번호확인</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="mem_pw_2">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_name" class="col-sm-2 col-form-label">이름</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mem_name" name="mem_name">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_nick" class="col-sm-2 col-form-label">닉네임</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mem_nick" name="mem_nick">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mem_email" class="col-sm-2 col-form-label">전자우편</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mem_email" name="mem_email">
		    </div>
		  </div>

		  <div class="form-group row">
		  
		  	<label for="mem_authcode" class="col-sm-2 col-form-label">메일인증코드</label>
		  
		  	<div class="col-sm-3">
		      <button type="button" class="btn btn-primary" id="btnAuthcode">메일인증요청</button>
		    </div>
		    
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mem_authcode" name="mem_authcode">
		    </div>

        <div class="col-sm-3">
		      <button type="button" class="btn btn-link" id="btnConfirmAuthcode">메일인증확인</button>
		    </div>
		  </div>

		  <div class="form-group row">
		    <label for="mem_phone" class="col-sm-2 col-form-label">휴대폰 번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mem_phone" name="mem_phone">
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
		      <label class="form-check-label col-sm-2" for="mem_accept_e">메일 수신동의</label>
			  <div class="col-sm-10 text-left">
			  	<input class="form-check-input" type="checkbox" value="Y" id="mem_accept_e" name="mem_accept_e">
			  </div>			
		  </div>
		  <div class="form-group row">
			  <div class="col-sm-12 text-center">
			  	<button type="button" class="btn btn-dark" id="btnJoin">회원가입</button>
			  </div>			
		  </div>
	 </form>
  </div>


<!--  footer.jsp -->
<%@include file="/WEB-INF/views/include/footer.jsp" %>

</div>

<%@include file="/WEB-INF/views/include/common.jsp" %>

<!-- 아이디 중복체크 js-->
<script>
/* 회원정보 저장 및 아이디 중복 체크 */

// html문서와 내용을 브라우저가 읽고 난 이후에 동작되는 특징
$(document).ready(function(){

	 let joinForm = $("#joinForm");
	
	 // 회원정보 저장하기
	 $("#btnJoin").on("click", function(){
	   
	   console.log("회원가입");
	   
	   //유효성 검사작업 해야 함
	   // 폼입력양식 태그 데이터 입력여부, 아이디, 비밀번호
	
	
	   // 아이디 중복체크 사용여부 isIDCheck
	   if(!isIDCheck) {
	     alert("아이디 중복체크를 해야 합니다.");
	     return;
	   }
	
	   // 메일 인증확인 여부 isAuthCode
	   /*
	   if(!isAuthCode) {
	     alert("메일 인증확인을 해야 합니다.");
	     return;
	   }
	   */
	
	   joinForm.submit();
	 });

 	let isIDCheck = false;

	 // 아이디 중복체크
	 $("#btnIDCheck").on("click", function(){
	
	   // 아이디에 공백일 경우 알람창 뜨고 아이디입력창으로 이동 후 return으로 빠져나옴
	   if($("#mem_id").val() == "") {
	     alert("아이디를 입력하세요.")
	     $("#mem_id").focus();
	     return;
	   }
	
	   $.ajax({
	     url: '/member/idCheck',
	     type: "get",
	     dataType: 'text',
	     data: { mem_id : $("#mem_id").val()},
	     success: function(result){
	         
	       console.log(result);
	
	       if(result == "yes") {
	           $("#idCheckStatus").css({'display':'inline', 'color':'blue'});
	           $("#idCheckStatus").html("<b>사용가능</b>");
	           isIDCheck = true;
	       }else {
	           $("#idCheckStatus").css({'display':'inline', 'color':'red'});
	           $("#idCheckStatus").html("<b>사용불가능</b>");
	           isIDCheck = false;
	       }
	     }
	   });
	 });
});

</script>

<script>

  $(document).ready(function(){

    // 메일 인증코드 요청
    $("#btnAuthcode").on("click", function(){

      if($("#mem_email").val() == "") {
        alert("메일을 입력해주세요.");
        return;
      }


      $.ajax({
          url: '/email/send',
          type: 'get',
          dataType: 'text',
          data: {receiveMail : $("#mem_email").val()},
          success: function(result){
			        if(result = "success"){
                alert("메일이 발송되어, 인증코드를 확인바랍니다.");
              } else {
                alert("메일이 발송이 실패되어, 메일주소 확인 또는 관리자에게 문의 바랍니다.");
              }
          }
      });
    });

    let isAuthCode = false; // 메일인증확인 여부

    // 메일 인증확인
    $("#btnConfirmAuthcode").on("click", function(){

      let authCode = $("#mem_authcode").val();

      $.ajax({
        url: '/member/confirmAuthCode',
        type: 'post',
        dataType: 'text',
        data: {uAuthCode: authCode},
        success: function(result){

          if(result == "success"){
              alert("인증번호 확인 완료");
              isAuthCode = true;
          }else if(result == "fail"){
              alert("인증번호가 틀렸습니다. \n 다시 진행해주세요.");
              isAuthCode = false;
          }
        }
      });
    });
  });

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