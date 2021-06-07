<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="vo.CommentVO" %>
<%@ page import="vo.PageVO" %>
<%@ page import="dao.CommentDAO" %>
<%@ page import="concert.Commons" %>
<%
	PrintWriter script = response.getWriter();
	CommentDAO dao = new CommentDAO();
	ArrayList<CommentVO> list = null;
	PageVO pageInfo = null;
	HashMap<String, String[]> inputs = new HashMap<String, String[]>(request.getParameterMap());
	String url = request.getRequestURL().toString(); // 현 페이지 주소
	String[] artists = {"전체", "10cm", "IU", "잔나비", "장범준", "현아"};
	
	// 여기에 관리자 계정으로 로그인되어 있는지 확인하는 코드 넣기~~~
	
	// 각 파라미터 기본값으로 초기화
	int pageNumber = 1;
	int order = 0;
	String artist = "";
	String search = "";
	
	// 입력받은 파라미터가 있을 경우 그 값으로 초기화
	if(inputs.get("pageNumber") != null) {
		pageNumber = Integer.parseInt(inputs.get("pageNumber")[0]);
	}
	
	if(inputs.get("order") != null) {
		order = Integer.parseInt(inputs.get("order")[0]);
	}
	
	if(inputs.get("artist") != null) {
		artist = inputs.get("artist")[0];
	}
	
	if(inputs.get("search") != null) {
		search = inputs.get("search")[0];
	}
	
	// db에서 입력받은 파라미터로 데이터 조회
	if(!artist.equals("") && !artist.equals("전체") && !search.equals("")) { // 아티스트별 검색
		list = dao.getCommentListSearch(pageNumber, order, artist, search);
		pageInfo = dao.getPageInfoSearch(pageNumber, artist, search);
	}else if(!artist.equals("") && !artist.equals("전체")) { // 아티스트별
		list = dao.getCommentList(pageNumber, order, artist);
		pageInfo = dao.getPageInfo(pageNumber, artist);
	}else if(!search.equals("")) { // 검색
		list = dao.getCommentListSearch(pageNumber, order, search);
		pageInfo = dao.getPageInfoSearch(pageNumber, search);
	}else { // 기본
		list = dao.getCommentList(pageNumber, order);
		pageInfo = dao.getPageInfo(pageNumber);
	}
	
	// db에서 필요한 데이터를 모두 가져온 뒤 dao 객체 닫음
	dao.close();
%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아티스트 댓글 관리</title>
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
<script>
	$(document).ready(function() {
		var url = $("#url").val();
		var params = url.split(".jsp?")[1].split("&");
		var inputs = [];
		for(var i=0;i<params.length;i++) {
			var pair = params[i].split("="); 
			inputs[pair[0]] = pair[1];
		}

		$("#btn_search").click(function() {
			admin_artist_comment_search_form.submit();
		})
		
		// 정렬방식을 유지하면서 아티스트 변경
		$("#artist").change(function() {
			inputs["artist"] = $(this).val();
			var url = getUrl("admin_artist_comment.jsp?", inputs);
			location.href = url;
		});
		
		// 아티스트를 유지하면서 정렬방식 변경
		$("#order").change(function() {
			inputs["order"] = $(this).val();
			var url = getUrl("admin_artist_comment.jsp?", inputs);
			location.href = url;
		});
		
		// 삭제 버튼 클릭시 팝업
		$('#deleteModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget)
			var recipient = button.data('whatever'); // 게시글 번호
			var modal = $(this);
			
			modal.find('.modal-title').text(+recipient + '번 게시글');
			
			modal.find('#btn_ok').click(function() {
				$.ajax({
					type: "get",
					url: "admin_artist_comment_delete.jsp?no=" + recipient,
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
	})
	
	// 현 파라미터를 유지하면서 페이지 이동을 위해 url을 반환하는 함수
	function getUrl(url, inputs) {
		delete inputs["pageNumber"];
		delete inputs["search"];
		for(key in inputs) {
			url += key + "=" + inputs[key] + "&";
		}
		return url.substr(0, url.length - 1);
	}
</script>
</head>
<body>
	<!-- js에 현 주소값을 전달하기 위한 태그 -->
	<input type="hidden" id="url" value="<%= Commons.get_page(url, inputs) %>"> 
	<section class="container text-center">
		<h1 class="font-weight-bold text-left">댓글관리</h1>
		<form name="admin_artist_comment_search_form" id="admin_artist_comment_search_form" action="" method="get">
			<!-- 가수 선택 박스 -->
			<div class="d1 container text-right">
				<div class="box">
					<label>가수</label> <select class="custom-select" name="artist" id="artist">
						<% for(String str : artists) { %>
							<option value="<%= str %>" <% if(str.equals(artist)) { %> selected <% } %>><%= str %></option>
						<% } // parameter로 넘겨받은 아티스트의 경우 selected로 초기화된다 %>
					</select>
				</div>
			</div>
			<!-- 검색창과 신고수 정렬 방법 선택 박스 -->
			<div class="d2 container">
				<div class="row">
					<div class="col"></div>
					<div class="col-6 text-center">
						<div class="input-group">
							<input type="text" class="form-control" name="search" placeholder="검색..." value="<%= search %>">
							<div class="input-group-append">
								<button type="button" class="btn btn-primary" id="btn_search">검색</button>
							</div>
						</div>
					</div>
					<div class="col text-right">
						<div class="box">
							<div>
								<label>정렬방식</label>
							</div>
							<select class="custom-select" name="order" id="order">
								<option value="0" <% if(order == 0) { %> selected <% } %>>최신순</option>
								<option value="1" <% if(order == 1) { %> selected <% } %>>신고순</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</form>
		<table class="table">
			<%
				for(CommentVO vo : list) {
			%>
			<tr class="row">
				<td class="comment_content text-left col-md-7"><%= vo.getNo() + "&nbsp;&nbsp;" + vo.getArtist() + "&nbsp;&nbsp;" + vo.getId()+ ">" + vo.getContent() %></td>
				<td class="comment_content text-left col-md-2"><%= vo.getDate() %></td>
				<td class="comment_buttons col-md-3">
					<div class="input-group">
						<span class="s1">신고수 <%= vo.getReport() %></span>
						<span class="s1">추천수 <%= vo.getRecommend() %></span>
						<a type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal" data-whatever="<%= vo.getNo() %>">삭제</a>
					</div>
				</td>
			</tr>
			<% } %>
		</table>
		
		<ul class="pagination justify-content-center">
			<% if(pageInfo.isPrev()) { %> <!-- 현 페이지가 1페이지일 경우, 이전 페이지 비활성화 -->
			<li class="page-item"><a class="page-link" href="<%= Commons.get_page(url, inputs, pageNumber - 1) %>">&lt;</a></li>
			<% }else { %>
			<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
			<% } 
			int start = pageInfo.getStart();
			int end = pageInfo.getEnd();
			
			for(int i=start;i<=end;i++) {
			if(i == pageNumber) {
			%>
			<li class="page-item active"><a class="page-link" href="<%= Commons.get_page(url, inputs, i) %>"><%= i %></a></li>
			<% }else {%>
			<li class="page-item"><a class="page-link" href="<%= Commons.get_page(url, inputs, i) %>"><%= i %></a></li>
			<% } 
			} %>
			<% if (pageInfo.isNext()) { %> <!-- 현 페이지가 마지막 페이지일 경우 다음 페이지 비홯성화 -->
			<li class="page-item"><a class="page-link" href="<%= Commons.get_page(url, inputs, pageNumber + 1) %>">&gt;</a></li>
			<% }else { %>
			<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
			<% } %>
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