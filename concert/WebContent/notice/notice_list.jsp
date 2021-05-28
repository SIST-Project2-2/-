<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO" %>
<%@ page import="vo.NoticeVO" %>
<%@ page import="vo.PageVO" %>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.card {
		width: 250px; height: 420px;
	}
</style>
</head>
<body>
	<%
		int pageNumber = 1;
	
		// 페이지 번호를 넘겨받았을 경우 그 페이지를 불러오고, 페이지 번호가 없을 경우 1페이지를 불러온다.
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	
		NoticeDAO dao = new NoticeDAO();
		PrintWriter script = response.getWriter();
	%>

	<section class="container-md text-center" id="content_notice_list">
		<h1 class="font-weight-bold text-left">공지사항</h1>
		<!-- 공지사항 목록 검색 -->
		<form class="row justify-content-end" name="notice_list_search_form" id="notice_list_search_form">
			<div class="col-md-6 d-block">
				<div class="input-group input-group-sm">
					<div class="input-group-prepend">
						<button class="btn btn-outline-info dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							카테고리</button>
						<div class="dropdown-menu">
							<div class="form-check dropdown-item">
								<input class="form-check-input" type="checkbox" value="title" name="category" id="title" checked>
								<label class="form-check-label" for="title"> 제목 </label>
							</div>
							<div class="form-check dropdown-item">
								<input class="form-check-input" type="checkbox" value="content" name="category" id="content" checked>
								<label class="form-check-label" for="content"> 내용 </label>
							</div>
						</div>
					</div>
					<input type="text" class="form-control" placeholder="검색..." name="search" id="notice_list_search">
				</div>
			</div>
			<div class="row text-right">
				<div class="col-md-4">
					<small class="text-left text-dark">가수</small>
					<select class="form-control-sm">
						<option>장범준</option>
						<option>잔나비</option>
						<option>10cm</option>
						<option>현아</option>
						<option>아이유</option>
					</select>
				</div>
				<div class="col-md-4">
					<small class="text-left text-dark">날짜</small>
					<select class="form-control-sm">
						<option>21년05월24일</option>
						<option>21년05월25일</option>
						<option>21년05월26일</option>
					</select>
				</div>
			</div>
		</form>
		<!-- 공지사항 목록 -->
		<div class="container-md text-left">
			<!-- jsp 코드 -->
			<%
				ArrayList<NoticeVO> list = dao.getNoticeListForUser(pageNumber);
				
				if(list.size() == 0) { // 불러온 목록이 비어있을 때
			%>
			<p class="text-center text-dark">데이터가 없습니다.</p>
			<% 
				}
				
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
			%>
		</div>
		<!-- 페이지 이동 버튼 목록 -->
		<nav>
			
		  	<ul class="pagination justify-content-center">
		  		<% 
		  			PageVO pageInfo = dao.getPageInfo(pageNumber);
		  		%>
			    <% if(pageInfo.isPrev()) { %> <!-- 현 페이지가 1페이지일 경우, 이전 페이지 비활성화 -->
				<li class="page-item"><a class="page-link" href="?pageNumber=<%= pageNumber - 1 %>">Previous</a></li>
				<% }else { %>
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
				<% 
					} 
				
			    int start = pageInfo.getStart();
			    int end = pageInfo.getEnd();
			    System.out.println(start + " " + end);
			    
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