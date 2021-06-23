/*관리자 - 아티스트 수정*/
function artistUpdateFormCheck() {
	var name = document.getElementById("artist_name");
	var content = document.getElementById("content_text");

	if (name.value == "") {
		alert("이름을 입력해주세요");
		name.focus();
		return false;
	} else if (content.value == "") {
		alert("내용을 입력해주세요");
		name.focus();
		return false;
	} else if (img.value == "") {
		alert("이름을 입력해주세요");
		name.focus();
		return false;
	} else if (simg.value == "") {
		alert("이름을 입력해주세요");
		name.focus();
		return false;
	} else {
		admin_artist_edit.submit();
	}

	$(document).ready(function() {
		$("input[type='file']").on("change", function() {
			if (window.FileReader) {
				var filename = $(this)[0].files[0].name;
				$("#fname").text("").text(filename);
			}
		});
	});
}

/*관리자 - 댓글 관리*/
$(document).ready(function() {
	// 검색 카테고리 클릭시 카테고리 바뀜
	$(".admin_artist_comment #category_id").click(function() {
		$("#category_dropdown").html("ID");
		$("#category").val("id");
	})
	$(".admin_artist_comment #category_content").click(function() {
		$("#category_dropdown").html("내용");
		$("#category").val("content");
	})

	// 검색 버튼 클릭시 submit
	$(".admin_artist_comment #btn_search").click(function() {
		admin_artist_comment_search_form.submit();
	})

	// 정렬방식을 유지하면서 아티스트 변경
	$(".admin_artist_comment #artist_select").change(function() {
		inputs["artist"] = $(this).val();
		location.href = getUrl(url, inputs);
	});

	// 아티스트를 유지하면서 정렬방식 변경
	$(".admin_artist_comment #order").change(function() {
		inputs["order"] = $(this).val();
		location.href = getUrl(url, inputs);
	});

	// 삭제 버튼 클릭시 팝업
	$('.admin_artist_comment #deleteModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget)
		var recipient = button.data('whatever'); // 게시글 번호
		var modal = $(this);

		modal.find('.modal-title').text(+recipient + '번 게시글');

		modal.find('#btn_ok').click(function() {
			$.ajax({
				type: "get",
				url: "admin_artist_comment_delete.jsp?no=" + recipient,
				dataType: "text",
				success: function(res) {
					if ($.trim(res) == "true") { // 삭제 성공시 페이지 새로고침
						location.reload();
					} else {
						alert("error");
						// 에러 페이지 이동
					}
				}
			})
		})
	})
})

// 현 파라미터를 유지하면서 페이지 이동을 위해 url을 반환하는 함수
function getUrl(url, inputs) {
	url += "?";
	delete inputs["pageNumber"];
	delete inputs["search"];
	for (key in inputs) {
		url += key + "=" + inputs[key] + "&";
	}
	return url.substr(0, url.length - 1);
}

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