<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.comment_content {
	width: 75%;
}
.comment_button {
	margin: 0 auto;
}
.box {
	display: inline-block;
	width: 150px;
}

table span.s1 {
	border: 1px solid black;
	padding: 5px;
	margin-right: 5px;
}
div.d2 {
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<section class="container text-center">
		<h1 class="font-weight-bold text-left">댓글관리</h1>
		
		<!-- 가수 선택 박스 -->
		<div class="d1 container text-right">
			<div class="box">
				<label>가수</label> <select class="custom-select">
					<option selected>선택</option>
					<option value="1">10cm</option>
					<option value="2">IU</option>
					<option value="3">잔나비</option>
					<option value="4">장범준</option>
					<option value="5">현아</option>
				</select>
			</div>
		</div>
		
		<!-- 검색창과 신고수 정렬 방법 선택 박스 -->
		<div class="d2 container">
			<div class="row">
				<div class="col"></div>
				<div class="col-6 text-center">
					<div class="input-group">
						<input type="text" class="form-control">
						<span class="input-group-btn">
							<button type="button" class="btn btn-primary">검색</button>
						</span>
					</div>
				</div>
				<div class="col text-right">
					<div class="box">
						<div>
							<label>신고수</label>
						</div>
						<select class="custom-select">
							<option selected>내림차순</option>
							<option value="1">오름차순</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		
		<table class="table">
			<tr>
				<td class="comment_content text-left">장범준 댓글내용</td>
				<td class="comment_buttons">
				<div class="input-group">
					<span class="s1">신고수 10</span>
					<span class="s1">추천수 10</span>
					<span class="input-group-btn">
						<button type="button" class="btn btn-danger">삭제</button></td>
					</span>
				</div>
			</tr>
			<tr>
				<td class="comment_content text-left">장범준 댓글내용</td>
				<td class="comment_buttons">
				<div class="input-group">
					<span class="s1">신고수 10</span>
					<span class="s1">추천수 10</span>
					<span class="input-group-btn">
						<button type="button" class="btn btn-danger">삭제</button></td>
					</span>
				</div>
			</tr>
			<tr>
				<td class="comment_content text-left">장범준 댓글내용</td>
				<td class="comment_buttons">
				<div class="input-group">
					<span class="s1">신고수 10</span>
					<span class="s1">추천수 10</span>
					<span class="input-group-btn">
						<button type="button" class="btn btn-danger">삭제</button></td>
					</span>
				</div>
			</tr>
			<tr>
				<td class="comment_content text-left">장범준 댓글내용</td>
				<td class="comment_buttons">
				<div class="input-group">
					<span class="s1">신고수 10</span>
					<span class="s1">추천수 10</span>
					<span class="input-group-btn">
						<button type="button" class="btn btn-danger">삭제</button></td>
					</span>
				</div>
			</tr>
			<tr>
				<td class="comment_content text-left">장범준 댓글내용</td>
				<td class="comment_buttons">
				<div class="input-group">
					<span class="s1">신고수 10</span>
					<span class="s1">추천수 10</span>
					<span class="input-group-btn">
						<button type="button" class="btn btn-danger">삭제</button></td>
					</span>
				</div>
			</tr>
			<tr>
				<td class="comment_content text-left">장범준 댓글내용</td>
				<td class="comment_buttons">
				<div class="input-group">
					<span class="s1">신고수 10</span>
					<span class="s1">추천수 10</span>
					<span class="input-group-btn">
						<button type="button" class="btn btn-danger">삭제</button></td>
					</span>
				</div>
			</tr>
			<tr>
				<td class="comment_content text-left">장범준 댓글내용</td>
				<td class="comment_buttons">
				<div class="input-group">
					<span class="s1">신고수 10</span>
					<span class="s1">추천수 10</span>
					<span class="input-group-btn">
						<button type="button" class="btn btn-danger">삭제</button></td>
					</span>
				</div>
			</tr>
			<tr>
				<td class="comment_content text-left">장범준 댓글내용</td>
				<td class="comment_buttons">
				<div class="input-group">
					<span class="s1">신고수 10</span>
					<span class="s1">추천수 10</span>
					<span class="input-group-btn">
						<button type="button" class="btn btn-danger">삭제</button></td>
					</span>
				</div>
			</tr>
		</table>
		
		<div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&lt;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&gt;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</section>
</body>
</html>