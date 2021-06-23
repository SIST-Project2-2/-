<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인 화면</title>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/commons.css">
<script src="./js/commons.js"></script>
</head>
<body id="index">
	<div>
		<!-- 메인 콘서트 여행  -->
		<div class="main">
			<!-- 장범준 모달 -->
			<a class="btn btn-default" data-target="#modal_jang"
				data-toggle="modal" id="jang_island" onclick="clickFunction('jang')">
				<img src="images/장범준섬.png"
				onmouseover="this.src='images/호버장범준섬.png'"
				onmouseout="this.src='images/장범준섬.png'"> <img
				src="images/큰느낌표.png" id="alert1">
			</a>
			<!-- 아이유 모달 -->
			<a class="btn btn-default" data-target="#modal_iu"
				data-toggle="modal" id="iu_island" onclick="clickFunction('iu')">
				<img src="images/아이유섬.png"
				onmouseover="this.src='images/호버아이유섬.png'"
				onmouseout="this.src='images/아이유섬.png'"> <img
				src="images/큰느낌표.png" id="alert2">
			</a>
			<!-- 잔나비 모달 -->
			<a class="btn btn-default" data-target="#modal_jan"
				data-toggle="modal" id="jan_island" onclick="clickFunction('jan')">
				<img src="images/잔나비섬.png"
				onmouseover="this.src='images/호버잔나비섬.png'"
				onmouseout="this.src='images/잔나비섬.png'"> <img
				src="images/큰느낌표.png" id="alert3">
			</a>
			<!-- 십센치 모달 -->
			<a class="btn btn-default" data-target="#modal_cm"
				data-toggle="modal" id="cm_island" onclick="clickFunction('cm')">
				<img src="images/십센치섬.png"
				onmouseover="this.src='images/호버십센치섬.png'"
				onmouseout="this.src='images/십센치섬.png'"> <img
				src="images/큰느낌표.png" id="alert4">
			</a>
			<!-- 현아 모달 -->
			<a class="btn btn-default" data-target="#modal_hyun"
				data-toggle="modal" id="hyun_island" onclick="clickFunction('hyun')">
				<img src="images/현아섬.png" onmouseover="this.src='images/호버현아섬.png'"
				onmouseout="this.src='images/현아섬.png'"> <img
				src="images/큰느낌표.png" id="alert5">
			</a>
			<div class="container">

				<h1 class="text-center">콘서트 여행</h1>

				<div class="text-center"></div>

			</div>

		</div>

		<!-- 모달창 -->
		<div class="row">
			<!-- tabindex="-1" == Tab 키를 눌렀을때 포커스를 잃게 함 -->
			<div class="modal" id="modal_jang" tabindex="-1">
				<div class="modal-dialog modal-lg modal-fullsize">
					<div class="modal-content">
						<div class="modal-header">
							아티스트 소개 제목(장범준)
							<!-- &times; == X표시 -->
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body " style="text-align: center";>
							<div class="col-xs-10 col-lg-12">
								<div class="box rte">
									<h2 class="boxHeadline">장범준</h2>
									<h3 class="boxHeadlineSub">노래방에서[Live]</h3>
									<iframe width="100%" height="400"
										src="https://www.youtube.com/embed/ss_E9t4CeeM"
										frameborder="0" allowfullscreen=""></iframe>
								</div>
							</div>

						</div>
					</div>
				</div>

			</div>
			<div class="modal" id="modal_iu" tabindex="-1">
				<div class="modal-dialog modal-lg modal-fullsize">
					<div class="modal-content">
						<div class="modal-header">
							아티스트 소개 제목(아이유)
							<!-- &times; == X표시 -->
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body " style="text-align: center";>
							<div class="col-xs-10 col-lg-12">
								<div class="box rte">
									<h2 class="boxHeadline">아이유</h2>
									<h3 class="boxHeadlineSub">내 손을 잡아[Live]</h3>
									<iframe width="100%" height="400"
										src="https://www.youtube.com/embed/3iM_06QeZi8"
										frameborder="0" allowfullscreen=""></iframe>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="modal" id="modal_jan" tabindex="-1">
				<div class="modal-dialog modal-lg modal-fullsize">
					<div class="modal-content">
						<div class="modal-header">
							아티스트 소개 제목(잔나비)
							<!-- &times; == X표시 -->
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body " style="text-align: center";>
							<div class="col-xs-10 col-lg-12">
								<div class="box rte">
									<h2 class="boxHeadline">잔나비</h2>
									<h3 class="boxHeadlineSub">주저하는 연인들을 위해[Live]</h3>
									<iframe width="100%" height="400"
										src="https://www.youtube.com/embed/TntA4zf3YRc"
										frameborder="0" allowfullscreen=""></iframe>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="modal" id="modal_cm" tabindex="-1">
				<div class="modal-dialog modal-lg modal-fullsize">
					<div class="modal-content">
						<div class="modal-header">
							아티스트 소개 제목(십센치)
							<!-- &times; == X표시 -->
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body " style="text-align: center";>
							<div class="col-xs-10 col-lg-12">
								<div class="box rte">
									<h2 class="boxHeadline">10cm</h2>
									<h3 class="boxHeadlineSub">폰서트[Live]</h3>
									<iframe width="100%" height="400"
										src="https://www.youtube.com/embed/p-IlBqLqCZw"
										frameborder="0" allowfullscreen=""></iframe>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="modal" id="modal_hyun" tabindex="-1">
				<div class="modal-dialog modal-lg modal-fullsize">
					<div class="modal-content">
						<div class="modal-header">
							아티스트 소개 제목(현아)
							<!-- &times; == X표시 -->
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body " style="text-align: center";>
							<div class="col-xs-10 col-lg-12">
								<div class="box rte">
									<h2 class="boxHeadline">현아</h2>
									<h3 class="boxHeadlineSub">빨개요[Live]</h3>
									<iframe width="100%" height="400"
										src="https://www.youtube.com/embed/w9IOrHvcu1Y"
										frameborder="0" allowfullscreen=""></iframe>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>