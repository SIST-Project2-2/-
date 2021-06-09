<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO" %>
<%@ page import="vo.NoticeVO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	PrintWriter script = response.getWriter();
	NoticeDAO dao = new NoticeDAO();
	NoticeVO vo = null;
	int no = 0;
	
	// 공지사항 번호를 입력받지 않은 경우 에러페이지 이동
	if(request.getParameter("no") == null) {
		response.sendRedirect("../error.jsp");
	}
	
	no = Integer.parseInt(request.getParameter("no"));
	vo = dao.getNoticeInfoForUser(no);
	
	// 해당하는 공지사항이 존재하지 않은 경우 에러페이지 이동
	if(vo.getNo() == 0) {
		response.sendRedirect("../error.jsp");
	}
	
	dao.close();
%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<%
	request.setCharacterEncoding("UTF-8");
String no = request.getParameter("no");

NoticeDAO dao = new NoticeDAO();
NoticeVO vo = dao.getNoticeInfoForAdmin(no);

dao.getUpdateView(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리저 공지사항 상세정보</title>
<script src=""></script>
<!-- js 파일 경로 넣기! -->
</head>
<body>
	<section class="container-md text-center" id="content_notice_info">
		<h1 class="font-weight-bold text-left">공지사항 상세</h1>
		<!-- 공지사항 상세내용 -->
		<table class="table" id="notice_info_table">
			<!-- 제목 -->
			<thead>
				<tr>
					<th class="text-left">
						<div>
							<kbd><%= vo.getTag() %></kbd>
						</div>
						<h2 class="text-weight-bold"><%= vo.getTitle() %></h2>
						<small class="text-dark font-weight-bold"><%= vo.getDate() %></small>
						<small class="text-dark font-weight-bold"><%= "조회수: " + vo.getViews() %></small>
					</th>
				</tr>
			</thead>
			<!-- 내용 -->
			<tbody>
				<tr>
					<td colspan="4" class="text-left">
						<div class="text-center">
							<%=vo.getContent()%>
							<br>
						</div>
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</tbody>
		</table>
		<!-- 
		<div class="row">
			<div class="text-right">
				<button type="button" class="btn btn-primary" id="notice_info_back">목록으로</button>
			</div>
		</div>
		-->
	</section>
</body>
</html>