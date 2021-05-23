<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>

	<section class="container text-center">
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
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td class="text-left">공지사항입니다123</td>
					<td>10</td>
					<td>이창민</td>
					<td>2021-05-20 19:16</td>
					<td><a class="btn-sm btn-light" href="admin_notice_edit.jsp">수정</a></td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="1">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td class="text-left">공지사항입니다</td>
					<td>10</td>
					<td>이창민</td>
					<td>2021-05-20 19:16</td>
					<td><a class="btn-sm btn-light" href="admin_notice_edit.jsp">수정</a></td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="2">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td class="text-left">공지사항입니다</td>
					<td>10</td>
					<td>이창민</td>
					<td>2021-05-20 19:16</td>
					<td><a class="btn-sm btn-light" href="admin_notice_edit.jsp">수정</a></td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="3">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">4</th>
					<td class="text-left">공지사항입니다</td>
					<td>10</td>
					<td>이창민</td>
					<td>2021-05-20 19:16</td>
					<td><a class="btn-sm btn-light" href="admin_notice_edit.jsp">수정</a></td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="4">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">5</th>
					<td class="text-left">공지사항입니다</td>
					<td>10</td>
					<td>이창민</td>
					<td>2021-05-20 19:16</td>
					<td><a class="btn-sm btn-light" href="admin_notice_edit.jsp">수정</a></td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="5">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">6</th>
					<td class="text-left">공지사항입니다</td>
					<td>10</td>
					<td>이창민</td>
					<td>2021-05-20 19:16</td>
					<td><a class="btn-sm btn-light" href="admin_notice_edit.jsp">수정</a></td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="6">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">7</th>
					<td class="text-left">공지사항입니다</td>
					<td>10</td>
					<td>이창민</td>
					<td>2021-05-20 19:16</td>
					<td><a class="btn-sm btn-light" href="admin_notice_edit.jsp">수정</a></td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="7">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">8</th>
					<td class="text-left">공지사항입니다</td>
					<td>10</td>
					<td>이창민</td>
					<td>2021-05-20 19:16</td>
					<td><a class="btn-sm btn-light" href="admin_notice_edit.jsp">수정</a></td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="8">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">9</th>
					<td class="text-left">공지사항입니다</td>
					<td>10</td>
					<td>이창민</td>
					<td>2021-05-20 19:16</td>
					<td><a class="btn-sm btn-light" href="admin_notice_edit.jsp">수정</a></td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="9">삭제</a>
					</td>
				</tr>
				<tr>
					<th scope="row">10</th>
					<td class="text-left">공지사항입니다</td>
					<td>10</td>
					<td>이창민</td>
					<td>2021-05-20 19:16</td>
					<td><a class="btn-sm btn-light" href="admin_notice_edit.jsp">수정</a></td>
					<td>
						<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="10">삭제</a>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="text-right">
			<a href="admin_notice_add.jsp" class="btn-sm btn-primary">글쓰기</a>
		</div>
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#">&lt;</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
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