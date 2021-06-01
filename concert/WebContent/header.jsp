<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- header -->
<jsp:include page="/import.jsp"></jsp:include>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
ul {
	list-style: none;
}

.lT {
	height: 66px;
	margin: 10px 0;
	margin-left: 10px;
}

.art>.d {
	display: none;
}

#top_nav li:hover {
	text-decoration: underline 3px;
}

.art:hover .d {
	display: block;
}

.justify-content-end {
	margin-right: 10px
}

.logo {
	float: left;
}

a:link, a:visited {
	color: white;
	text-decoration: none;
}

a:hover {
	color: black;
}

#top_nav {
	text-align: center;
	height: 56px;
	background-color: tomato;
	margin-bottom: 100px
}

#top_nav>ul {
	display: inline-block;
	padding: 16px;
}

#top_nav>ul>li {
	float: left;
	align-conten: center;
	margin-left: 50px;
	color: white;
}

.sIcon {
	float: right;
	margin: 4px 10px 0 0;
}

.d {
	background-color: gray;
	text-align: left;
	padding-left: 0;
	width: 100px;
}

.d li {
	padding: 5px 0;
}

.nav-item {
	padding: 0 10px;
}

.auser:link, .auser:visited {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<div>
		<div class="lT">
			<a class=logo href="http://localhost:9000/concert/index.jsp">
				<img alt="" src="http://localhost:9000/concert/images/logo.png">
			</a>
			<ul class="nav justify-content-end">
				<li class="nav-item">
					<a class="auser" href="http://localhost:9000/concert/login/login.jsp"> LOGIN</a>
				</li>
				<li class="nav-item">
					<a class="auser" href="http://localhost:9000/concert/join/join_id.html"> JOIN</a>
				</li>
			</ul>
		</div>

		<div>
			<nav id="top_nav">
				<ul>
					<li>
						<a href="http://localhost:9000/concert/concert/concert_list_calendar.jsp"> 스케쥴</a>
					</li>
					<li class="art">
						<a href="http://localhost:9000/concert/artist/artist_list.jsp"> 아티스트</a>
						<ul class="d">
							<li>
								<a href="#">잔나비</a>
							</li>
							<li>
								<a href="#">장범준</a>
							</li>
							<li>
								<a href="#">현아</a>
							</li>
							<li>
								<a href="#">IU</a>
							</li>
							<li>
								<a href="#">10CM</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="http://localhost:9000/concert/notice/notice_list.jsp"> 공지사항</a>
					</li>
					<li>
						<a href="http://localhost:9000/concert/mypage/myprofile_info.jsp"> 마이페이지</a>
					</li>
				</ul>
				<a href="#">
					<img class="sIcon" alt="" src="http://localhost:9000/concert/images/searchIcon.png">
				</a>
			</nav>
		</div>
	</div>
</body>
</html>