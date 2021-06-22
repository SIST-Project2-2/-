<%@page import="concert.Commons"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
String id = (String) session.getAttribute("id");

if (id != null) {
	MemberDAO memberDAO = new MemberDAO();
	MemberVO member = memberDAO.get_profile(id);
%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 프로필 수정</title>
<script type="text/javascript">
	$(document).ready(function() {
		bsCustomFileInput.init();
		generate_personal_code();
		generate_serial_code();

		$("#check_nickname").on("click", function() {
			check_nickname();
		});

		function check_nickname() {
			var nickname = $("#nickname").val();
			$.get("check_nickname.jsp?nickname=" + nickname, function(data, status) {
				if (data == 1) {
					alert("이미 존재하는 닉네임입니다.");
				} else if (data == 0) {
					alert("변경할 수 있는 닉네임입니다.");
				}
			});
		}

		function generate_serial_code() {
			var serial_code = document.getElementById("serial_code");
			var text = "";
			// 임의로 만든 시리얼 코드. 무작위 코드로 변환이 필요함
			text += "M238905890239849085973297501M379823948902734974932V48052385324";
			for (var i = 0; i < 100; i++) {
				text += "&lt;";
			}
			serial_code.innerHTML = text;
		}

		function generate_personal_code() {
			var personal_code = document.getElementById("personal_code");
			var text = "";
			text += $("#id").val();
			text += $("#nickname").val();
			text += $("#surname").val();
			text += "&lt;&lt;";
			text += $("#given_name").val();
			for (var i = 0; i < 100; i++) {
				text += "&lt;";
			}

			personal_code.innerHTML = text;
		}
	});
</script>
<script src="/concert/js/bs-custom-file-input.min.js"></script>
</head>
<body>
	<form name="edit_form" action="myprofile_edit_action.jsp" method="post" enctype="multipart/form-data">
		<div class="container">
			<h1 class="font-weight-bold text-left">프로필 수정</h1>
			<div class="row">
				<div class="col-md-12 container border overflow-hidden" style="border-radius: 15px;">
					<div class="row">
						<div class="col-md-12 bg-info text-center">대 한 민 국 REPUBLIC OF KOREA</div>
					</div>
					<div class="row">
						<div class="col-md-4 font-weight-bold">여권 PASSPORT</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<img class="w-100" alt="" src="<%=member.getSimg() == null ? "../images/장범준.jpg" : "/concert/upload/" + member.getSimg()%>">
						</div>
						<div class="col-md-8">
							<div class="row">
								<div class="col-md-6">
									<small>ID</small>
									<input type="text" class="form-control" value="<%=member.getId()%>" placeholder="아이디" id="id" name="id" style="display: none;">
									<input type="text" class="form-control" value="<%=member.getId()%>" placeholder="아이디" id="id_fake" disabled>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<small>닉네임</small>
									<div class="input-group">
										<form action="check_nickname.jsp" method="get">
											<input type="text" class="form-control" value="<%=member.getNickname()%>" placeholder="닉네임" name="nickname" id="nickname" required="required">
											<div class="input-group-append">
												<button class="btn btn-primary" id="check_nickname" type="button">중복확인</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<small>성/Surname</small>
									<input type="text" class="form-control" value="<%=member.getLast_name()%>" placeholder="성/Surname" name="surname" id="surname" required="required">
								</div>
								<div class="col-md-6">
									<small>주소/Address</small>
									<input type="text" class="form-control" value="<%=member.getAddress()%>" placeholder="주소/Address" name="address" id="address" required="required">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<small>이름/Given name</small>
									<input type="text" class="form-control" value="<%=member.getFirst_name()%>" placeholder="이름/Given name" name="name" id="given_name" required="required">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<small>생년월일/Date of birth</small>
									<input type="date" class="form-control" value="<%=member.getBirth_date()%>" placeholder="생년월일/Date of birth" name="birth_date" id="birth_date" required="required">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<small>휴대폰 번호/Phone number</small>
									<div class="input-group mb-3">
										<input type="tel" class="form-control" value="<%=member.getPhone()%>" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-0000-0000" name="phone" id="phone" required="required">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="input-group mb-3">
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="img" name="img">
											<label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02"><%=member.getImg() == null ? "이미지를 업로드하세요" : member.getImg()%></label>
										</div>
									</div>
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
<%
	//
} else {
	out.write(Commons.getNeedLoginMsg());
}
%>