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
	<h3>공지사항</h3>
	<section class="container text-center" id="content_notice_list">
		<!-- 공지사항 목록 검색 -->
		<form class="row justify-content-end" name="notice_list_search_form" id="notice_list_search_form">
			<div class="col-4">
				<div class="input-group input-group-sm">
					<input type="text" class="form-control" placeholder="검색..." name="search" id="notice_list_search">
					<button type="button" class="btn btn-primary" id="notice_list_search_button">검색</button>
				</div>
			</div>
		</form>
		<!-- 공지사항 목록 -->
		<table class="table table-hover" id="notice_list_table">
			<!-- 공지사항 제목 조회수 등등 목록으로 나타내기 -->
			<thead>
				<tr>
					<th class="col-1" scope="col">번호</th>
					<th class="col-7" scope="col">제목</th>
					<th class="col-2" scope="col">조회수</th>
					<th class="col-2" scope="col">날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td scope="row">1</td>
					<td><a class="text-reset text-decoration-none" href="#">공지입니다</a></td>
					<td>123</td>
					<td>2021-05-21</td>
				</tr>
				<tr>
					<td scope="row">2</td>
					<td><a class="text-reset text-decoration-none" href="#">공지입니다</a></td>
					<td>123</td>
					<td>2021-05-21</td>
				</tr>
				<tr>
					<td scope="row">3</td>
					<td><a class="text-reset text-decoration-none" href="#">공지입니다</a></td>
					<td>123</td>
					<td>2021-05-21</td>
				</tr>
				<tr>
					<td scope="row">4</td>
					<td><a class="text-reset text-decoration-none" href="#">공지입니다</a></td>
					<td>123</td>
					<td>2021-05-21</td>
				</tr>
			</tbody>
		</table>
		<!-- 페이지 이동 버튼 목록 -->
		<nav class="">
		  <ul class="pagination justify-content-center">
		    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">Next</a></li>
		  </ul>
		</nav>
	</section>
</body>
</html>

<!-- 
공지사항 검색 sql문
select no, title, wdate, writer, views from notices
where regexp_like(title, '?') or regexp_like(content, '?');

리스트 페이징 sql문
select * from (select rownum as rno, no, title, wdate, views
	from notices
	where rownum =< 10 * ?
	order by no desc)
where rno > 10 * (? - 1);
-->