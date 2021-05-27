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
	<section class="container-md text-center" id="content_concert_list_date">

		<!-- 타이틀 부분 -->
		<h1 class="font-weight-bold text-left">날짜별</h1>

		<!-- 월, 콤보 박스 있는 부분 -->
		<div class="d-flex justify-content-between mb-3">
			<div class="p-2"></div>
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

		<!-- 날짜별 일정 -->
		<div class="row justify-content-center">
			<div class="col-md mx-3 border border-primary rounded">
				<div class="row bg-primary p-2 justify-content-center">
					<h4 class="text-white m-0">4월</h4>
				</div>
				<div class="row">
					<div class="container p-4">
						<div class="row">
							<p class="my-0 font-weight-bold">장범준</p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold">4월6일_대구</p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold">4월15일_부산</p>
						</div>
					</div>
					<div class="container p-4">
						<div class="row">
							<p class="my-0 font-weight-bold">잔나비</p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold">4월1일_서울</p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold">4월25일_부산</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md mx-3 border border-primary rounded">
				<div class="row bg-primary p-2 justify-content-center">
					<h4 class="text-white m-0">5월</h4>
				</div>
				<div class="row">
					<div class="container p-4">
						<div class="row">
							<p class="my-0 font-weight-bold">장범준</p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold">4월6일_대구</p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold">4월15일_부산</p>
						</div>
					</div>
					<div class="container p-4">
						<div class="row">
							<p class="my-0 font-weight-bold">잔나비</p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold">4월1일_서울</p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold">4월25일_부산</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md mx-3 border border-primary rounded">
				<div class="row bg-primary p-2 justify-content-center">
					<h4 class="text-white m-0">6월</h4>
				</div>
				<div class="row">
					<div class="container p-4">
						<div class="row">
							<p class="my-0 font-weight-bold">장범준</p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold">4월6일_대구</p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold">4월15일_부산</p>
						</div>
					</div>
					<div class="container p-4">
						<div class="row">
							<p class="my-0 font-weight-bold">잔나비</p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold">4월1일_서울</p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold">4월25일_부산</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>