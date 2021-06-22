<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%
	// 비밀번호를 변경하는 페이지
String id = (String) session.getAttribute("id");

// 로그인 확인용으로 에러 발생시키기
id.charAt(0);
%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#form_change_password").on("submit", function() {

			var old_pw = $("#old_pw").val();
			var new_pw = $("#new_pw").val();
			var new_pw_chk = $("#new_pw_chk").val();

			if(new_pw != new_pw_chk){
				alert("새로운 비밀번호가 일치하지 않습니다.");
			}else{
				changePassword(new_pw, old_pw);
			}
			return false;
		});
	});
	function changePassword(new_pw, old_pw) {
		$.ajax({
			url : "change_password_action.jsp",
			method : "POST",
			data : {
				"new_pw" : new_pw,
				"old_pw" : old_pw
			},
			success : function(result) {
				if (result == 1) {
					alert("비밀번호 변경 완료.");
					location.href = "/concert/mypage/myprofile_info.jsp";
				} else {
					alert("입력한 비밀번호가 맞지 않습니다.");
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="container">
		<h1 class="font-weight-bold text-left">비밀번호 변경</h1>
		<form id="form_change_password" class="text-center" action="#" method="post">
			<div class="form-group">
				<p class="border border-dark bg-dark text-dark" style="padding: 3px;"></p>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="기존 비밀번호" id="old_pw" name="old_pw" required>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="새로운 비밀번호" id="new_pw" name="new_pw" required>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="새로운 비밀번호 확인" id="new_pw_chk" name="new_pw_chk" required>
			</div>
			<div class="form-group">
				<button id="btn_submit" type="submit" class="btn btn-primary btn-block text-white bg-dark border-dark">비밀번호 변경</button>
			</div>
		</form>
	</div>
</body>
</html>