<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.d1, .d2 {
		height:300px;
		border: 1px solid lightgray;
		border-radius:15px;
	}
	.d1 {
		border-right-style:dashed;
	}
	
	.d2 {
		border-left-style:dashed;
	}
	.top {
		height:50px;
		border-top-left-radius:15px;
		border-top-right-radius:15px;
	}
</style>
</head>
<body>
	<h3>콘서트 예매내역</h3>
	<section class="container-md text-center" id="content_myticketlist">
		<div class="row justify-content-center font-weight-bold">
			<div class="d1 col-md-9">
				<div class="top row bg-primary pl-3">
					<small>(여기 로고 넣으면 좋을듯)</small>
					<h1 class="text-white">10cm</h1>
				</div>
				<div class="row text-left">
					<div class="col-md-2 bg-light">
						대충 바코드 영역~
					</div>
					<div class="col-md-4 py-4 pl-5 pr-2">
						<div class="row mb-4">
							<small>
								성명:<br>
								홍 길동
							</small>
						</div>
						<div class="row mb-4">
							<small>
								출발:~~운동장<br>
								도착:10cm랜드~
							</small>
						</div>
						<div class="row">
							<p>
								이륙시간:<br>
								19:00
							</p>
						</div>
					</div>
					<div class="col-md-2 py-4 px-2">
						<div class="row mb-4">
							<small>
								출발일자:<br>
								2021.05.26
							</small>
						</div>
						<div class="row mb-4">
							<small>
								편명:<br>
								10cm콘서트
							</small>
						</div>
					</div>
					<div class="col-md-2 py-4 px-2">
						<div class="row mb-4">
							<small>
								비행기 번호:<br>
								2313231232
							</small>
						</div>
						<div class="row md-4">
							<small>
								좌석:<br>
								30A
							</small>
						</div>
					</div>
					<div class="col-md-2 py-4 px-2">
						<div class="row md-4">
							<small>
								예약 번호:<br>
								352
							</small>
						</div>
					</div>
				</div>
			</div>
			<div class="d2 col-md-3">
				<div class="top row bg-primary pl-2">
					
				</div>
				옆에 있는 정보 복붙 / 정보, 배치는 나중에 수정
			</div>
		</div>
	</section>
</body>
</html>