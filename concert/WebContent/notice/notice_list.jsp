<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href=""> <!-- css 파일 경로 넣기! -->
<script src=""></script> <!-- js 파일 경로 넣기! -->
</head>
<body>
	<p>공지사항</p>
	<div id="content_notice_list">
		<!-- 공지사항 목록 검색 -->
		<form id="notice_list_search">
			<input type="text">
			<button type="button" id="notice_list_search_button"></button>
		</form>
		<!-- 공지사항 목록 -->
		<ul id="notice_list_list">
			<li>
			<!-- 공지사항 제목 조회수 등등 목록으로 나타내기 -->
			</li>
		</ul>
		<!-- 페이지 이동 버튼 목록 -->
		<div id="notice_list_page_list"></div>
	</div>
</body>
</html>