
<%@page import="dao.ConcertDAO"%>
<%@page import="vo.ConcertVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="/error.jsp"%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>


<%

String concert_no =request.getParameter("concert_no");
ConcertDAO dao = new ConcertDAO();
ConcertVO vo = dao.getConcertInfo(concert_no);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 콘서트 수정</title>
<script type="text/javascript">
	window.onload = function() {
		var artist = document.getElementById("artist");
		var date = document.getElementById("date");
		var count = document.getElementById("count");

		for (var i = 1; i < artist.length; i++) {
			artist.options[i].selected = false;
		}
		artist.options[1].selected = true;

		date.value = "2021-05-30";

		for (var i = 1; i < count.length; i++) {
			count.options[i].selected = false;
		}
		count.options[1].selected = true;

	}
</script>
</head>
<body>
		<form name="concert_update" method="post" action="admin_concert_edit_action.jsp" >
		<input type="hidden" name="no" value=<%= concert_no %>>
		<div class="container border border-dark rounded">
		<div class="row my-3">
			<div class="col-md">
				<h3>콘서트 수정</h3>
			</div>
			<div class="col-md-4 text-right">
				<button class="btn btn-outline-dark" >임시저장</button>
				<button class="btn btn-outline-dark" type="submit">등록하기</button>
			</div>
		</div>

		<div class="row m-1">
			<div class="col-md-2">
				<h6>가수</h6>
			</div>
			<div class="col-md-3">
				<h6>날짜</h6>
			</div>
			<div class="col-md-2">
				<h6>지역</h6>
			</div>
		</div>
			<div class="row m-1">
				<div class="col-md-2">
					<select class="custom-select" name="artist" id="artist" required="required">
						<option selected><%= vo.getArtist() %></option>
						<option value="장범준">장범준</option>
						<option value="잔나비">잔나비</option>
						<option value="현아">현아</option>
						<option value="아이유">아이유</option>
						<option value="10cm">10cm</option>
					</select>
				</div>
				<div class="col-md-3">
					<input type="date" class="form-control" name="date" id="date" required="required" value="<%= vo.getCdate() %>">
				</div>
				<div class="col-md-2">
					<select class="custom-select" name="location" id="location">
						<option selected><%= vo.getLocation() %></option>
						<option value="서울">서울</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청도">충청도</option>
						<option value="경상도">경상도</option>
						<option value="전라도">전라도</option>
					</select>
				</div>
			</div>
			<div class="row m-1">
				<div class="col-md">
					<input type="text" class="form-control" value=" <%= vo.getTitle() %> " name="title" id="title">
				</div>
			</div>
			<div class="row m-1">
				<div class="col-md">
					<div class="border rounded p-3 mb-2">
						<div class="btn-group mt-2">
							<button type="button" class="btn btn-outline-dark">Text</button>
							<button type="button" class="btn btn-outline-dark">이미지 삽입</button>
						</div>
						<hr>
						<textarea class="form-control border-0" style="height: 600px;" name="content" id="content" ><%= vo.getContent() %></textarea>
					</div>
				</div>
			</div>

	</div>
		</form>
</body>
</html>