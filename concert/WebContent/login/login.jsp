<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div class="container">
		<div class="container" style="width: 500px;">
			<form class="text-center" action="login_action.jsp" method="get">
				<div class="form-group">
					<label class="font-weight-bold" style="font-size: 40px;">로그인</label>
					<p class="border border-dark bg-dark text-dark" style="padding: 3px;"></p>
					<input type="text" class="form-control" placeholder="아이디" id="id" name="id" required="required">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" id="pw" name="pw" required="required">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block text-white bg-dark border-dark">로그인하기</button>
				</div>
				<div class="form-group">
					<a href="../join/join.jsp" class="btn btn-primary btn-block rounded-pill text-dark bg-white border-dark">계정이 없으신가요? 간편하게 가입하기</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>