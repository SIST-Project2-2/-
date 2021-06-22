<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.ConcertDAO" %>
<%@ page import="vo.ConcertVO" %>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<%
ConcertDAO dao = new ConcertDAO();
ArrayList<ConcertVO>[] list = new ArrayList[3];
LocalDate date = LocalDate.now();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="container-md text-center" id="content_concert_list_date">

		<!-- 타이틀 부분 -->
		<h1 class="font-weight-bold text-left">날짜별</h1>

		<!-- 월, 콤보 박스 있는 부분 -->
		<div class="d-flex justify-content-between mb-3">
			<div class="p-2"></div>
			<div class="p-2">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">보기 형태</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="concert_list_calendar.jsp">달 력</a>
						<a class="dropdown-item" href="concert_list_date.jsp">날 짜</a>
						<a class="dropdown-item" href="concert_list_rank.jsp">순 위</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 날짜별 일정 -->
		<div class="row justify-content-center">
			<% 
			for(int i=0;i<list.length;i++) { 
				list[i] = dao.getConcertListByDate(date.getYear(), date.getMonthValue());
			%>
			<div class="col-md mx-3 border border-primary rounded">
				<div class="row bg-primary p-2 justify-content-center">
					<h4 class="text-white m-0"><%= date.getMonthValue() %>월</h4>
				</div>
				<div class="row">
					<% for(ConcertVO vo : list[i]) { %>
					<div class="container p-4"><a class="text-decoration-none text-body" href="concert_info.jsp?concert_no=<%= vo.getNo() %>">
						<div class="row">
							<p class="my-0 font-weight-bold"><%= vo.getCdate() + "_" + vo.getLocation() + " " + vo.getArtist() %></p>
						</div>
						<div class="row">
							<p class="my-0 font-weight-bold"><%= vo.getTitle() %></p>
						</div>
					</a></div>
					<% } %>
				</div>
			</div>
			<% 
				date = date.plusMonths(1);
			}
			dao.close();
			%>
		</div>
	</section>
</body>
</html>