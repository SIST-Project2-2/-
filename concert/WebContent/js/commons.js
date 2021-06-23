/*관리자 - 아티스트 등록: 글쓰기 폼체크*/
function artistFormCheck() {
	var name = document.getElementById("artist_name");

	if (name.value == "") {
		alert("이름을 입력해주세요");
		name.focus();
		return false;
	} else {
		admin_artist_add.submit();
	}
}
function fileUpload(fis) {
	var str = fis.value;
	$('#span').text(fis.value.substring(str.lastIndexOf("\\") + 1));
	// 이미지를 변경한다.
	var reader = new FileReader();
	reader.onload = function(e) {
		$('#loadImg').attr('src', e.target.result);
	}
	reader.readAsDataURL(fis.files[0]);
}

/*메인 페이지 섬 클릭 */
function clickFunction(name) {
	if (name == 'jang') {
		document.getElementById("alert1").style.display = "none";
	} else if (name == 'iu') {
		document.getElementById("alert2").style.display = "none";
	} else if (name == 'jan') {
		document.getElementById("alert3").style.display = "none";
	} else if (name == 'cm') {
		document.getElementById("alert4").style.display = "none";
	} else if (name == 'hyun') {
		document.getElementById("alert5").style.display = "none";
	}
}


function login(id, pw) {
	var result;
	$.ajax({
		url: "login_ajax.jsp",
		method: "POST",
		async: false,
		data: {
			"id": id,
			"pw": pw,
			id_store: $("#id_store").is(":checked") ? "on" : "off",
			auto_login: $("#auto_login").is(":checked") ? "on" : "off"
		},
		success: function(data) {
			result = data;
		}
	});
	return result;
}