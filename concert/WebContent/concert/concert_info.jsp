<%@page import="dao.ConcertDAO"%>
<%@page import="vo.ConcertVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%


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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1 class="clearfix col-9 d-inline-block float-lfet font-weight-bold text-left"><%=vo.getArtist()%></h1>
			<div class="clearfix col-9">

				<div class="border" style="height: 800px">
					<%=vo.getContent()%>
				</div>
			</div>

			<div class="border col-3">

				<h3 class="text-center" style="margin: 50px 0;">예매하기</h3>
				<ul class="float-lfet" style="padding-left: 20px;">
					<li style="margin-bottom: 10px;">
						<div class="row text-left">
							<div>
								<small class="d-block text-left text-dark ml-2">가수</small>
								<select class="form-control-sm" disabled>
									<optgroup label="가수">
										<option selected><%=vo.getArtist()%></option>
										<option>잔나비</option>
										<option>10cm</option>
										<option>현아</option>
										<option>아이유</option>
									</optgroup>
								</select>
							</div>
						</div>
					</li>
					<li style="margin-bottom: 10px;">
						<div class="row text-left">
							<div>
								<small class="d-block text-left text-dark ml-2">날짜</small>
								<input type="date" value="<%=vo.getCdate()%>" disabled>
							</div>
						</div>
					</li>
					<li>
						<div class="row text-left">
							<div class="">
								<small class="d-block text-left text-dark ml-2">인원수</small>
								<select style="margin-bottom: 5px;" class="form-control-sm">
									<optgroup label="인원수">
										<option>성인1명</option>
										<option>성인2명</option>
										<option>성인3명</option>
										<option>성인4명</option>
									</optgroup>
								</select>
								<p class="text-danger" style="margin-bottom: 0; font-size: 12px">코로나 상황으로 인해 5인 이상 예매 불가능 합니다.</p>
							</div>
						</div>
					</li>
				</ul>
				<a class="container btn btn-light" href="http://localhost:9000/concert/concert/concert_reservation.jsp">좌석고르기</a>
			</div>
		</div>
	</div>
</body>
</html>

