<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아티스트 수정</title>
</head>
<body class="admin_artist_edit">
	<div class="body">
		<div class="top">
			<label id="add">아티스트 수정</label>
			<span id="button">
				<button type="button" class="btn btn-secondary">임시저장</button>
				<button type="button" class="btn btn-secondary">등록하기</button>
			</span>
		</div>
		<div>
			<label>가수명</label>
		</div>
		<div class="artist_name">권정열</div>
		<div id="content">
			<div>
				<div id="pofile_picture">프로필사진 등록</div>
				<textarea id="content_text" placeholder="내용을 입력하세요"></textarea>
			</div>
			<button type="button" class="btn btn-secondary">사진 선택</button>
		</div>
	</div>
</body>
</html>