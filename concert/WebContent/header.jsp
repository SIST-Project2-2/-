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
} else {
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
</head>
<body>
	<nav id="header" class="navbar navbar-expand-sm navbar-light text-dark sticky-top" style="background: tomato; font-family: 'Jua', sans-serif;">
		<!-- Brand -->
		<div style="width: 250px;">
			<a class="navbar-brand mr-auto" href="/concert/index.jsp">
				<img src="/concert/images/logo.png" height="30">
			</a>
		</div>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- Links -->
			<ul class="navbar-nav mx-auto">
				<li class="nav-item mx-3" id="concert">
					<a class="nav-link text-nowrap" href="/concert/concert/concert_list_calendar.jsp">스케쥴</a>
				</li>

				<li class="nav-item dropdown mx-3" id="artist">
					<a class="nav-link dropdown-toggle text-nowrap" href="/concert/artist/artist_list.jsp" id="navbardrop" data-toggle="dropdown"> 아티스트 </a>
					<div class="dropdown-menu" style="top: 80%;">
						<a class="dropdown-item" href="/concert/artist/artist_list.jsp">잔나비</a>
						<a class="dropdown-item" href="/concert/artist/artist_list.jsp">장범준</a>
						<a class="dropdown-item" href="/concert/artist/artist_list.jsp">현아</a>
						<a class="dropdown-item" href="/concert/artist/artist_list.jsp">IU</a>
						<a class="dropdown-item" href="/concert/artist/artist_list.jsp">10cm</a>
					</div>
				</li>

				<li class="nav-item mx-3" id="notice">
					<a class="nav-link text-nowrap" href="/concert/notice/notice_list.jsp">공지사항</a>
				</li>

				<li class="nav-item mx-3" id="mypage">
					<a class="nav-link text-nowrap" href="/concert/mypage/myprofile_info.jsp">마이페이지</a>
				</li>

			</ul>
		</div>
		<div class="text-right" style="width: 250px;">
			<%
				//
			if (id != null) {
				out.write("<span class='font-weight-bold m-2'>" + id + "</span>");
			}
			if (id != null && authority.equals("1")) { // 관리자가 아니면 메인으로 이동 
				out.write("<a class='auser m-2' href='/concert/admin/member/admin_member_list.jsp'> ADMIN</a>");
			}
			if (id == null) {
				out.write("<a class='auser m-2' href='/concert/login/login.jsp'>LOGIN</a>");
				out.write("<a class='auser m-2' href='/concert/join/join.jsp'>JOIN</a>");
			} else {
				out.write("<a class='auser m-2' href='/concert/login/logout.jsp'>LOGOUT</a>");
			}
			%>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</nav>
</body>
</html>