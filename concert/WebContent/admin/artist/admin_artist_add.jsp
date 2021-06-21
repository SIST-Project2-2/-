<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/concert/css/admin_artist_add.css">
<script type="text/javascript">
	/*게시판 - 글쓰기 폼체크*/
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
</script>
</head>
<body>
	<div class="body">
		<form name="admin_artist_add" action="admin_artist_add_process.jsp" method="post" enctype="multipart/form-data">
			<div class="top">
				<label id="add">아티스트 등록</label> <span id="button">
					<button type="button" class="btn btn-secondary">임시저장</button>
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
					<div id="pofile_picture">프로필사진 등록</div>
					<textarea id="content_text" name="content_text" placeholder="내용을 입력하세요"></textarea>
				</div>
				<input type="file" name="file">
			</div>
		</form>
	</div>
</body>
</html>