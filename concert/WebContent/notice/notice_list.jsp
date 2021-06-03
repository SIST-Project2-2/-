<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String[] options = {"전체", "장범준", "잔나비", "10cm", "현아", "IU"}; // 아티스트별 목록 보기 목록
	String url = request.getRequestURL().toString(); // 현 페이지 주소
	
	int pageNumber = 1;
	int category = 0;
	String artist = "";
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
	
	if(request.getParameter("artist") != null && !"전체".equals(request.getParameter("artist"))) {
		artist = request.getParameter("artist");
		inputs.put("artist", request.getParameter("artist").toString());
	}
	
	if(request.getParameter("search") != null) {
		search = request.getParameter("search");
		inputs.put("search", request.getParameter("search").toString());
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
	
	dao.close(); // 데이터를 모두 불러온 뒤 dao 객체 닫기
%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() {
		$("#artist").change(function() {
			location.href = "notice_list.jsp?artist=" + $(this).val();
		})
		
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
		
		$("#btn_search").click(function() {
			notice_list_search_form.submit();
		})
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
	<section class="container-md text-center" id="content_notice_list">
		<h1 class="font-weight-bold text-left">공지사항</h1>
		<!-- 공지사항 목록 검색 -->
		<form class="row justify-content-end" name="notice_list_search_form" id="notice_list_search_form" action="" method="get">
			<input type="hidden" name="category" id="category" value="<%= category %>">
			<div class="col-md-6 d-block">
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
			<div class="col-md-3">
				<small class="text-dark">가수</small>
				<select class="form-control-sm d-inline-block" name="artist" id="artist">
					<% // request로 요청받은 가수를 select한다.
						for(String option : options) {
							if(option.equals(artist)) {
					%>
								<option value="<%= option %>" selected><%= option %></option>
					<%  	}else { %>		
								<option value="<%= option %>"><%= option %></option>
					<%  }} %>
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
					<%
						String tag = list.get(i).getTag();
					%>
					<kbd><%= tag %></kbd>
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
		<form name="page" action="" method="get" id="page">
			
		  	<ul class="pagination justify-content-center">
			    <% if(pageInfo.isPrev()) { 
			    %> <!-- 현 페이지가 1페이지일 경우, 이전 페이지 비활성화 -->
				<li class="page-item"><a class="page-link" href="<%= Commons.get_page(url, inputs, pageNumber - 1) %>">Previous</a></li>
				<% }else { %>
				<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
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
				<li class="page-item"><a class="page-link" href="<%= Commons.get_page(url, inputs, pageNumber + 1) %>">Next</a></li>
				<% }else { %>
				<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				<% } %>
		  </ul>
		</form>
	</section>
</body>
</html>