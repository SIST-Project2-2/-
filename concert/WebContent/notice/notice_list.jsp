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
	<p>공지사항</p>
	<section id="content_notice_list">
		<!-- 공지사항 목록 검색 -->
		<form name="notice_list_form" id="notice_list_form">
			<input type="text" name="search" id="notice_list_search">
			<button type="button" id="notice_list_search_button">검색</button>
			<!-- 공지사항 목록 -->
			<table id="notice_list_table">
				<!-- 공지사항 제목 조회수 등등 목록으로 나타내기 -->
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>날짜</th>
				</tr>
				<tr>
					<td>1</td>
					<td>ㅁㅁㅁ</td>
					<td>123</td>
					<td>2021-05-21</td>
				</tr>
				<tr>
					<td>2</td>
					<td>ㅁㅁㅁ</td>
					<td>123</td>
					<td>2021-05-21</td>
				</tr>
				<tr>
					<td>3</td>
					<td>ㅁㅁㅁ</td>
					<td>123</td>
					<td>2021-05-21</td>
				</tr>
				<tr>
					<td>4</td>
					<td>ㅁㅁㅁ</td>
					<td>123</td>
					<td>2021-05-21</td>
				</tr>
			</table>
			<!-- 페이지 이동 버튼 목록 -->
			<div id="notice_list_page_list">
				<a href="#"><</a>
				<a href="#">1</a>
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
				<a href="#">></a>
			</div>
		</form>
	</section>
</body>
</html>

<!-- 공지사항 검색 sql문
select no, title, wdate, writer, views from notices
where regexp_like(title, '?') or regexp_like(content, '?'); -->