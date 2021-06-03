<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 콘서트 등록</title>
</head>
<body>
<form name="concert_list" action="./admin_concert_action.jsp" method="post">
	<div class="container border border-dark rounded pt-2">
		<div class="row m-1">
			<div class="col-md">
				<h3>콘서트 등록</h3>
			</div>
			<div class="col-md-4 text-right">
				<button class="btn btn-outline-dark">임시저장</button>
				<button class="btn btn-outline-dark" type="submit" >등록하기</button>
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
					<input type="text" class="form-control" placeholder="제목을 입력하세요" name="title" id="title">
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
						<textarea class="form-control border-0" style="height: 600px;" placeholder="내용을 입력하세요" name="content" id="content"></textarea>
					</div>
				</div>
			</div>

	</div>
	</form>
</body>
</html>