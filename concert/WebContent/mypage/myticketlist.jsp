<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.PayInfoDAO" %>
<%@ page import="vo.PayInfoVO" %>
<%
	PrintWriter script = response.getWriter();
	PayInfoDAO dao = new PayInfoDAO();
	ArrayList<PayInfoVO> list;
	String id = (String)session.getAttribute("id");
	
	// 입력받은 id가 없을 경우 에러 페이지 이동
	if(id.equals("")) {
		response.sendRedirect("../error.jsp");
	}
	
	list = dao.getTicketlist(id);
	
	// 데이터를 모두 불러온 뒤, dao 객체 닫음
	dao.close();
%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘서트 예매내역</title>
<style>
	.d1, .d2 {
		height:300px;
		border: 1px solid lightgray;
		border-radius:15px;
	}
	.d1 {
		border-right-style:dashed;
	}
	
	.d2 {
		border-left-style:dashed;
	}
	.top {
		height:50px;
		border-top-left-radius:15px;
		border-top-right-radius:15px;
	}
</style>
</head>
<body>
	<h3>콘서트 예매내역</h3>
	<section class="container-md text-center" id="content_myticketlist">
		<% for(PayInfoVO info : list) { %>
		<a href="../concert/concert_payinfo.jsp?no=<%= info.getOrderNo() %>" class="text-decoration-none text-dark"><div class="row justify-content-center font-weight-bold mt-3">
			<div class="d1 col-md-9">
				<div class="top row bg-primary pl-3">
					<img src="http://localhost:9000/concert/images/logo.png" class="img-fluid align-self-center" style="height:40px">
					<h1 class="text-white"><%= info.getArtist() %></h1>
				</div>
				<div class="row text-left">
					<div class="col-md-2 bg-light">
						대충 바코드 영역~
					</div>
					<div class="col-md-10 container p-3">
						<div class="row pb-3">
							<div class="col-md-4">
								<p>성명:<br><%= info.getFirstName() + " " + info.getLastName() %></p>
							</div>
							<div class="col-md-4">
								<p>콘서트일자:<br><%= info.getDate().split(" ")[0] %></p>
							</div>
							<div class="col-md-4">
								<p>콘서트번호:<br><%= info.getConcertNo() %></p>
							</div>
						</div>
						<div class="row pb-3">
							<div class="col-md-4">
								<p>장소:<br><%= info.getLocation() %></p>
							</div>
							<div class="col-md-4">
								<p>콘서트명:<br><%= info.getTitle() %></p>
							</div>
							<div class="col-md-4">
								<p>주문 번호:<br><%= info.getOrderNo() %></p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8 align-self-center">
								<h3>시작예정시간: <%= info.getDate().split(" ")[1] %></h3>
							</div>
							<div class="col-md-4">
								<p>좌석:<br><%= String.join("/", info.getSeats()) %></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="d2 col-md-3">
				<div class="top row bg-primary pl-2">
					<h1 class="text-white"><%= info.getArtist() %></h1>
				</div>
				<div class="row text-left pt-3">
					<div class="col-md-5">
						<p>성명:<br><%= info.getFirstName() + " " + info.getLastName() %></p>
					</div>
					<div class="col-md-7">
						<p>주문 번호:<br><%= info.getOrderNo() %></p>
					</div>
				</div>
				<div class="row text-left pt-3">
					<div class="col-md-5">
						<p>장소:<br><%= info.getLocation() %></p>
					</div>
					<div class="col-md-7">
						<p>좌석:<br><%= String.join("/", info.getSeats()) %></p>
					</div>
				</div>
				<div class="row text-left pt-3">
					<div class="col-md-5">
						<p>날짜:<br><%= info.getDate().split(" ")[0] %></p>
					</div>
					<div class="col-md-7">
						<p>시작예정시간:<br><%= info.getDate().split(" ")[1] %></p>
					</div>
				</div>
			</div>
		</div></a>
		<% } %>
	</section>
</body>
</html>