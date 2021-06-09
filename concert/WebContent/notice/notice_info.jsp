<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO, vo.NoticeVO"%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<%
	int no = Integer.parseInt(request.getParameter("no"));
NoticeDAO dao = new NoticeDAO();
NoticeVO vo = dao.getNoticeInfoForAdmin(no);
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
							<kbd><%=vo.getTag()%></kbd>
						</div>
						<h2 class="text-weight-bold"><%=vo.getTitle()%></h2> <small><%=vo.getDate()%></small>
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