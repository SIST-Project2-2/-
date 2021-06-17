<%@page import="concert.Commons"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
String id = (String) session.getAttribute("id");

if (id != null) {
	MemberVO member = new MemberVO();
	member.setId(id);

	MemberDAO memberDAO = new MemberDAO();
	member = memberDAO.get_profile(member.getId());

	boolean hasWithdrawn = memberDAO.hasWithdrawn(id);
%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 프로필 보기</title>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						generate_profile();
						generate_personal_code();
						generate_serial_code();

						function generate_profile() {
							var id = $("p#id");
							var nickname = $("#nickname");
							var surname = $("#surname");
							var given_name = $("#given_name");
							var address = $("#address");
							var birth_date = $("#birth_date");
							var issue_date = $("#issue_date");
							var phone = $("#phone");

							id.text("<%=member.getId()%>");
							$("input#id").val("<%=member.getId()%>");
							nickname.text("<%=member.getNickname()%>");
							given_name.text("<%=member.getFirst_name()%>");
							surname.text("<%=member.getLast_name()%>");
							address.text("<%=member.getAddress()%>");
							birth_date.text("<%=member.getBirth_date()%>");
							issue_date.text("<%=member.getBirth_date()%>");
							phone.text("<%=member.getPhone()%>");
						}

						function generate_serial_code() {
							var serial_code = document
									.getElementById("serial_code");
							var text = "";
							// 임의로 만든 시리얼 코드. 무작위 코드로 변환이 필요함
							text += "M238905890239849085973297501M379823948902734974932V48052385324";
							for (var i = 0; i < 100; i++) {
								text += "&lt;";
							}
							serial_code.innerHTML = text;
						}

						function generate_personal_code() {
							var personal_code = document
									.getElementById("personal_code");
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

					});
</script>
</head>
<body>
	<div class="container">
		<h1 class="font-weight-bold text-left">프로필 보기</h1>
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
								<small>ID</small>
								<p class="font-weight-bold" id="id">rkdwlstmf1</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<small>닉네임</small>
								<p class="font-weight-bold" id="nickname">무아무아루</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<small>성/Surname</small>
								<p class="font-weight-bold" id="surname">KANG</p>
							</div>
							<div class="col-md-6">
								<small>주소/Address</small>
								<p class="font-weight-bold" id="address">대구 북구 서변동 4933-24번지</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<small>이름/Given name</small>
								<p class="font-weight-bold" id="given_name">JINSEUL</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<small>생년월일/Date of birth</small>
								<p class="font-weight-bold" id="birth_date">11 AUG 1997</p>
							</div>
							<div class="col-md-6">
								<small>예매날짜/Date of issue</small>
								<p class="font-weight-bold" id="issue_date">04 MAY 2022</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<small>휴대폰 번호/Phone number</small>
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
				<a href="change_password.jsp" class="btn btn-secondary">비밀번호 변경</a>
				<a href="myprofile_edit.jsp" class="btn btn-secondary">수정하기</a>
				<%
					//
				if (hasWithdrawn) {
					out.write("<a href='withdrawal_cancle_action.jsp' class='btn btn-danger'>탈퇴취소</a>");
				} else {
					out.write("<a href='withdrawal.jsp' class='btn btn-danger'>탈퇴하기</a>");
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>
<%
	//
} else {
	out.write(Commons.getNeedLoginMsg());
}
%>