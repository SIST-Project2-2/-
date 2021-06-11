<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO" %>
<%@ page import="vo.NoticeVO" %>
<%@ page import="concert.Commons" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	PrintWriter script = response.getWriter();
	NoticeDAO dao = new NoticeDAO(); // db 연결 객체
	ArrayList<NoticeVO> list = null; // 공지사항 목록
	HashMap<String, Integer> pageInfo = null; // 페이지네이션 정보
	HashMap<String, String[]> inputs = new HashMap<String, String[]>(request.getParameterMap()); // request 파라미터들을 저장
	String[] categories = {"전체", "제목", "내용"}; // 검색 카테고리 목록
	String url = request.getRequestURL().toString(); // 현 페이지 주소
	
	int noticePerPage = 10; // 한 페이지당 출력되는 공지 수
	int pageNumber = 1;
	int category = 3;
	String search = "";
	
	// 요청 변수 저장
	if(request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	if(request.getParameter("category") != null) {
		category = Integer.parseInt(request.getParameter("category"));
	}
	
	if(request.getParameter("search") != null) {
		search = request.getParameter("search");
	}
	
	// 목록 불러오기
	if(!search.equals("")) { // 검색
		list = dao.getNoticeListForAdmin(pageNumber, noticePerPage, category, search);
		pageInfo = Commons.getPageInfo(dao.getCount(pageNumber, category, search), pageNumber, noticePerPage);
	}else { // 기본
		list = dao.getNoticeListForAdmin(pageNumber, noticePerPage);
		pageInfo = Commons.getPageInfo(dao.getCount(pageNumber), pageNumber, noticePerPage);
	}
	
	dao.close(); // 데이터를 모두 불러온 뒤 dao 객체 닫기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 공지사항 목록</title>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<script type="text/javascript">
</script>
<script type="text/javascript">
	$(document).ready(function() {
		// 검색 카테고리 클릭시 카테고리 바뀜
		$("#check_title").change(function() {
			if($(this).is(":checked")) {
				$("#category").val(parseInt($("#category").val()) + 1);
			}else {
				$("#category").val(parseInt($("#category").val()) - 1);
			}
		})
		$("#check_content").change(function() {
			if($(this).is(":checked")) {
				$("#category").val(parseInt($("#category").val()) + 2);
			}else {
				$("#category").val(parseInt($("#category").val()) - 2);
			}
		})
		
		// 검색 버튼 클릭시 검색
		$("#btn_search").click(function() {
			notice_list_search_form.submit();
		})
		
		// 삭제 버튼 클릭시 팝업
		$('#deleteModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget)
			var recipient = button.data('whatever'); // 게시글 번호
			var modal = $(this);
			
			modal.find('.modal-title').text(+recipient + '번 게시글');
			
			modal.find('#btn_ok').click(function() {
				$.ajax({
					type: "get",
					url: "admin_notice_delete.jsp?no=" + recipient,
					dataType: "text",
					success: function(res) {
						if($.trim(res) == "true") { // 삭제 성공시 페이지 새로고침
							location.reload();
						}else {
							alert("error");
							// 에러 페이지 이동
						}
					}
				})
			})
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
						<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" id="category_dropdown">카테고리</button>
						<div class="dropdown-menu col-md-2">
							<div class="form-check dropdown-item">
								<input type="checkbox" class="form-check-input" id="check_title" <% if(category % 2 != 0) { %> checked <% } %>>
								<label class="form-check-label" for="check_title">제목</label>
							</div>
							<div class="form-check dropdown-item">
								<input type="checkbox" class="form-check-input" id="check_content" <% if(category >= 2) { %> checked <% } %>>
								<label class="form-check-label" for="check_content">내용</label>
							</div>
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
				<% if(list.size() == 0) { %>
					<tr>
						<td class="text-center" colspan="7">데이터가 없습니다.</td>
					</tr>
				<% }
					for(NoticeVO notice : list) { 
				%>
					<tr>
						<th scope="row"><%= notice.getNo() %></th>
						<td class="text-left"><a class="text-body text-decoration-none" href="../../notice/notice_info.jsp?no=<%= notice.getNo() %>"><%= notice.getTitle() %></a></td>
						<td><%= notice.getViews() %></td>
						<td><%= notice.getWriter() %></td>
						<td><%= notice.getDate() %></td>
						<td><a type="button" class="btn-sm btn-secondary" href="admin_notice_edit.jsp?no=<%= notice.getNo() %>">수정</a></td>
						<td><a type="button" class="btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal" data-whatever="<%= notice.getNo() %>">삭제</a></td>
					</tr>
				<% } %>
			</tbody>
		</table>
		<div class="text-right">
			<a href="admin_notice_add.jsp" class="btn-sm btn-primary">글쓰기</a>
		</div>
		<ul class="pagination justify-content-center mt-3">
		    <!-- 현 페이지가 1페이지일 경우, 이전 페이지 비활성화 -->
			<li class="page-item <% if(pageInfo.get("prev") != 1) { %> disabled <% } %>"><a class="page-link" href="<%= Commons.get_page(url, inputs, pageNumber - 1) %>">&lt;</a></li>
			<% 
		    int start = pageInfo.get("start");
		    int end = pageInfo.get("end");
		    
		    for(int i=start;i<=end;i++) {
			%>
			<li class="page-item <% if(i == pageNumber) { %>active <% } %>"><a class="page-link" href="<%= Commons.get_page(url, inputs, i) %>"><%= i %></a></li>
			<% } %>
		    <!-- 현 페이지가 마지막 페이지일 경우 다음 페이지 비홯성화 -->
			<li class="page-item <% if(pageInfo.get("next") != 1) { %> disabled <% } %>"><a class="page-link" href="<%= Commons.get_page(url, inputs, pageNumber + 1) %>">&gt;</a></li>
	  </ul>
	</section>
	<!-- 삭제 메시지 팝업 -->
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel"></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        정말로 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="btn_ok">삭제</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>