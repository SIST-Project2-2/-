<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-콘서트 등록</title>
<script src="../../js/jquery.cookies.js"></script>
<script>
	document.execCommand("styleWithCSS", false, true); // 작성 중 style 변경 가능
	var selection = getSelection(); // 현 커서 위치 정보를 담는 객체
	
	$(document).ready(function() {
		
		// 등록하기 버튼 클릭
		$("#btn_add").click(function() {
			if($("#tag").val() == "" || $("#title").val() == "" || $("content").html() == "") {
				alert("작성을 완료해주세요.");
			}
			
			// div 태그인 content를 form으로 전송하기 위해 hidden 타입의 input 태그에 복사함 
			$("#content_hidden").val($("#content").html());
			
			var form = $("#admin_notice_add_form")[0];
			var formData = new FormData(form);
			
			$.ajax({ // post 형식으로 데이터를 넘겨줌
				url: "admin_notice_add_action.jsp",
				type: "POST",
				enctype: "multipart/form-data",
				contentType: false, // false로 선언해야 multipart/form-data로 전송됨
				processData: false, // false로 선언시 formData를 string 형식으로 변환하지 않음
				dataType: "text",
				data: formData,
				success: function(result) {
					location.href = "admin_notice_list.jsp";
				}
			});
		})
		
		// 임시저장 버튼 클릭
		$("#btn_set_temp").click(function() { // 30일간 저장되는 쿠키 생성
			$.cookie("notice_tag_temp", $("#tag").val(), { expires: 30 });
			$.cookie("notice_title_temp", $("#title").val(), { expires: 30 });
			$.cookie("notice_content_temp", $("#content").html(), { expires: 30 });
			alert("임시 저장이 완료되었습니다.");
		});
		
		// 임시저장 불러오기 버튼 클릭
		$("#btn_get_temp").click(function() { // 쿠키에 저장된 임시저장 데이터를 불러옴
			if(confirm("정말로 불러오시겠습니까?")) {
				$("#tag").val($.cookie("notice_tag_temp"));
				$("#title").val($.cookie("notice_title_temp"));
				$("#content").html($.cookie("notice_content_temp"));
			}
		});
		
		// bold 버튼 클릭
		$("#btn_bold").click(function() {
			// selection.collapse: 커서를 해당 위치로 이동시켜주는 함수
			// selection.anchorNode: 현재 커서 위치의 태그 텍스트 맨앞
			// selection.anchorOffset: 현재 커서 위치가 태그 내에서 몇 번째 위치인지
			// selection.collapse(selection.anchorNode, selection.anchorOffset-1)으로 하면 동작이 안되서 아래처럼 꼼수 쑴;
			selection.collapse(selection.anchorNode, selection.anchorOffset-1); 
			selection.collapse(selection.anchorNode, selection.anchorOffset+1);
			document.execCommand("bold", false, true)
			if($("#btn_bold").css("background-color") == "rgb(211, 211, 211)") { // rgb(211, 211, 211) = lightgray
				$("#btn_bold").css("background-color", "");
			}else {
				$("#btn_bold").css("background-color", "lightgray");
			}
		});
		
		// italic 버튼 클릭
		$("#btn_italic").click(function() {
			selection.collapse(selection.anchorNode, selection.anchorOffset-1);
			selection.collapse(selection.anchorNode, selection.anchorOffset+1);
			document.execCommand("italic", false, true);
			if($("#btn_italic").css("background-color") == "rgb(211, 211, 211)") {
				$("#btn_italic").css("background-color", "");
			}else {
				$("#btn_italic").css("background-color", "lightgray");
			}
		});
		
		// 밑줄 버튼 클릭
		$("#btn_underline").click(function() {
			selection.collapse(selection.anchorNode, selection.anchorOffset-1);
			selection.collapse(selection.anchorNode, selection.anchorOffset+1);
			document.execCommand("underline", false, true);
			if($("#btn_underline").css("background-color") == "rgb(211, 211, 211)") {
				$("#btn_underline").css("background-color", "");
			}else {
				$("#btn_underline").css("background-color", "lightgray");
			}
		});
		
		$("#select_font_size").change(function() {
			document.execCommand("fontSize", false, $("#select_font_size option:selected").val());
		});
		
		// 내용편집 커서 위치가 바뀔 때
		// 내용편집란 클릭시
		$("#content").click(function() {
			checkCss();
		});
		// 내용편집란에서 키 입력시
		$("#content").keyup(function(event) {
			checkCss();
		});
	});
	
	function checkCss() { // 현재 커서 위치의 css값을 확인하고, 텍스트 에디터 값을 그에 맞춘다.
		var styles = ["font-weight", "font-style", "text-decoration-line"]; // 확인할 style 값들
		var cursor = $(selection.anchorNode.parentNode).css(styles); // 현재 커서 위치의 태그를 불러오고, 그 태그의 css값을 확인
		
		// bold 확인
		if(cursor["font-weight"] == "700") { // 700 = bold
			$("#btn_bold").css("background-color", "lightgray");
		}else {
			$("#btn_bold").css("background-color", "");
		}
		
		// italic 확인
		if(cursor["font-style"] == "italic") {
			$("#btn_italic").css("background-color", "lightgray");
		}else {
			$("#btn_italic").css("background-color", "");
		}
		
		// underline 확인
		if(cursor["text-decoration-line"] == "underline") {
			$("#btn_underline").css("background-color", "lightgray");
		}else {
			$("#btn_underline").css("background-color", "");
		}
	}
</script>
<style>
#content { /* 적용한 태그를 textarea처럼 바꿔줌 */
	-moz-appearance: textfield-multiline;
	-webkit-appearance: textarea;
	font: medium -moz-fixed;
	font: -webkit-small-control;
	overflow: auto;
	padding: 2px;
	resize: both;
	outline: none;
}
</style>
</head>
<body>
	<div class="container">
		<form name="admin_notice_add_form" id="admin_notice_add_form">		
			<%--top 영역--%>
			<div class="clearfix pt-3">
				<h3 class="d-inline-block float-lfet ">공지사항 등록</h3>
				<button type="button" class="btn btn-light float-right" id="btn_set_temp">임시저장</button>
				<button type="button" class="btn btn-light float-right" id="btn_add">등록하기</button>
			</div>
			
			<%--컨텐츠 영역--%>
			<div class="h-100 ">
				<input type="text" class="form-control form-control-sm w-50 mb-1" placeholder="태그(키워드)를 입력하세요" name="tag" id="tag">
				<input type="text" class="form-control form-control-sm w-100" placeholder="제목을 입력하세요" name="title" id="title">
				<div class="h-100">
					<hr>
					<div class="container-md">
						<div class="row mb-2 justify-content-end">
							<label class="my-auto pr-1" style="font-size:15px">이미지 선택:</label>
							<input type="file" name="img" id="img" class="w-80 rounded" style="border:1px solid #ced4da; padding:2px; font-size:12px;">
						</div>
					</div>
					<div class="container-md px-0" style="border:1px solid #ced4da; font-size:10px">
						<div class="row m-0 p-0 bg-light" style="border-bottom:1px solid #ced4da">
							<button type="button" class="btn px-1 py-0" id="btn_bold" style="font-weight:bold">가</button>
							<button type="button" class="btn px-1 py-0" id="btn_italic" style="font-style:italic">가</button>
							<button type="button" class="btn px-1 py-0" id="btn_underline" style="text-decoration:underline">가</button>
							<button type="button" class="btn btn-primary px-1 py-0" id="btn_get_temp" style="font-size:11px">임시저장 불러오기</button>
						</div>
						<div class="m-0 p-2" id="content" contenteditable="true" style="height:400px"></div>
						<input type="hidden" name="content" id="content_hidden">
					</div>
				</div>
			</div>

		</form>
	</div>

</body>
</html>