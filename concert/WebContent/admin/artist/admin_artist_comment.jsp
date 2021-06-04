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
	if(!artist.equals("") && !search.equals("")) { // 아티스트별 검색
		list = dao.getCommentListSearch(pageNumber, order, artist, search);
		pageInfo = dao.getPageInfoSearch(pageNumber, artist, search);
	}else if(!artist.equals("")) { // 아티스트별
		list = dao.getCommentList(pageNumber, order, artist);
		pageInfo = dao.getPageInfo(pageNumber, artist);
	}else if(!search.equals("")) { // 검색
		list = dao.getCommentListSearch(pageNumber, order, search);
		pageInfo = dao.getPageInfoSearch(pageNumber, search);
	}else { // 기본
		list = dao.getCommentList(pageNumber, order);
		pageInfo = dao.getPageInfo(pageNumber);
	}
	
	System.out.println(list.size());
	
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
						<span class="input-group-btn">
							<button type="button" class="btn btn-danger">삭제</button>
						</span>
					</div>
				</td>
			</tr>
			<% } %>
		</table>
		
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
</body>
</html>