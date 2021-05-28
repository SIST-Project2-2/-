<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 공지사항 목록</title>
<script type="text/javascript">
	window.onload = function() {
		var table_body = document.getElementById("table_body");

		for (var i = 1; i <= 10; i++) {
			table_body.innerHTML += '<tr>'
					+ '<th scope="row">'
					+ i
					+ '</th>'
					+ '<td class="text-left">공지사항입니다123</td>'
					+ '<td>10</td>'
					+ '<td>이창민</td>'
					+ '<td>2021-05-20 19:16</td>'
					+ '<td>'
					+ '	<a class="btn-sm btn-light" href="admin_notice_edit.jsp">수정</a>'
					+ '</td>'
					+ '<td>'
					+ '	<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="'+i+'">삭제</a>'
					+ '</td>' + '</tr>';
		}
	}
</script>
</head>
<body>
	<section class="container text-center">
		<h1 class="font-weight-bold text-left">공지사항 목록</h1>

		<!-- 검색 창 -->
		<form action="#">
			<div class="row">
				<div class="col-8 container mb-3">
					<div class="input-group input-group-sm">
						<select class="custom-select col-2" id="category">
							<option value="title" selected>제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</select> <input type="text" class="form-control" placeholder="검색..." name="search" id="notice_list_search">
						<div class="input-group-append">
							<button type="button" class="btn btn-primary" id="notice_list_search_button">검색</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<table class="table table-hover table-sm">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col" class="text-left">제목</th>
					<th scope="col">조회수</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일자</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody id="table_body">
			</tbody>
		</table>
		<div class="text-right">
			<a href="admin_notice_add.jsp" class="btn-sm btn-primary">글쓰기</a>
		</div>
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" href="#">&lt;</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">1</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">2</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">3</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="#">&gt;</a>
			</li>
		</ul>
	</section>

	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New message</h5>
					<a type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</a>
				</div>
				<div class="modal-footer">
					<a type="button" class="btn-sm btn-secondary" data-dismiss="modal">취소</a>
					<a type="button" class="btn-sm btn-danger">삭제</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$('#exampleModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var recipient = button.data('whatever') // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		var modal = $(this)
		modal.find('.modal-title').text(+recipient + '번 게시글을 삭제하시겟습니까?')
	})
</script>
</html>