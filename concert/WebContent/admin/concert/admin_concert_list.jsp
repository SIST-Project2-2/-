<%@page import="dao.ConcertDAO"%>
<%@page import="vo.ConcertVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int page_no = 1, list_size = 0;
ConcertDAO concert_dao = new ConcertDAO();
ArrayList<ConcertVO> concert_list = null;

Enumeration<String> parameter_names = request.getParameterNames();

// 파라미터들 중 'page_no'를 찾아내기 위한 반복문
while (parameter_names.hasMoreElements()) {
	String parameter_name = parameter_names.nextElement();
	// 'page_no'가 존재하면 작업
	if (parameter_name.equals("page_no")) {
		page_no = Integer.parseInt(request.getParameter(parameter_name));
	}
}
concert_list = concert_dao.get_concert_list(page_no, 10);
list_size = concert_list.size();
%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 콘서트 목록</title>
<script type="text/javascript">
	window.onload = function() {
		var tbody = $("#tbody");
<%String html = "";
for (int i = 0; i < list_size; i++) {
	html += "<tr>";
	html += "<th scope=\"row\">" + concert_list.get(i).getNo() + "</th>";
	html += "<td class=\"text-left\">" + concert_list.get(i).getTitle() + "</td>";
	html += "<td>" + concert_list.get(i).getArtist() + "</td>";
	html += "<td>" + concert_list.get(i).getCdate() + "</td>";
	html += "<td>" + concert_list.get(i).getLocation() + "</td>";
	html += "<td>";
	html += "	<a class=\"btn-sm btn-light\" href=\"admin_concert_edit.jsp\">수정</a>";
	html += "</td>";
	html += "<td>";
	html += "	<a type=\"button\" class=\"btn-sm btn-danger\" data-toggle=\"modal\" data-target=\"#exampleModal\" data-whatever=\""
			+ concert_list.get(i).getNo() + "\">삭제</a>";
	html += "</td>";
	html += "</tr>";
}%>
	tbody.html('<%=html%>');
	}
</script>
</head>
<body>
	<div class="container">
		<h1 class="font-weight-bold text-left">콘서트 목록</h1>

		<!-- 검색 창 -->
		<form action="#">
			<div class="row">
				<div class="col-8 container mb-3">
					<div class="input-group input-group-sm">
						<div class="input-group-prepend">
							<button class="btn btn-outline-info dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">카테고리</button>
							<div class="dropdown-menu">
								<div class="form-check dropdown-item">
									<input class="form-check-input" type="checkbox" value="title" name="category" id="title">
									<label class="form-check-label" for="title"> 콘서트 명 </label>
								</div>
								<div class="form-check dropdown-item">
									<input class="form-check-input" type="checkbox" value="artist" name="category" id="artist">
									<label class="form-check-label" for="artist"> 아티스트 </label>
								</div>
							</div>
						</div>
						<input type="text" class="form-control" placeholder="검색..." name="search" id="notice_list_search">
						<div class="input-group-append">
							<button type="button" class="btn btn-primary" id="notice_list_search_button">검색</button>
						</div>
					</div>
				</div>
			</div>
		</form>

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
			<tbody id="tbody">
			</tbody>
		</table>
		<div class="text-right">
			<a href="admin_concert_add.jsp" class="btn-sm btn-primary">등록</a>
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