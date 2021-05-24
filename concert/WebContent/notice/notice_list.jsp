<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src=""></script> <!-- js 파일 경로 넣기! -->
<style>
	.card {
		width: 250px; height: 420px;
	}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	<h3>공지사항</h3>
	<section class="container text-center" id="content_notice_list">
		<!-- 공지사항 목록 검색 -->
		<form class="row justify-content-end" name="notice_list_search_form" id="notice_list_search_form">
			<div class="col-6 d-block">
				<div class="input-group input-group-sm">
					<input type="text" class="form-control" placeholder="검색..." name="search" id="notice_list_search">
					<div class="input-group-append">
						<button type="button" class="btn btn-primary" id="notice_list_search_button">검색</button>
					</div>
				</div>
			</div>
			<div class="row text-right">
				<div class="col-4">
					<small class="text-left text-dark">가수</small>
					<select class="form-control-sm">
						<option>장범준</option>
						<option>잔나비</option>
						<option>10cm</option>
						<option>현아</option>
						<option>아이유</option>
					</select>
				</div>
				<div class="col-4">
					<small class="text-left text-dark">날짜</small>
					<select class="form-control-sm">
						<option>21년05월24일</option>
						<option>21년05월25일</option>
						<option>21년05월26일</option>
					</select>
				</div>
			</div>
		</form>
		<!-- 공지사항 목록 -->
		<div class="container text-left">
			<div class="card d-inline-block">
				<img class="card-img-top" src="../images/장범준.jpg">
				<div class="card-body font-weight-bold">
					<kbd>#일정1</kbd>
					<kbd>#일정2</kbd>
					<kbd>#일정3</kbd>
					<h4 class="card-title text-left">공지사항입니다</h4>
					<p class="card-text text-left text-dark">공지사항 내용~~~</p>
					<p class="card-text text-left text-dark">2021-05-24</p>
				</div>
			</div>
			<div class="card d-inline-block">
				<img class="card-img-top" src="../images/장범준.jpg">
				<div class="card-body font-weight-bold">
					<kbd>#일정1</kbd>
					<kbd>#일정2</kbd>
					<kbd>#일정3</kbd>
					<h4 class="card-title text-left">공지사항입니다</h4>
					<p class="card-text text-left text-dark">공지사항 내용~~~</p>
					<p class="card-text text-left text-dark">2021-05-24</p>
				</div>
			</div>
			<div class="card d-inline-block">
				<img class="card-img-top" src="../images/장범준.jpg">
				<div class="card-body font-weight-bold">
					<kbd>#일정1</kbd>
					<kbd>#일정2</kbd>
					<kbd>#일정3</kbd>
					<h4 class="card-title text-left">공지사항입니다</h4>
					<p class="card-text text-left text-dark">공지사항 내용~~~</p>
					<p class="card-text text-left text-dark">2021-05-24</p>
				</div>
			</div>
			<div class="card d-inline-block">
				<img class="card-img-top" src="../images/장범준.jpg">
				<div class="card-body font-weight-bold">
					<kbd>#일정1</kbd>
					<kbd>#일정2</kbd>
					<kbd>#일정3</kbd>
					<h4 class="card-title text-left">공지사항입니다</h4>
					<p class="card-text text-left text-dark">공지사항 내용~~~</p>
					<p class="card-text text-left text-dark">2021-05-24</p>
				</div>
			</div>
			<div class="card d-inline-block">
				<img class="card-img-top" src="../images/장범준.jpg">
				<div class="card-body font-weight-bold">
					<kbd>#일정1</kbd>
					<kbd>#일정2</kbd>
					<kbd>#일정3</kbd>
					<h4 class="card-title text-left">공지사항입니다</h4>
					<p class="card-text text-left text-dark">공지사항 내용~~~</p>
					<p class="card-text text-left text-dark">2021-05-24</p>
				</div>
			</div>
		</div>
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