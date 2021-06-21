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