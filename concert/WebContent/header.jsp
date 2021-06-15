<%@page import="concert.Commons"%>
<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//
Cookies cookies = new Cookies(request);
String storedId = cookies.getValue("storedId"); // 마지막으로 로그인 성공한 아이디
String auto_login = cookies.getValue("auto_login");
String id = (String) session.getAttribute("id");// 로그인했으면 id에 값이 저장되고 로그인 되어있지 않으면 null이 저장된 id 변수 설정 
String authority = null;

// 자동 로그인: 아이디 저장 + 자동 로그인 쿠키가 존재하면 로그인 실행"
if (id == null && cookies.exists("storedId") && cookies.exists("auto_login")) {
%>
<jsp:include page="login/login_ajax.jsp">
	<jsp:param value="<%=storedId%>" name="id" />
	<jsp:param value="<%=auto_login%>" name="pw" />
	<jsp:param value="on" name="id_store" />
	<jsp:param value="on" name="auto_login" />
</jsp:include>
<%
	//
	if (session.getAttribute("id") != null) {
		out.print("<script>location.reload();</script>");
	}else{
		out.print("<script>location.href='/concert/login/logout.jsp';</script>");		
	}
}

// 계정 권한 가져오기
if (id != null) {
	authority = (String) session.getAttribute("authority");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- import -->
<jsp:include page="/import.jsp"></jsp:include>
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
					//
				if (id != null) {
					out.write("<li class='nav-item'>");
					out.write("<span class='font-weight-bold'>" + id + "</span>");
					out.write("</li>");
				}
				if (id != null && authority.equals("1")) { // 관리자가 아니면 메인으로 이동 
					out.write("<li class='nav-item'><a class='auser' href='http://localhost:9000/concert/admin/member/admin_member_list.jsp'> ADMIN</a></li>");
				}
				%>
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