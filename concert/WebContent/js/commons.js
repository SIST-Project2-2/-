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