<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- ctrl + shift  + F 자동정렬-->
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="artist_list.css" type="text/css">

<title>아티스트 목록</title>
</head>

<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<div id="carouselSlider" class="carousel slide">

		<ol class="carousel-indicators">
			<li data-target="#carouselSlider" data-slide-to="0" class="active"></li>
			<li data-target="#carouselSlider" data-slide-to="1"></li>
			<li data-target="#carouselSlider" data-slide-to="2"></li>
			<li data-target="#carouselSlider" data-slide-to="3"></li>
			<li data-target="#carouselSlider" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<!--아이유 캐러셀-->
			<div class="carousel-item active">
				<div class="carousel-caption">
					<div class="article">
						<img src="../images/아이유.jpg" class="h-100">
						<div class="firstSong">
							<img src="../images/아이유음원1.jpg" class="song1" id="iu_img1">
							<img src="../images/아이유음원2.png" class="song2" id="iu_img2">
							<img src="../images/아이유음원3.jpg" class="song3" id="iu_img3">
						</div>
						<div class="SecondSong">
							<img src="../images/아이유음원4.jpg" class="song4"> <img
								src="../images/아이유음원5.jpg" class="song5">
						</div>
						<hr>
						<div class="third">
							<audio controls="controls" class="audio" autoplay controls>
								<source src="../song/아이유노래1.mp3" type="audio/mpeg" />
							</audio>
						</div>
					</div>
				</div>
			</div>
			<!--장범준 캐러셀-->
			<div class="carousel-item">

				<div class="carousel-caption">
					<h5>장범준</h5>
					<div class="article">
						<img src="../images/장범준.jpg" class="h-80">
						<div class="firstSong">

							<img src="../images/장범준앨범1.jpg" class="song1"> <img
								src="../images/장범준앨범2.png" class="song2"> <img
								src="../images/장범준앨범3.jpg" class="song3">

						</div>

						<div class="SecondSong">
							<img src="../images/장범준앨범4.jpg" class="song4"> <img
								src="../images/장범준앨범5.jpg" class="song5">

						</div>
						<hr>
						<div class="third">
							<audio controls="controls">

								<source src="../song/장범준노래1.mp3" type="audio/mpeg" />
							</audio>
						</div>
					</div>

				</div>
			</div>
			<!--잔나비 캐러셀-->
			<div class="carousel-item">

				<div class="carousel-caption">
					<h5>잔나비</h5>
					<div class="article">
						<img src="../images/잔나비.jpg" class="h-80">
						<div class="firstSong">

							<img src="../images/잔나비앨범1.jpg" class="song1"> <img
								src="../images/잔나비앨범2.png" class="song2"> <img
								src="../images/잔나비앨범3.jpg" class="song3">

						</div>

						<div class="SecondSong">
							<img src="../images/잔나비앨범4.jpg" class="song4"> <img
								src="../images/잔나비앨범5.jpg" class="song5">

						</div>
						<hr>
						<div class="third">
							<audio controls="controls">

								<source src="../song/잔나비노래1.mp3" type="audio/mpeg" />
							</audio>
						</div>
					</div>

				</div>
			</div>
			<!--현아 캐러셀-->
			<div class="carousel-item">
				<div class="carousel-caption">
					<h5>현아</h5>
					<div class="article">
						<img src="../images/현아.jpg" class="h-80">
						<div class="firstSong">

							<img src="../images/현아앨범1.jpg" class="song1"> <img
								src="../images/현아앨범2.jpg" class="song2"> <img
								src="../images/현아앨범3.jpg" class="song3">

						</div>

						<div class="SecondSong">
							<img src="../images/현아앨범4.jpg" class="song4"> <img
								src="../images/현아앨범5.jpg" class="song5">

						</div>
						<hr>
						<div class="third">
							<audio controls="controls">

								<source src="../song/현아노래1.mp3" type="audio/mpeg" />
							</audio>
						</div>
					</div>


				</div>
			</div>
			<!--십센치 캐러셀-->
			<div class="carousel-item">
				<div class="carousel-caption">
					<h5>십센치</h5>
					<div class="article">
						<img src="../images/십센치.png" class="h-100" id="cm">
						<div class="firstSong">

							<img src="../images/십센치앨범1.jpg" class="song1"> <img
								src="../images/십센치앨범2.jpg" class="song2"> <img
								src="../images/십센치앨범3.jpg" class="song3">

						</div>

						<div class="SecondSong">
							<img src="../images/십센치앨범4.jpg" class="song4"> <img
								src="../images/십센치앨범5.jpg" class="song5">

						</div>
						<hr>
						<div class="third">
							<audio controls="controls">

								<source src="../song/십센치노래1.mp3" type="audio/mpeg" />
							</audio>
						</div>
					</div>


				</div>
			</div>
		</div>
		<!--캐러셀 prev/ next 버튼 -->
		<a class="carousel-control-prev" href="#carouselSlider" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"></span>
			<span>Previous</span>
		</a> <a class="carousel-control-next " href="#carouselSlider"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon"></span> <span>Next</span>
		</a>
	</div>

	<!--댓글-->

	<div class="comment">
		<form method="get" action="#" class="form-inline mt-3">
			<section class="container">
				<select name="artistDivide" class="form-control mx-1 mt-2">
					<option value="공통">공통</option>
					<option value="공통">아이유</option>
					<option value="공통">장범준</option>
					<option value="공통">현아</option>
					<option value="공통">잔나비</option>
					<option value="공통">10cm</option>
				</select> <input type="text" name="content" maxlength="20"
					class="form-control mx-4 mt-2 w-50"
					placeholder="댓글 내용을 입력해주세요(20글자 이내)"> <a
					class="btn btn-primary mx-1 mt-2" type="submit" href="#">등록</a>
		</form>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">
						<small style="border-right: 5px solid black;">아이유팬</small>&nbsp;userID
					</div>
					<div class="col-4 text-right">
						<span style="color: green;">(추천:100)</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<p class="card-content">안녕하세요 반갑습니다 아이유 팬입니다</p>
				<div class="col-12 text-right">
					<a onclick="return confirm('추천하시겠습니까?')" href="#">추천</a> <a
						onclick="return confirm('삭제하시겠습니까?')" href="#">삭제</a>
				</div>
			</div>
		</div>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">
						<small style="border-right: 5px solid black;">장범준팬</small>&nbsp;userID
					</div>
					<div class="col-4 text-right">
						<span style="color: green;">(추천:150)</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<p class="card-content">장범준 팬 화이팅!</p>
				<div class="col-12 text-right">
					<a onclick="return confirm('추천하시겠습니까?')" href="#">추천</a> <a
						onclick="return confirm('삭제하시겠습니까?')" href="#">삭제</a>
				</div>
			</div>
		</div>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">
						<small style="border-right: 5px solid black;">잔나비팬</small>&nbsp;userID
					</div>
					<div class="col-4 text-right">
						<span style="color: green;">(추천:30)</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<p class="card-content">잔나비 신곡 나왔습니다.</p>
				<div class="col-12 text-right">
					<a onclick="return confirm('추천하시겠습니까?')" href="#">추천</a> <a
						onclick="return confirm('삭제하시겠습니까?')" href="#">삭제</a>
				</div>
			</div>
		</div>

		</section>
	</div>



</body>

</html>