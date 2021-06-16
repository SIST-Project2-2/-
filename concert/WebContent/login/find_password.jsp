<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#form").on("submit", function() {
			$.ajax({
				url : "reset_password_action.jsp",
				method : "POST",
				async : false,
				data : {
					"id" : $("#id").val(),
					"last_name" : $("#last_name").val(),
					"first_name" : $("#first_name").val(),
					"birth_date" : $("#birth_date").val(),
					"phone" : $("#phone").val()
				},
				success : function(data) {
					if (data == "null") {
						alert("잘못된 입력입니다.");
					} else {
						alert("비밀번호: " + data);
						location.href = "/concert/login/login.jsp";
					}
				}
			});
			return false;
		});
	});
</script>
</head>
<body>
	<div class="row">
		<div class="container col-sm-6">
			<form id="form" class="text-center" action="#" method="post">
				<div class="form-group">
					<label class="font-weight-bold" style="font-size: 40px;">비밀번호 찾기</label>
					<p class="border border-dark bg-dark text-dark" style="padding: 3px;"></p>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" id="id" name="id" required>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="성" id="last_name" name="last_name" required>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름" id="first_name" name="first_name" required>
				</div>
				<div class="form-group">
					<input type="date" class="form-control" placeholder="생년월일" id="birth_date" name="birth_date" required>
				</div>
				<div class="form-group">
					<input type="tel" class="form-control" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-0000-0000" name="phone" id="phone" required>
				</div>
				<div class="form-group">
					<button id="btn_submit" type="submit" class="btn btn-primary btn-block text-white bg-dark border-dark">비밀번호 찾기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>