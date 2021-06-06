<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO, vo.MemberVO, java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> list = dao.getList();
	String id = request.getParameter("id");
%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script type="text/javascript">
$(document).ready(function(){
	if($("#id").is(":checked") == true) {
		
	}
});
<!--
	window.onload = function() {
		var table_body = document.getElementById("table_body");

		for (var i = 0; i < list.length; i++) {
			table_body.innerHTML += '<tr>'
					+ '<th scope="row">HWISAEK</th>'
					+ '<td class="text-left">휘색</td>'
					+ '<td>이창민</td>'
					+ '<td>010-1234-5678</td>'
					+ '<td>example@test.com</td>'
					+ '<td>'
					+ '	<a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="'+i+'">삭제</a>'
					+ '</td>' + '</tr>';
		}
	}
	-->
</script>
<style>
form div {
	text-align: center;
}

form div.table, td {
	border-collapse: collapse;
	text-align: center;
}

div#member_delete {
	margin: auto;
	width: 50%;
}
</style>
</head>
<body>
	<section class="container text-center">
		<h1 class="font-weight-bold text-left">회원 관리</h1>

		<!-- 검색 창 -->
		<form action="#">
			<div class="row">
				<div class="col-8 container mb-3">
					<div class="input-group input-group-sm">
						<!-- <select class="custom-select col-2" id="category">
							<option value="title" selected>제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</select> -->
						<div class="input-group-prepend">
							<button class="btn btn-outline-info dropdown-toggle"
								type="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">카테고리</button>
							<div class="dropdown-menu">
								<div class="form-check dropdown-item">
									<input class="form-check-input" type="checkbox" value="id"
										name="category" id="id"> <label
										class="form-check-label" for="id"> 아이디 </label>
								</div>
								<div class="form-check dropdown-item">
									<input class="form-check-input" type="checkbox" value="content"
										name="category" id="content"> <label
										class="form-check-label" for="content"> 닉네임 </label>
								</div>
							</div>
						</div>
						<input type="text" class="form-control" placeholder="검색..."
							name="search" id="notice_list_search">
						<div class="input-group-append">
							<button type="button" class="btn btn-primary"
								id="notice_list_search_button">검색</button>
						</div>
					</div>
				</div>
			</div>
		</form>

		<table class="table table-hover table-sm">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">닉네임</th>
					<th scope="col">이름</th>
					<th scope="col">전화번호</th>
					<th scope="col">이메일</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody id="table_body">
				<%
					for (MemberVO vo : list) {
				%>
				<tr>
					<th scope="row"><%=vo.getId()%></th>
					<td class="text-left"><%=vo.getNickname()%></td>
					<td><%=vo.getLast_name()%><%=vo.getFirst_name()%></td>
					<td><%=vo.getPhone()%></td>
					<td><%=vo.getEmail()%></td>
					<td><a href="admin_member_list_delete_process.jsp?id=<%=vo.getId()%>"><button type="button" class="btn-sm btn-danger">삭제</button></a>
					
					<!-- 
					<td><a href="admin_member_list_delete_process.jsp?id=<%=id%>" type="button" class="btn-sm btn-danger"
						data-toggle="modal" data-target="#exampleModal"
						data-whatever="'+i+'">삭제</a></td>
						 -->
				</tr>
				<%
					}
				%>
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

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New message</h5>
					<a type="button" class="close" data-dismiss="modal"
						aria-label="Close"> <span aria-hidden="true">&times;</span>
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