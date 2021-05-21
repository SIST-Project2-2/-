<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/concert/css/commons.css"> <!-- css 파일 경로 넣기! -->
<script src=""></script> <!-- js 파일 경로 넣기! -->
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	<p>공지사항 상세</p>
	<section id="content_notice_info">
		<!-- 공지사항 상세내용 -->
		<div id="notice_info">
			<table id="notice_info_table">
				<!-- 제목 -->
				<tr>
					<th>제목</th>
				</tr>
				<!-- 내용 -->
				<tr>
					<td>내용</td>
				</tr>
			</table>
			<button type="button" id="notice_info_back">뒤로가기</button>
		</div>
	</section>
</body>
</html>