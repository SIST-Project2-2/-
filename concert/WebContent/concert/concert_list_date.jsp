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
	<h3>콘서트 목록 - 날짜별</h3>
	<section class="container-md text-center" id="content_concert_list_date">
		<!-- 드롭다운 -->
		<div class="row justify-content-end">
			<div class="dropdown">
				<button class="btn dropdown-toggle border border-primary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					드롭다운
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">드롭다운1</a>
					<a class="dropdown-item" href="#">드롭다운2</a>
					<a class="dropdown-item" href="#">드롭다운3</a>
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