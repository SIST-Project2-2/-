<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 회원탈퇴</title>
</head>
<body>
	<div class="container">
		<h1 class="font-weight-bold text-left">회원탈퇴</h1>
		<div class="row  text-center">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h3>탈퇴하기</h3>
				<p class="border border-dark bg-dark text-dark" style="padding: 3px;"></p>
				<h6>정말로 탈퇴하실껀가요</h6>
				<div class="row">
					<div class="col-md-6">
						<a href="../index.jsp" class="btn btn-dark btn-block">네</a>
					</div>
					<div class="col-md-6">
						<a href="myprofile_info.jsp" class="btn btn-dark btn-block">아니오</a>
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>