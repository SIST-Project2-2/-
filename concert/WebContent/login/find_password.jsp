<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="row">
		<div class="container col-sm-6">
			<form class="text-center" action="find_password_action.jsp" method="post">
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
					<input type="tel" class="form-control" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-0000-0000" name="phone"
						id="phone" required>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block text-white bg-dark border-dark">비밀번호 찾기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>