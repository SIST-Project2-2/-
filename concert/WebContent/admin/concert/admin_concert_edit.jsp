<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 콘서트 수정</title>
<script type="text/javascript">
	window.onload = function() {
		var artist = document.getElementById("artist");
		var date = document.getElementById("date");
		var count = document.getElementById("count");

		for (var i = 1; i < artist.length; i++) {
			artist.options[i].selected = false;
		}
		artist.options[1].selected = true;

		date.value = "2021-05-30";

		for (var i = 1; i < count.length; i++) {
			count.options[i].selected = false;
		}
		count.options[1].selected = true;

	}
</script>
</head>
<body>
	<div class="container border border-dark rounded">
		<div class="row my-3">
			<div class="col-md">
				<h3>콘서트 수정</h3>
			</div>
			<div class="col-md-4 text-right">
				<button class="btn btn-outline-dark">임시저장</button>
				<button class="btn btn-outline-dark">등록하기</button>
			</div>
		</div>

		<div class="row m-1">
			<div class="col-md-2">
				<h6>가수</h6>
			</div>
			<div class="col-md-3">
				<h6>날짜</h6>
			</div>
			<div class="col-md-2">
				<h6>지역</h6>
			</div>
		</div>
		<form>
			<div class="row m-1">
				<div class="col-md-2">
					<select class="custom-select" name="artist" id="artist" required="required">
						<option selected="selected">가수 선택</option>
						<option value="장범준">장범준</option>
						<option value="잔나비">잔나비</option>
						<option value="현아">현아</option>
						<option value="아이유">아이유</option>
						<option value="10cm">10cm</option>
					</select>
				</div>
				<div class="col-md-3">
					<input type="date" class="form-control" name="date" id="date" required="required">
				</div>
				<div class="col-md-2">
					<select class="custom-select" name="location" id="location">
						<option selected="selected">지역</option>
						<option value="서울">서울</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청도">충청도</option>
						<option value="경상도">경상도</option>
						<option value="전라도">전라도</option>
					</select>
				</div>
			</div>
			<div class="row m-1">
				<div class="col-md">
					<input type="text" class="form-control" placeholder="제목을 입력하세요">
				</div>
			</div>
			<div class="row m-1">
				<div class="col-md">
					<div class="border rounded p-3 mb-2">
						<div class="btn-group mt-2">
							<button type="button" class="btn btn-outline-dark">Text</button>
							<button type="button" class="btn btn-outline-dark">이미지 삽입</button>
						</div>
						<hr>
						<textarea class="form-control border-0" style="height: 600px;" placeholder="내용을 입력하세요"></textarea>
					</div>
				</div>
			</div>

		</form>
	</div>
</body>
</html>