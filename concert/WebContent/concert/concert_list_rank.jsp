<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container text-center">

		<!-- 타이틀 부분 -->
		<h1 class="font-weight-bold text-left">예매 순위</h1>

		<!-- 월, 콤보 박스 있는 부분 -->
		<div class="d-flex justify-content-between mb-3">
			<div class="p-2">
				<h3>5월</h3>
			</div>
			<div class="p-2">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">보기 형태</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="concert_list_calendar.jsp">달 력</a>
						<a class="dropdown-item" href="concert_list_date.jsp">날 짜</a>
						<a class="dropdown-item" href="concert_list_rank.jsp">순 위</a>
					</div> 
				</div>
			</div>
		</div>
		<div class="mb-5">
			<div class="card border-0 justify-content-center d-inline-block" style="width: 18rem;">
				<img alt="" src="http://localhost:9000/concert/images/장범준.jpg" class="rounded-circle card-img-top">
				<div class="card-body">
					<h4 class="card-title font-weight-bold">장범준</h4>
					<p class="card-text">1,150 표</p>
				</div>
			</div>
		</div>
		<div class="mb-5">
			<div class="card border-0 justify-content-center d-inline-block" style="width: 15rem;">
				<img alt="" src="http://localhost:9000/concert/images/장범준.jpg" class="rounded-circle card-img-top">
				<div class="card-body">
					<h5 class="card-title font-weight-bold">장범준</h5>
					<p class="card-text">1,050 표</p>
				</div>
			</div>
		</div>
		<div class="mb-5">
			<div class="d-flex justify-content-around mb-3">
				<div class="card border-0 justify-content-center d-inline-block" style="width: 13rem;">
					<img alt="" src="http://localhost:9000/concert/images/장범준.jpg" class="rounded-circle card-img-top">
					<div class="card-body">
						<h6 class="card-title font-weight-bold">장범준</h6>
						<p class="card-text">950 표</p>
					</div>
				</div>
				<div class="card border-0 justify-content-center d-inline-block" style="width: 13rem;">
					<img alt="" src="http://localhost:9000/concert/images/장범준.jpg" class="rounded-circle card-img-top">
					<div class="card-body">
						<h6 class="card-title font-weight-bold">장범준</h6>
						<p class="card-text">850 표</p>
					</div>
				</div>
				<div class="card border-0 justify-content-center d-inline-block" style="width: 13rem;">
					<img alt="" src="http://localhost:9000/concert/images/장범준.jpg" class="rounded-circle card-img-top">
					<div class="card-body">
						<h6 class="card-title font-weight-bold">장범준</h6>
						<p class="card-text">750 표</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>