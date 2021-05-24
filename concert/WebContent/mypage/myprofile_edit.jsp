<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="http://localhost:9000/concert/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/concert/css/bootstrap.min.css">
<link rel="stylesheet" href="http://localhost:9000/concert/css/commons.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="container">
		<p class="font-weight-bold text-left" style="font-size: 40px;">마이페이지</p>
		<div class="row">
			<div class="col-md-12 container border overflow-hidden" style="border-radius: 15px;">
				<div class="row">
					<div class="col-md-12 bg-info text-center">대 한 민 국 REPUBLIC OF KOREA</div>
				</div>
				<div class="row">
					<div class="col-md-4 font-weight-bold">여권 PASSPORT</div>
					<div class="col-md-4"></div>
					<div class="col-md-4">여권번호/Passport number</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<img class="w-100" alt="" src="../images/장범준.jpg">
					</div>
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-6">
								<p>ID</p>
								<input type="text" class="form-control" value="rkdwlstmf1" placeholder="성/Surname" disabled>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>닉네임</p>
								<div class="input-group">
									<input type="text" class="form-control" value="무아무아루" placeholder="닉네임">
									<div class="input-group-append">
										<button class="btn btn-primary">중복확인</button>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>성/Surname</p>
								<input type="text" class="form-control" value="KANG" placeholder="성/Surname">
							</div>
							<div class="col-md-6">
								<p>주소/Address</p>
								<input type="text" class="form-control" value="대구 북구 서변동 4933-24번지" placeholder="주소/Address">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>이름/Given name</p>
								<input type="text" class="form-control" value="JINSEU" placeholder="이름/Given name">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>생년월일/Date of birth</p>
								<input type="date" class="form-control" value="1997-08-11" placeholder="생년월일/Date of birth">
							</div>
							<div class="col-md-6">
								<p>예매날짜/Date of issue</p>
								<input type="date" class="form-control" value="2022-03-04" placeholder="예매날짜/Date of issue">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>휴대폰 번호/Phone number</p>
								<div class="input-group mb-3">
									<input type="text" class="form-control" value="010">
									<span class="input-group-text">-</span>
									<input type="text" class="form-control" value="5258">
									<span class="input-group-text">-</span>
									<input type="text" class="form-control" value="7376">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<a href="myticketlist.jsp" class="btn btn-light">예매내역 확인</a>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<p>WEKVOSXOEMWO&lt;&lt;DJFIWMD:PS&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;</p>
						<p>M238905890239849085973297501M379823948902734974932V48052385324</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-right mt-4">
				<a href="myprofile_info.jsp" class="btn btn-success">확인</a>
			</div>
		</div>
	</div>
</body>
</html>