'use strict';


/*패스워드 확인*/
function passCheck(){
        let pw = document.getElementById("pw").value;
        let cpass = document.getElementById("cpass").value;
        let msg = document.getElementById("msg");

        if(pw!="" && cpass!=""){
			
        if(pw === cpass){
            msg.innerHTML="패스워드가 일치합니다"
        }else{
            msg.innerHTML="패스워드가 일치하지 않습니다"
            cpass.value="";
            cpass.focus;
        }
    }
}

function home(){
    alert("회원가입이 완료되었습니다.");
}
