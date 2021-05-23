<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="container text-center">
		<div class="row">
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