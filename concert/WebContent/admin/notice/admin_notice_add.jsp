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
	
	$(document).ready(function() {
		
		$("#btn_add").click(function() {
			$("#content_hidden").val($("#content").html());
			var form = $("#admin_notice_add_form")[0];
			var formData = new FormData(form);
			
			$.ajax({
				url: "admin_notice_add_action.jsp",
				type: "POST",
				enctype: "multipart/form-data",
				contentType: false, // false로 선언해야 multipart/form-data로 전송됨
				processData: false, // false로 선언시 formData를 string 형식으로 변환하지 않음
				dataType: "text",
				data: formData,
				success: function(result) {
					
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
			document.execCommand("bold", false, true)
		});
		
		// italic 버튼 클릭
		$("#btn_italic").click(function() {
			document.execCommand("italic", false, true);
		});
		
		// 밑줄 버튼 클릭
		$("#btn_underline").click(function() {
			document.execCommand("underline", false, true);
		});
		
		$("#content").click(function() {
			checkCss($(this));
		});
		
		$("#content span").click(function() {
			checkCss($(this));
		});
		
		$("#content div").click(function() {
			checkCss($(this));
		});
	});
	
	function checkCss(element) {
		if(element.css("font-weight") == "700") { // 700 = bold
			$("#btn_bold").attr("class", "btn px-1 py-0 btn-secondary");
		}else {
			$("#btn_bold").attr("class", "btn px-1 py-0");
		}
	}
</script>
<style>
#content {
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
		<form name="admin_notice_add_form" id="admin_notice_add_form" method="post" action="./admin_notice_add_action.jsp" enctype="multipart/form-data" >		
			<%--top 영역--%>
			<div class="clearfix pt-3">
				<h3 class="d-inline-block float-lfet ">공지사항 등록</h3>
				<button type="button" class="btn btn-light float-right" id="btn_set_temp">임시저장</button>
				<button type="button" class="btn btn-light float-right" id="btn_add">등록하기</button>
			</div>
			
			<%--컨텐츠 영역--%>
			<div class="h-100 ">
				<input type="text" class="w-50 mb-1" placeholder="태그(키워드)를 입력하세요" name="tag" id="tag">
				<input type="text" class="w-100" placeholder="제목을 입력하세요" name="title" id="title">
				<div class="h-100">
					<!-- 
					<div class="btn-group pt-3">
						<button type="button" class="btn btn-secondary btn btn-light float-righ" id="btn_text">Text</button>
						<button type="button" class="btn btn-secondary btn btn-light float-righ" id="btn_image">이미지 삽입</button>
					</div>
					-->
					<hr>
					<!-- <textarea class="w-100" placeholder="내용을 입력하세요"
						style="height: 500px;" name="content" id="content"></textarea>
					 -->
					 
					<div class="container-md">
						<div class="row mb-2 justify-content-end">
							<label class="my-auto pr-1" style="font-size:15px">이미지 선택:</label>
							<input type="file" name="img" id="img" class="w-80 border border-secondary rounded" style="padding:2px; font-size:12px;">
						</div>
					</div>
					<div class="container-md px-0 border border-secondary">
						<div class="row m-0 p-0 bg-light border-bottom border-secondary">
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