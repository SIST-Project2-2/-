<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아티스트 등록</title>
<script src="../../js/jquery.cookies.js"></script>
<script>
	$(document).ready(function() {
		// 임시저장 버튼 클릭
		$("#btn_set_temp").click(function() { // 30일간 저장되는 쿠키 생성
			$.cookie("admin_artist_name_tamp", $("#artist_name").val(), { expires: 30 });
			$.cookie("admin_artist_content_text_temp", $("#content_text").val(), { expires: 30 });
			
			alert("임시 저장이 완료되었습니다.");
		});

		// 임시저장 불러오기 버튼 클릭
		$("#btn_get_temp").click(function() { // 쿠키에 저장된 임시저장 데이터를 불러옴
			if (confirm("정말로 불러오시겠습니까?")) {
				$("#artist_name").val($.cookie("admin_artist_name_tamp"));
				$("#content_text").val($.cookie("admin_artist_content_text_temp"));
			}
		});
	});
</script>
</head>
<body class="admin_artist_add">
	<div class="body">
		<form name="admin_artist_add" action="admin_artist_add_process.jsp" method="post" enctype="multipart/form-data">
			<div class="top">
				<label id="add">아티스트 등록</label>
				<span id="button">
					<button type="button" class="btn btn-secondary" id="btn_set_temp">임시저장</button>
					<button type="button" class="btn btn-secondary" id="btn_get_temp">불러오기</button>
					<button id="btn_submit" type="button" class="btn btn-secondary" onclick="artistFormCheck()">등록하기</button>
				</span>
			</div>
			<div>
				<label>가수명</label>
			</div>
			<div>
				<input type="text" id="artist_name" name="artist_name" placeholder="가수명을 입력하세요">
			</div>
			<div id="content">
				<div>
					<img src="" class="mt-4" id="loadImg" style="width: 20%; height: 350px;" />
					<textarea id="content_text" name="content_text" placeholder="내용을 입력하세요"></textarea>
				</div>
				<input type="file" name="file" onchange="fileUpload(this)">
				<span id="span"></span>
			</div>
		</form>
	</div>
</body>
</html>