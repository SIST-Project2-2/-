<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
// 로그인했으면 id에 값이 저장되고 로그인 되어있지 않으면 null이 저장된 id 변수 설정
String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<!-- header -->
<jsp:include page="/import.jsp"></jsp:include>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:9000/concert/css/header.css">
</head>
<body>
	<div id="header_div" class="mb-3">
		<div class="lT">
			<a class=logo href="http://localhost:9000/concert/index.jsp">
				<img alt="" src="http://localhost:9000/concert/images/logo.png">
			</a>
			<ul class="nav justify-content-end">
				<%
					if (id != null) {
					out.write("<li class='nav-item'>");
					out.write("<span class='font-weight-bold'>" + id + "</span>");
					out.write("</li>");
				}
				%>
				<li class="nav-item">
					<a class="auser" href="http://localhost:9000/concert/admin/member/admin_member_list.jsp"> ADMIN</a>
				</li>
				<li class="nav-item">
					<%
						if (id == null) {
						out.write("<a class='auser' href='http://localhost:9000/concert/login/login.jsp'>LOGIN</a>");
					} else {
						out.write("<a class='auser' href='http://localhost:9000/concert/login/logout.jsp'>LOGOUT</a>");
					}
					%>
				</li>
				<li class="nav-item">
					<a class="auser" href="http://localhost:9000/concert/join/join.jsp"> JOIN</a>
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