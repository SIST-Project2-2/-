<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- import -->
<jsp:include page="../import.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top mb-3">
		<!-- Brand -->
		<a class="navbar-brand mr-auto" href="http://localhost:9000/concert/index.jsp">
			<img src="http://localhost:9000/concert/images/logo.png" height="30">
		</a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- Links -->
			<ul class="navbar-nav mx-auto">
				<li class="nav-item mx-3" id="member">
					<a class="nav-link text-nowrap" href="/concert/admin/member/admin_member_list.jsp">회원 관리</a>
				</li>

				<li class="nav-item mx-3" id="concert">
					<a class="nav-link text-nowrap" href="http://localhost:9000/concert/admin/concert/admin_concert_list.jsp">콘서트 관리</a>
				</li>

				<li class="nav-item mx-3" id="notice">
					<a class="nav-link text-nowrap" href="http://localhost:9000/concert/admin/notice/admin_notice_list.jsp">공지사항 관리</a>
				</li>

				<li class="nav-item dropdown mx-3" id="artist">
					<a class="nav-link dropdown-toggle text-nowrap" href="http://localhost:9000/concert/admin/statistics/admin_statistics.jsp" id="navbardrop"
						data-toggle="dropdown"> 아티스트 관리</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="http://localhost:9000/concert/admin/artist/admin_artist_list.jsp">아티스트 목록</a>
						<a class="dropdown-item" href="http://localhost:9000/concert/admin/artist/admin_artist_comment.jsp">댓글 관리</a>
					</div>
				</li>
				<li class="nav-item mx-3" id="statistic">
					<a class="nav-link text-nowrap" href="http://localhost:9000/concert/admin/statistics/admin_statistics.jsp">통계</a>
				</li>
			</ul>
		</div>


		<a class="text-info text-nowrap font-weight-bold" href="http://localhost:9000/concert/login/login.jsp">LOGOUT</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</nav>
</body>
</html>