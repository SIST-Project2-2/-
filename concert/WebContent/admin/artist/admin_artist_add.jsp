<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아티스트 등록</title>
</head>
<body class="admin_artist_add">
	<div class="body">
		<form name="admin_artist_add" action="admin_artist_add_process.jsp" method="post" enctype="multipart/form-data">
			<div class="top">
				<label id="add">아티스트 등록</label>
				<span id="button">
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