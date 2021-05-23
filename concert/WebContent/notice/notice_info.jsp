<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/concert/css/commons.css"> <!-- css 파일 경로 넣기! -->
<link rel="stylesheet" href="http://localhost:9000/concert/bootstrap-5.0.1/css/bootstrap.css">
<script src="http://localhost:9000/concert/bootstrap-5.0.1/js/bootstrap.js"></script>
<script src=""></script> <!-- js 파일 경로 넣기! -->
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	<h3>공지사항 상세</h3>
	<section class="container text-center" id="content_notice_info">
		<!-- 공지사항 상세내용 -->
		<table class="table" id="notice_info_table">
			<!-- 제목 -->
			<thead>
				<tr>
					<th class="col-1">1</th>
					<th class="col-7">공지입니다</th>
					<th class="col-2">123</th>
					<th class="col-2">2021-05-21</th>
				</tr>
			</thead>
			<!-- 내용 -->
			<tbody>
				<tr>
					<td colspan="4" style="text-align:left;">
						공지입니다~~~<br>
						공지입니다~~~<br>
						공지입니다~~~<br>
						공지입니다~~~<br>
						공지입니다~~~<br>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="row" style="border: 1px solid red;">
			<div class="justify-content-end">
				<button type="button" class="btn btn-primary" id="notice_info_back">목록으로</button>
			</div>
		</div>
	</section>
</body>
</html>