<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#form").on("submit", function() {
			$.ajax({
				url : "find_id_action.jsp",
				method : "POST",
				data : {
					first_name : $("#first_name").val(),
					last_name : $("#last_name").val(),
					email : $("#email").val()
				},
				success : function(result) {
					if (result == "null") {
						alert("아이디가 없습니다.");
					} else {
						alert("아이디: " + result);
						location.href = "/concert/login/login.jsp";
					}
				}
			});
			// submit 을 막기위한 false return
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
					<label class="font-weight-bold" style="font-size: 40px;">아이디 찾기</label>
					<p class="border border-dark bg-dark text-dark" style="padding: 3px;"></p>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="성" id="last_name" name="last_name" required>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름" id="first_name" name="first_name" required>
				</div>
				<div class="form-group">
					<input type="email" class="form-control" pattern="[a-zA-Z0-9_]+@[a-zA-Z0-9]+\.[a-z]{2,}$" placeholder="example@example.com" name="email" id="email" required>
				</div>
				<div class="form-group">
					<button id="btn_submit" type="submit" class="btn btn-primary btn-block text-white bg-dark border-dark">아이디 찾기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>