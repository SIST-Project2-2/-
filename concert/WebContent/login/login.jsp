<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="http://localhost:9000/concert/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/concert/css/bootstrap.min.css">
<link rel="stylesheet" href="http://localhost:9000/concert/css/commons.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="row">
		<div class="container col-sm-6">
			<form class="text-center" action="#" method="get">
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