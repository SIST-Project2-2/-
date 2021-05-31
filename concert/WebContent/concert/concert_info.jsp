<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3 class="clearfix col-9 d-inline-block float-lfet">장범준</h3>
			<div class="clearfix col-9">

				<div class="border " style="height: 5000px">
					<img>
				</div>
			</div>

			<div class="border col-3">

				<h3 class="text-center" style="margin: 50px 0;">예매하기</h3>
				<ul class="float-lfet" style="padding-left: 20px;">
					<li style="margin-bottom: 10px;">
						<div class="row text-left">
							<div>
								<small class="d-block text-left text-dark">가수</small> <select class="form-control-sm">
									<optgroup label="가수">
										<option>장범준</option>
										<option>잔나비</option>
										<option>10cm</option>
										<option>현아</option>
										<option>아이유</option>
									</optgroup>
								</select>
							</div>
						</div>
					</li>
					<li style="margin-bottom: 10px;">
						<div class="row text-left">
							<div>
								<small class="d-block text-left text-dark">날짜</small> <select class="form-control-sm">
									<optgroup label="날짜">
										<option>21년 05월 30일 대구 콘서트</option>
										<option>21년 06월 04일 부산 콘서트</option>
										<option>21년 06월 06일 전북 콘서트</option>
										<option>21년 06월 09일 서울 콘서트</option>
									</optgroup>
								</select>
							</div>
						</div>
					</li>
					<li">
						<div class="row text-left">
							<div class="">
								<small class="d-block text-left text-dark">인원수</small> <select style="margin-bottom: 5px;"form-control-sm">
									<optgroup label="인원수">
										<option>성인1명</option>
										<option>성인2명</option>
										<option>성인3명</option>
										<option>성인4명</option>
									</optgroup>
								</select>
								<p class="text-danger" style="margin-bottom: 0; font-size: 12px">코로나 상황으로 인해 5인 이상 예매 불가능 합니다.</p>
							</div>
						</div>
					</li>
				</ul>
				<button class="container btn btn-light " type="button">좌석고르기</button>
			</div>
		</div>
	</div>
</body>
</html>

