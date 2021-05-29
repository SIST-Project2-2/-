<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 콘서트 목록</title>
</head>
<body>
	<div class="container">
		<h1 class="font-weight-bold text-left">콘서트 목록</h1>
		<table class="table table-hover table-sm text-center">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col" class="text-left">콘서트 명</th>
					<th scope="col">아티스트</th>
					<th scope="col">날짜</th>
					<th scope="col">지역</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td class="text-left">장범준 희망 콘서트</td>
					<td>장범준</td>
					<td>2021-05-20</td>
					<td>대구</td>
					<td>
						<a class="btn-sm btn-light" href="admin_concert_edit.jsp">수정</a>
					</td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="1">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td class="text-left">장범준 희망 콘서트</td>
					<td>장범준</td>
					<td>2021-05-20</td>
					<td>대구</td>
					<td>
						<a class="btn-sm btn-light" href="admin_concert_edit.jsp">수정</a>
					</td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="1">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td class="text-left">장범준 희망 콘서트</td>
					<td>장범준</td>
					<td>2021-05-20</td>
					<td>대구</td>
					<td>
						<a class="btn-sm btn-light" href="admin_concert_edit.jsp">수정</a>
					</td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="1">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">4</th>
					<td class="text-left">장범준 희망 콘서트</td>
					<td>장범준</td>
					<td>2021-05-20</td>
					<td>대구</td>
					<td>
						<a class="btn-sm btn-light" href="admin_concert_edit.jsp">수정</a>
					</td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="1">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">5</th>
					<td class="text-left">장범준 희망 콘서트</td>
					<td>장범준</td>
					<td>2021-05-20</td>
					<td>대구</td>
					<td>
						<a class="btn-sm btn-light" href="admin_concert_edit.jsp">수정</a>
					</td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="1">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">6</th>
					<td class="text-left">장범준 희망 콘서트</td>
					<td>장범준</td>
					<td>2021-05-20</td>
					<td>대구</td>
					<td>
						<a class="btn-sm btn-light" href="admin_concert_edit.jsp">수정</a>
					</td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="1">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">7</th>
					<td class="text-left">장범준 희망 콘서트</td>
					<td>장범준</td>
					<td>2021-05-20</td>
					<td>대구</td>
					<td>
						<a class="btn-sm btn-light" href="admin_concert_edit.jsp">수정</a>
					</td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="1">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">8</th>
					<td class="text-left">장범준 희망 콘서트</td>
					<td>장범준</td>
					<td>2021-05-20</td>
					<td>대구</td>
					<td>
						<a class="btn-sm btn-light" href="admin_concert_edit.jsp">수정</a>
					</td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="1">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">9</th>
					<td class="text-left">장범준 희망 콘서트</td>
					<td>장범준</td>
					<td>2021-05-20</td>
					<td>대구</td>
					<td>
						<a class="btn-sm btn-light" href="admin_concert_edit.jsp">수정</a>
					</td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="1">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">10</th>
					<td class="text-left">장범준 희망 콘서트</td>
					<td>장범준</td>
					<td>2021-05-20</td>
					<td>대구</td>
					<td>
						<a class="btn-sm btn-light" href="admin_concert_edit.jsp">수정</a>
					</td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="1">삭제</a>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="text-right">
			<a href="admin_concert_add.jsp" class="btn-sm btn-primary">콘서트 등록</a>
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
	</div>


	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New message</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger">삭제</button>
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
		modal.find('.modal-title').text(+recipient + '번 콘서트을 삭제하시겟습니까?')
	})
</script>
</html>