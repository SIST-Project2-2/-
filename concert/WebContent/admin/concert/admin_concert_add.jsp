<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 콘서트 등록</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>


	<div class="container border border-dark rounded">
		<div class="row m-1">
			<div class="col-md">
				<h3>콘서트 등록</h3>
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
				<h6>인원수</h6>
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
					<select class="custom-select" name="count" id="count">
						<option selected="selected">인원 수</option>
						<option value="1">성인 1명</option>
						<option value="2">성인 2명</option>
						<option value="3">성인 3명</option>
						<option value="4">성인 4명</option>
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