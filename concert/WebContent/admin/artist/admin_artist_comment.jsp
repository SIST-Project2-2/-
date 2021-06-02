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
	width: 80%;
}

.box {
	display: inline-block;
	width: 150px;
}
</style>
</head>
<body>
	<h3>댓글관리</h3>
	<div class="text-right" >
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
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-6 text-center">
				<input type="text">
				<button type="button">돋보기</button>
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
	<div>
		<table class="table">
			<tr>
				<td class="comment_content">장범준 댓글내용</td>
				<td class="comment_buttons">
					<button type="button">신고수</button>
					<button type="button">추천수</button>
					<button type="button">삭제</button>
				</td>
			</tr>
			<tr>
				<td class="comment_content">장범준 댓글내용</td>
				<td class="comment_buttons">
					<button type="button">신고수</button>
					<button type="button">추천수</button>
					<button type="button">삭제</button>
				</td>
			</tr>
			<tr>
				<td class="comment_content">장범준 댓글내용</td>
				<td class="comment_buttons">
					<button type="button">신고수</button>
					<button type="button">추천수</button>
					<button type="button">삭제</button>
				</td>
			</tr>
			<tr>
				<td class="comment_content">장범준 댓글내용</td>
				<td class="comment_buttons">
					<button type="button">신고수</button>
					<button type="button">추천수</button>
					<button type="button">삭제</button>
				</td>
			</tr>
			<tr>
				<td class="comment_content">장범준 댓글내용</td>
				<td class="comment_buttons">
					<button type="button">신고수</button>
					<button type="button">추천수</button>
					<button type="button">삭제</button>
				</td>
			</tr>
			<tr>
				<td class="comment_content">장범준 댓글내용</td>
				<td class="comment_buttons">
					<button type="button">신고수</button>
					<button type="button">추천수</button>
					<button type="button">삭제</button>
				</td>
			</tr>
			<tr>
				<td class="comment_content">장범준 댓글내용</td>
				<td class="comment_buttons">
					<button type="button">신고수</button>
					<button type="button">추천수</button>
					<button type="button">삭제</button>
				</td>
			</tr>
			<tr>
				<td class="comment_content">장범준 댓글내용</td>
				<td class="comment_buttons">
					<button type="button">신고수</button>
					<button type="button">추천수</button>
					<button type="button">삭제</button>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</div>
</body>
</html>