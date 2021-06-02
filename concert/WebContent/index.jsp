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
	top: 610px;
	left: 200px; background-color : transparent !important;
	border: none;
	background-color: transparent !important;
	background-color: transparent !important;
}

#iu_island {
	position: absolute;
	top: 620px;
	left: 900px;
	background-color: transparent !important;
	border: none;
	background-color: transparent !important;
}

nav#top_nav {
	margin-bottom: 0px;
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
			onmouseout="this.src='images/장범준섬.png'"></a>
		<!-- 아이유 모달 -->
		<a class="btn btn-default" data-target="#modal_iu" data-toggle="modal"
			id="iu_island"><img src="images/아이유섬.png"
			onmouseover="this.src='images/호버아이유섬.png'"
			onmouseout="this.src='images/아이유섬.png'"></a>
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
						대한민국의 가수, 싱어송라이터.<br> 버스커 버스커의 리더이자, 보컬을 맡고 있다. 대부분 곡의 작사,
						작곡을 담당한다. 대한민국 가요계 정상급 인기를 구가하는 싱어송라이터이다.<br> <img
							src="images/장범준.jpg" style="width: 256px; height: 256px;"><br>
						<a class="btn btn btn-primary"
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
						대한민국의 멀티 엔터테이너. 본명은 이지은이며, 예명 아이유(IU)는 "음악으로 너와 내가 하나가 된다."라는 뜻을<br>
						가지고 있다. 16세인 2008년에 가수로 데뷔해 2010년 잔소리와 좋은 날의 연이은 히트 이후로 2021년<br>
						현재까지 대한민국 대중음악계에서 최정상의 위치를 점하고 있는 여성 솔로 가수이다.<br> <img
							src="images/아이유.jpg" style="width: 256px; height: 256px;"><br>
						<a class="btn btn btn-primary"
							href="http://localhost:9000/concert/artist/artist_list.jsp">아이유페이지</a>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>