/* 회원가입 */
 
   // html문서와 내용을 브라우저가 읽고 난 이후에 동작되는 특징
   $(document).ready(function(){

    let joinForm = $("#joinForm");

    // 회원정보 저장하기
    $("#joinSend").on("click", function(){
      
      console.log("회원가입");
      
      //유효성 검사작업 해야 함


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