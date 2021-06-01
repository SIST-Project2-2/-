<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO" %>
<%@ page import="vo.NoticeVO" %>
<%@ page import="vo.PageVO" %>
<%@ page import="concert.Commons" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="notice" class="vo.NoticeVO" scope="page" />
<jsp:setProperty name="notice" property="no" />
<jsp:setProperty name="notice" property="title" />
<jsp:setProperty name="notice" property="content" />
<jsp:setProperty name="notice" property="date" />
<jsp:setProperty name="notice" property="views" />
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#artist").change(function() {
			
		});
		
	});
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<style>
	.card {
		width: 250px; height: 420px;
	}
</style>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		NoticeDAO dao = new NoticeDAO();
		ArrayList<NoticeVO> list = null;
		PageVO pageInfo = null;
		
		int pageNumber = 1;
		int category = 0;
		String artist = "";
		String search = "";
		
		// 요청을 넘겨받아 변수에 저장한다.
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		if(request.getParameter("category") != null) {
			category = Integer.parseInt(request.getParameter("category"));
		}
		
		if(request.getParameter("artist") != null) {
			artist = request.getParameter("artist");
		}
		
		if(request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		
		// 목록 불러오기
		if(!artist.equals("") && !search.equals("")) {
			list = dao.getNoticeListForUser(pageNumber, category, artist, search);
			pageInfo = dao.getPageInfo(pageNumber, category, artist, search);
		}else if(!artist.equals("")) { // 아티스트별
			list = dao.getNoticeListForUser(pageNumber, artist);
			pageInfo = dao.getPageInfo(pageNumber, artist);
		}else if(!search.equals("")) { // 검색
			list = dao.getNoticeListForUser(pageNumber, category, search);
			pageInfo = dao.getPageInfo(pageNumber, category, search);
		}else { // 기본
			list = dao.getNoticeListForUser(pageNumber);
			pageInfo = dao.getPageInfo(pageNumber);
		}
	%>
	<section class="container-md text-center" id="content_notice_list">
		<h1 class="font-weight-bold text-left">공지사항</h1>
		<!-- 공지사항 목록 검색 -->
		<form class="row justify-content-end" name="notice_list_search_form" id="notice_list_search_form">
			<div class="col-md-6 d-block">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
						<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
    						전체
  						</button>
						<div class="dropdown-menu">
							<label class="dropdown-item">전체</label>
							<label class="dropdown-item">제목</label>
							<label class="dropdown-item">내용</label>
						</div>
					</div>
					<input type="text" class="form-control" placeholder="검색..." name="search" id="notice_list_search">
					<div class="input-group-append">
						<button class="btn btn-light" type="button" id="btn_search">검색</button>
					</div>
				</div>
			</div>
			<div class="col-md-3">
					<small class="text-dark">가수</small>
					<select class="form-control-sm d-inline-block" id="artist">
						<option value="all">전체</option>
						<option value="장범준">장범준</option>
						<option value="잔나비">잔나비</option>
						<option value="10cm">10cm</option>
						<option value="현아">현아</option>
						<option value="아이유">아이유</option>
					</select>
				</div>
		</form>
		<!-- 공지사항 목록 -->
		<div class="container-md text-left">
			<!-- jsp 코드 -->
			<% if(list.size() == 0) { // 불러온 목록이 비어있을 때 %>
			<p class="text-center text-dark">데이터가 없습니다.</p>
			<% 
				}else {
					for(int i=0;i<list.size();i++) {
			%>
			<a href="notice_info.jsp?no=<%= list.get(i).getNo() %>"><div class="card d-inline-block">
				<img class="card-img-top" src="../images/장범준.jpg">
				<div class="card-body font-weight-bold">
					<kbd>#일정1</kbd>
					<kbd>#일정2</kbd>
					<kbd>#일정3</kbd>
					<h4 class="card-title text-left text-black"><%= list.get(i).getTitle() %></h4>
					<p class="card-text text-left text-dark"><%= list.get(i).getContent() %></p>
					<p class="card-text text-left text-dark"><%= list.get(i).getDate() %></p>
				</div>
			</div></a>
			<%
					}
				}
			%>
		</div>
		<!-- 페이지 이동 버튼 목록 -->
		<nav>
			
		  	<ul class="pagination justify-content-center">
		  		<% 
		  			
		  		%>
			    <% if(pageInfo.isPrev()) { %> <!-- 현 페이지가 1페이지일 경우, 이전 페이지 비활성화 -->
				<li class="page-item"><a class="page-link" href="?pageNumber=<%= pageNumber - 1 %>">Previous</a></li>
				<% }else { %>
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
				<% 
					} 
			    int start = pageInfo.getStart();
			    int end = pageInfo.getEnd();
			    
			    for(int i=start;i<=end;i++) {
			    	
			    	if(i == pageNumber) {
				%>
				<li class="page-item active"><a class="page-link" href="?pageNumber=<%= i %>"><%= i %></a></li>
				<%	}else {%>
			    <li class="page-item"><a class="page-link" href="?pageNumber=<%= i %>"><%= i %></a></li>
				<%	} 
				} %>
			    <% if (pageInfo.isNext()) { %> <!-- 현 페이지가 마지막 페이지일 경우 다음 페이지 비홯성화 -->
				<li class="page-item"><a class="page-link" href="?pageNumber=<%= pageNumber + 1 %>">Next</a></li>
				<% }else { %>
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				<% } %>
		  </ul>
		</nav>
	</section>
</body>
</html>