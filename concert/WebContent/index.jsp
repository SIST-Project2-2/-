<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인 화면</title>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<style type="text/css">
.main {
	background-image: url('images/main_img2.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	height: 100vh;
}

.container {
	height: 100vh;
	width: 100vw;
}

.container h1 {
	font-family: 'Jua', sans-serif;
	text-shadow: black 0.2em 0.2em 0.2em;
	color: white;
	padding-top: 100px;
}

div.modal {
	font-family: 'Jua', sans-serif;
}

#jang_island {
	position: absolute;
	top: 510px;
	left: 100px;
	background-color: transparent !important;
	border: none;
	background-color: transparent !important;
	background-color: transparent !important;
}

#iu_island {
	position: absolute;
	top: 520px;
	left: 1200px;
	background-color: transparent !important;
	border: none;
	background-color: transparent !important;
}

#jan_island {
	position: absolute;
	top: 620px;
	left: 600px;
	background-color: transparent !important;
	border: none;
	background-color: transparent !important;
}

#cm_island {
	position: absolute;
	top: 630px;
	left: 1700px;
	background-color: transparent !important;
	border: none;
	background-color: transparent !important;
}
#hyun_island {
	position: absolute;
	top: 610px;
	left: 920px;
	background-color: transparent !important;
	border: none;
	background-color: transparent !important;
}

nav#top_nav {
	margin-bottom: 0px;
}

#header_div {
	margin-bottom: 0px !important;
}
</style>
</head>
<body>

	<!-- 메인 콘서트 여행  -->
	<div class="main">
		<!-- 장범준 모달 -->
		<a class="btn btn-default" data-target="#modal_jang"
			data-toggle="modal" id="jang_island"> <img src="images/장범준섬.png"
			onmouseover="this.src='images/호버장범준섬.png'"
			onmouseout="this.src='images/장범준섬.png'">
		</a>
		<!-- 아이유 모달 -->
		<a class="btn btn-default" data-target="#modal_iu" data-toggle="modal"
			id="iu_island"> <img src="images/아이유섬.png"
			onmouseover="this.src='images/호버아이유섬.png'"
			onmouseout="this.src='images/아이유섬.png'">
		</a>
		<!-- 잔나비 모달 -->
		 <a class="btn btn-default" data-target="#modal_jan"
			data-toggle="modal" id="jan_island"> <img src="images/잔나비섬.png"
			onmouseover="this.src='images/호버잔나비섬.png'"
			onmouseout="this.src='images/잔나비섬.png'"> <!-- 십센치 모달 -->
		</a> 
		<!-- 십센치 모달 -->
		<a class="btn btn-default" data-target="#modal_cm"
			data-toggle="modal" id="cm_island"> <img src="images/십센치섬.png"
			onmouseover="this.src='images/호버십센치섬.png'"
			onmouseout="this.src='images/십센치섬.png'">
		</a>
		<!-- 현아 모달 -->
		 <a class="btn btn-default" data-target="#modal_hyun"
			data-toggle="modal" id="hyun_island"> <img src="images/현아섬.png"
			onmouseover="this.src='images/호버현아섬.png'"
			onmouseout="this.src='images/현아섬.png'">
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
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						아티스트 소개 제목(장범준)
						<!-- &times; == X표시 -->
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center";>
						대한민국의 가수, 싱어송라이터. <br> 버스커 버스커의 리더이자, 보컬을 맡고 있다. 대부분 곡의 작사,
						작곡을 담당한다. 대한민국 가요계 정상급 인기를 구가하는 싱어송라이터이다. <br> <img
							src="images/장범준.jpg" style="width: 256px; height: 256px;">
						<br> <a class="btn btn btn-primary"
							href="http://localhost:9000/concert/artist/artist_list.jsp">장범준페이지</a>
					</div>
				</div>
			</div>

		</div>
		<div class="modal" id="modal_iu" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						아티스트 소개 제목(아이유)
						<!-- &times; == X표시 -->
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center";>
						대한민국의 멀티 엔터테이너. 본명은 이지은이며, 예명 아이유(IU)는 "음악으로 너와 내가 하나가 된다."라는 뜻을 <br>
						가지고 있다. 16세인 2008년에 가수로 데뷔해 2010년 잔소리와 좋은 날의 연이은 히트 이후로 2021년 <br>
						현재까지 대한민국 대중음악계에서 최정상의 위치를 점하고 있는 여성 솔로 가수이다. <br> <img
							src="images/아이유.jpg" style="width: 256px; height: 256px;">
						<br> <a class="btn btn btn-primary"
							href="http://localhost:9000/concert/artist/artist_list.jsp">아이유페이지</a>
					</div>
				</div>
			</div>
		</div>
		<div class="modal" id="modal_jan" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						아티스트 소개 제목(잔나비)
						<!-- &times; == X표시 -->
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center";>
						대한민국의 밴드. 92년생 잔나비(=원숭이)띠 최정훈, 김도형, 장경준, 윤결로 구성된 4인조 밴드다.[3] 잔나비는<br>
						원숭이라는 뜻을 가진 순우리말.[4] 작사, 작곡, 편곡(전곡 자작곡), 다양한 커버곡(가요, 팝) 등이 가능한<br>
						밴드다. 2012년 결성 당시에는 최정훈, 김도형, 유영현 셋이 밴드를 구성해 출발하였다. 2014년 디지털 싱글<br>
						<로켓트>로 정식 데뷔를 하였으며, 2015년 초에 베이시스트 장경준과 드러머 윤결을 영입하고 2019년<br>
						5월에 키보디스트 유영현이 탈퇴하였다.<br>
						<img src="images/잔나비.jpg" style="width: 256px; height: 256px;">
						<br>
						<a class="btn btn btn-primary"
							href="http://localhost:9000/concert/artist/artist_list.jsp">잔나비페이지</a>
					</div>
				</div>
			</div>
		</div>
		<div class="modal" id="modal_cm" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						아티스트 소개 제목(십센치)
						<!-- &times; == X표시 -->
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center";>
						한국의 인디밴드. 공식적으로 십센치로 읽는다. 절대 십센티나 십센티미터가 아니다. 원래는 윤철종(기타&코러스)과 2인조<br>
						밴드였으나, 2017년 7월 4일 윤철종이 탈퇴하여 권정열(보컬&젬베) 1인 밴드가 되었다.[1] 권정열은 1983년<br>
						3월 1일생이며, 전 멤버 윤철종은 1982년 4월 23일생이다. 키는 권정열 170cm[2], 윤철종 180cm.<br>
						그래서 밴드이름이 십센치라고 무한도전 서해안 고속도로 가요제 당시 밝힌 바 있다. 두 멤버의 키 차이가 10cm라서<br>
						밴드명이 그렇게 됐다는 믿거나말거나성 웃픈 고백. 하지만 실제론 8cm 정도 차이난다고 말함.[3] <br>
						<img src="images/십센치.png" style="width: 256px; height: 256px;">
						<br> <a class="btn btn btn-primary"
							href="http://localhost:9000/concert/artist/artist_list.jsp">십센치페이지</a>
					</div>
				</div>
			</div>
		</div>
		<div class="modal" id="modal_hyun" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						아티스트 소개 제목(현아)
						<!-- &times; == X표시 -->
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center";>
						대한민국의 솔로 가수. 2007년 걸 그룹 원더걸스로 데뷔하여 동년 탈퇴 후 2009년 데뷔한 걸 그룹 포미닛으로
						2016년까지 활동하였다. 2010년
						<Change(현아)>로 솔로 데뷔 후 그룹 활동을 하면서 꾸준히 솔로로 앨범 작업을
						병행하였고, 소속사 동료들과 유닛 활동(트러블 메이커, 트리플 H)을 겸하기도 하였으며 그룹, 솔로, 유닛으로 모두
						1위곡을 보유하고 있다. <img src="images/현아.jpg"
							style="width: 256px; height: 256px;"> <br>
						<a class="btn btn btn-primary"
							href="http://localhost:9000/concert/artist/artist_list.jsp">현아</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>