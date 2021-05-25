'use strict';
<!--  -->
/* 아이디 창 : 다음 버튼 누르면 패스워드 입력 창으로 이동*/
function passPage()  {
        window.location.href = "http://localhost:9000/concert/join/join_pass.html";
  }
/* 패스워드 창 : 다음 버튼 누르면 이름,주소 등록 창으로 이동*/
function namePage(){
        window.location.href = "http://localhost:9000/concert/join/join_name.html";
}
/*이름, 주소 입력창 누르면 휴대폰번호 등록창으로 이동 */
function hpPage(){
        window.location.href = "http://localhost:9000/concert/join/join_hp.html";
}
/*다음 버튼 누르면 생년월일 등록창으로 이동*/
function birthPage(){
        window.location.href = "http://localhost:9000/concert/join/join_birth.html";
}
/*다음 버튼 누르면 프로필 등록창으로 이동*/
function profilePage(){
        window.location.href = "http://localhost:9000/concert/join/join_profile.html"
}
function home(){
    alert("회원가입이 완료되었습니다.");
}

/*패스워드 확인*/
function passCheck(){
        let pass = document.getElementById("pass").value;
        let cpass = document.getElementById("cpass").value;
        let msg = document.getElementById("msg");

        if(pass!=""&&cpass!=""){
        if(pass === cpass){
            msg.innerHTML="패스워드가 일치합니다"
        }else{
            msg.innerHTML="패스워드가 일치하지 않습니다"
            cpass.value="";
            cpass.focus;
        }
    }
}

// /*아이디 중복확인*/ 
// function idCheck(){
    
// }

