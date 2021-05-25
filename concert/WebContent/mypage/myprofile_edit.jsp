<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 프로필 수정</title>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var personal_code = document
								.getElementById("personal_code");
						var serial_code = document
								.getElementById("serial_code");

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
							text += document.getElementById("id").value;
							text += document.getElementById("nickname").value;
							text += document.getElementById("surname").value;
							text += "&lt;&lt;";
							text += document.getElementById("given_name").value;
							for (var i = 0; i < 100; i++) {
								text += "&lt;";
							}
							personal_code.innerHTML = text;
						}
					})
</script>
</head>
<body>
	<form action="#">
		<div class="container">
			<h1 class="font-weight-bold text-left">프로필 수정</h1>
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
									<input type="text" class="form-control" value="rkdwlstmf1" placeholder="아이디" id="id" disabled>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<p>닉네임</p>
									<div class="input-group">
										<input type="text" class="form-control" value="무아무아루" placeholder="닉네임" name="nickname" id="nickname" required="required">
										<div class="input-group-append">
											<button class="btn btn-primary">중복확인</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<p>성/Surname</p>
									<input type="text" class="form-control" value="KANG" placeholder="성/Surname" name="surname" id="surname" required="required">
								</div>
								<div class="col-md-6">
									<p>주소/Address</p>
									<input type="text" class="form-control" value="대구 북구 서변동 4933-24번지" placeholder="주소/Address" name="address" id="address" required="required">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<p>이름/Given name</p>
									<input type="text" class="form-control" value="JINSEU" placeholder="이름/Given name" name="given_name" id="given_name" required="required">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<p>생년월일/Date of birth</p>
									<input type="date" class="form-control" value="1997-08-11" placeholder="생년월일/Date of birth" name="birth_date" id="birth_date" required="required">
								</div>
								<div class="col-md-6">
									<p>예매날짜/Date of issue</p>
									<input type="date" class="form-control" value="2022-03-04" placeholder="예매날짜/Date of issue" name="issue_date" id="issue_date" required="required">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<p>휴대폰 번호/Phone number</p>
									<div class="input-group mb-3">
										<input type="tel" class="form-control" value="010-5258-7376" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-0000-0000" name="phone" id="phone" required="required">
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
							<p id="personal_code" class="text-nowrap overflow-hidden text-uppercase">Personal code</p>
							<p id="serial_code" class="text-nowrap overflow-hidden text-uppercase">Serial code</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-right mt-4">
					<button type="submit" class="btn btn-success">확인</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>