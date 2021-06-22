'use strict';


/*패스워드 확인*/
function passCheck(){
        let pw = document.getElementById("pw").value;
        let cpass = document.getElementById("cpass").value;
        let msg = document.getElementById("msg");
		
		var btn = document.getElementById("passBtn");
		btn.disabled = 'disabled';
			
        if(pw!="" && cpass!=""){
			
        if(pw === cpass){
            msg.innerHTML="패스워드가 일치합니다"
			msg.style.color="green";
			btn.disabled = false;
        }else{
            msg.innerHTML="패스워드가 일치하지 않습니다"
			btn.disabled = 'disabled';
			msg.style.color = "red";
            cpass.value="";
            cpass.focus;
 		 	
        }
    }
}

function home(){
    alert("회원가입이 완료되었습니다.");
}


//성별 카운트 체크
function check_count(gender) {
	var gender_list = $("input[name='gender']:checked");

	var count = 0;
	for (var i = 0; i < gender_list.length; i++) {
		if (gender_list[i].checked) {
			count++;
		}
	}
	return count;
}

//주소검색 API
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출
		var pop = window.open("/concert/join/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(roadAddrPart1, addrDetail) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록

		let addr = document.querySelector("#addr");
		let daddr = document.querySelector("#daddr");

		//주소,상새주소 input칸에 주소검색API에서 찾은 데이터 value 값 넣기
		addr.value = roadAddrPart1;
		daddr.value = addrDetail;
}


function checkValidDate(value) {
	var result = true;
	try {
	    var date = value.split("-");
	    var y = parseInt(date[0], 10),
	        m = parseInt(date[1], 10),
	        d = parseInt(date[2], 10);
	    
	    var dateRegex = /^(?=\d)(?:(?:31(?!.(?:0?[2469]|11))|(?:30|29)(?!.0?2)|29(?=.0?2.(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00)))(?:\x20|$))|(?:2[0-8]|1\d|0?[1-9]))([-.\/])(?:1[012]|0?[1-9])\1(?:1[6-9]|[2-9]\d)?\d\d(?:(?=\x20\d)\x20|$))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\x20[AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;
	    result = dateRegex.test(d+'-'+m+'-'+y);
	} catch (err) {
		result = false;
	}    
    return result;
}
