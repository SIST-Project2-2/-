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
<script type="text/javascript">
	window.onload = function() {

		var personal_code = document.getElementById("personal_code");
		var serial_code = document.getElementById("serial_code");

		generate_personal_code();
		generate_serial_code();

		function generate_serial_code() {
			var text = "";
			// 임의로 만든 시리얼 코드. 무작위 코드로 변환이 필요함
			text += "M238905890239849085973297501M379823948902734974932V48052385324";
			for (var i = 0; i < 100; i++) {
				text += "&lt;";
			}
			serial_code.innerHTML = text;
		}
		function generate_personal_code() {

			var text = "";
			text += document.getElementById("id").innerHTML;
			text += document.getElementById("nickname").innerHTML;
			text += document.getElementById("surname").innerHTML;
			text += "&lt;&lt;";
			text += document.getElementById("given_name").innerHTML;
			for (var i = 0; i < 100; i++) {
				text += "&lt;";
			}

			personal_code.innerHTML = text;
		}
	}
</script>
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
								<p class="font-weight-bold" id="id">rkdwlstmf1</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>닉네임</p>
								<p class="font-weight-bold" id="nickname">무아무아루</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>성/Surname</p>
								<p class="font-weight-bold" id="surname">KANG</p>
							</div>
							<div class="col-md-6">
								<p>주소/Address</p>
								<p class="font-weight-bold" id="address">대구 북구 서변동 4933-24번지</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>이름/Given name</p>
								<p class="font-weight-bold" id="given_name">JINSEUL</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>생년월일/Date of birth</p>
								<p class="font-weight-bold" id="birth_date">11 AUG 1997</p>
							</div>
							<div class="col-md-6">
								<p>예매날짜/Date of issue</p>
								<p class="font-weight-bold" id="issue_date">04 MAY 2022</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<p>휴대폰 번호/Phone number</p>
								<p class="font-weight-bold" id="phone">010-5258-7376</p>
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
						<p id="personal_code" class="text-nowrap overflow-hidden text-uppercase">Personal code</p>
						<p id="serial_code" class="text-nowrap overflow-hidden text-uppercase">Serial code</p>
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