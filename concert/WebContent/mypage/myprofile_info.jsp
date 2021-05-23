<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
								<p class="font-weight-bold">rkdwlstmf1</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>닉네임</p>
								<p class="font-weight-bold">무아무아루</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>성/Surname</p>
								<p class="font-weight-bold">KANG</p>
							</div>
							<div class="col-md-6">
								<p>주소/Address</p>
								<p class="font-weight-bold">대구 북구 서변동 4933-24번지</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>이름/Given name</p>
								<p class="font-weight-bold">JINSEUL</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>생년월일/Date of birth</p>
								<p class="font-weight-bold">11 AUG 1997</p>
							</div>
							<div class="col-md-6">
								<p>예매날짜/Date of issue</p>
								<p class="font-weight-bold">04 MAY 2022</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>휴대폰 번호/Phone number</p>
								<p class="font-weight-bold">010-5258-7376</p>
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
				<a href="myprofile_edit.jsp" class="btn btn-primary">수정하기</a> <a href="accountdelete.jsp" class="btn btn-danger">탈퇴하기</a>
			</div>
		</div>
	</div>
</body>
</html>