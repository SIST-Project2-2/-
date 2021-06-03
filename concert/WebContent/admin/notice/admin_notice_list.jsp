<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO" %>
<%@ page import="vo.NoticeVO" %>
<%@ page import="vo.PageVO" %>
<%@ page import="concert.Commons" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	PrintWriter script = response.getWriter();
	NoticeDAO dao = new NoticeDAO(); // db 연결 객체
	ArrayList<NoticeVO> list = null; // 공지사항 목록
	PageVO pageInfo = null; // 페이지 정보를 저장하는 변수
	HashMap<String, Object> inputs = new HashMap<String, Object>(); // request 파라미터들을 저장
	String[] categories = {"전체", "제목", "내용"}; // 검색 카테고리 목록
	String url = request.getRequestURL().toString(); // 현 페이지 주소
	
	int pageNumber = 1;
	int category = 0;
	String search = "";
	
	// 요청 변수 저장
	if(request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		inputs.put("pageNumber", Integer.parseInt(request.getParameter("pageNumber")));
	}
	
	if(request.getParameter("category") != null) {
		category = Integer.parseInt(request.getParameter("category"));
		inputs.put("category", Integer.parseInt(request.getParameter("category")));
	}
	
	if(request.getParameter("search") != null) {
		search = request.getParameter("search");
		inputs.put("search", request.getParameter("search").toString());
	}
	
	// 목록 불러오기
	if(!search.equals("")) { // 검색
		list = dao.getNoticeListForAdmin(pageNumber, category, search);
		pageInfo = dao.getPageInfo(pageNumber, category, search);
	}else { // 기본
		list = dao.getNoticeListForAdmin(pageNumber);
		pageInfo = dao.getPageInfo(pageNumber);
	}
	
	dao.close(); // 데이터를 모두 불러온 뒤 dao 객체 닫기
%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 공지사항 목록</title>
<script type="text/javascript">
</script>
<script type="text/javascript">
	$(document).ready(function() {
		// 검색 카테고리 클릭시 카테고리 바뀜
		$("#category_all").click(function() {
			$("#category_dropdown").html("전체");
			$("#category").val(0);
		})
		$("#category_title").click(function() {
			$("#category_dropdown").html("제목");
			$("#category").val(1);
		})
		$("#category_content").click(function() {
			$("#category_dropdown").html("내용")
			$("#category").val(2);
		})
		
		// 검색 버튼 클릭시 검색
		$("#btn_search").click(function() {
			notice_list_search_form.submit();
		})
		
		// 삭제 버튼 클릭시 팝업
		$('#exampleModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var recipient = button.data('whatever') // Extract info from data-* attributes
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-title').text(+recipient + '번 게시글을 삭제하시겟습니까?')
		})
	});
</script>
</head>
<body>
	<section class="container text-center">
		<h1 class="font-weight-bold text-left">공지사항 목록</h1>

		<!-- 검색 창 -->
		<form class="row justify-content-center" name="notice_list_search_form" id="notice_list_search_form" action="" method="get">
			<input type="hidden" name="category" id="category" value="<%= category %>">
			<div class="col-md-6 d-block mb-3">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
						<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" id="category_dropdown">
    						<%= categories[category] %>
  						</button>
						<div class="dropdown-menu">
							<label class="dropdown-item" id="category_all" value="0">전체</label>
							<label class="dropdown-item" id="category_title" value="1">제목</label>
							<label class="dropdown-item" id="category_content" value="2">내용</label>
						</div>
					</div>
					<input type="text" class="form-control" placeholder="검색..." name="search" id="notice_list_search" value="<%= search %>">
					<div class="input-group-append">
						<button class="btn btn-light" type="button" id="btn_search">검색</button>
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
				<% for(NoticeVO notice : list) { %>
					<tr>
						<th scope="row"><%= notice.getNo() %></th>
						<td class="text-left"><%= notice.getTitle() %></td>
						<td><%= notice.getViews() %></td>
						<td><%= notice.getWriter() %></td>
						<td><%= notice.getDate() %></td>
						<td><a type="button" class="btn-sm btn-secondary" href="admin_notice_edit.jsp?no=<%= notice.getNo() %>">수정</a></td>
						<td><a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="<%= notice.getNo() %>">삭제</a></td>
					</tr>
				<% } %>
			</tbody>
		</table>
		<div class="text-right">
			<a href="admin_notice_add.jsp" class="btn-sm btn-primary">글쓰기</a>
		</div>
		<ul class="pagination justify-content-center">
			    <% if(pageInfo.isPrev()) { 
			    %> <!-- 현 페이지가 1페이지일 경우, 이전 페이지 비활성화 -->
				<li class="page-item"><a class="page-link" href="<%= Commons.get_page(url, inputs, pageNumber - 1) %>">&lt;</a></li>
				<% }else { %>
				<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
				<% 
					} 
			    int start = pageInfo.getStart();
			    int end = pageInfo.getEnd();
			    
			    for(int i=start;i<=end;i++) {
			    	if(i == pageNumber) {
				%>
				<li class="page-item active"><a class="page-link" href="<%= Commons.get_page(url, inputs, i) %>"><%= i %></a></li>
				<%	}else {%>
			    <li class="page-item"><a class="page-link" href="<%= Commons.get_page(url, inputs, i) %>"><%= i %></a></li>
				<%	} 
				} %>
			    <% if (pageInfo.isNext()) { 
			    %> <!-- 현 페이지가 마지막 페이지일 경우 다음 페이지 비홯성화 -->
				<li class="page-item"><a class="page-link" href="<%= Commons.get_page(url, inputs, pageNumber + 1) %>">&gt;</a></li>
				<% }else { %>
				<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
				<% } %>
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
</html>