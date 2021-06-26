<%@page import="concert.Commons"%>
<%@page import="dao.ConcertDAO"%>
<%@page import="vo.ConcertVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%
	//
int concert_no = Integer.parseInt(request.getParameter("concert_no"));

ConcertDAO dao = new ConcertDAO();
ConcertVO vo = dao.getConcertInfo(concert_no);
%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=vo.getTitle()%></title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1 class="clearfix col-9 d-inline-block float-lfet font-weight-bold text-left"><%=vo.getArtist()%></h1>
			<div class="clearfix col-9">

				<div class="border rounded p-2" style="height: 800px">
					<%=vo.getContent()%>
				</div>
			</div>

			<div class="border rounded col-3">
				<h3 class="text-center" style="margin: 50px 0;">예매하기</h3>
				<ul class="float-lfet" style="padding-left: 20px;">
					<li style="margin-bottom: 10px;">
						<div class="row text-left">
							<div>
								<small class="d-block text-left text-dark m-2">가수</small>
								<select class="form-control-sm" disabled>
									<optgroup label="가수">
										<option selected><%=vo.getArtist()%></option>
									</optgroup>
								</select>
							</div>
						</div>
					</li>
					<li style="margin-bottom: 10px;">
						<div class="row text-left">
							<div>
								<small class="d-block text-left text-dark m-2">날짜</small>
								<input type="date" value="<%=vo.getCdate()%>" disabled>
							</div>
						</div>
					</li>
				</ul>
				<a class="d-block btn btn-light m-2 p-2" href="http://localhost:9000/concert/concert/concert_reservation.jsp?concert_no=<%=concert_no%>">예매하기</a>
			</div>
		</div>
	</div>
</body>
</html>