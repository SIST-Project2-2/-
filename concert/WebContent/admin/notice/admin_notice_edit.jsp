<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO" %>
<%@ page import="vo.NoticeVO" %>

<%

String no = request.getParameter("no");


NoticeDAO dao = new NoticeDAO();
NoticeVO vo = dao.getNoticeInfoForAdmin(no);

%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지 수정</title>
</head>
<body>
	<div class="container pt-3">
		<form name="admin_notice_edit" method="post" action="admin_notice_edit_action.jsp">
		<input type="hidden" name="no" value="<%= no %>">
			<div class="clearfix mb-3">
				<h3 class="d-inline-block float-left ">공지사항 수정</h3>
				<button class="btn btn-light float-right">임시저장</button>
				<button class="btn btn-light float-right" type="submit">등록하기</button>
			</div>
			
			<%--컨텐츠 영역--%>
			<div class="h-100 ">
			<input type="text" class="w-50" value=<%=vo.getTag() %> name="tag" id="tag">
				<input type="text" class="w-100" value=<%=vo.getTitle() %> name="title" id="title">
				<div class="h-100">
					<div class="btn-group pt-3">
						<button class="btn btn-secondary btn btn-light float-righ">Text</button>
						<button class="btn btn-secondary btn btn-light float-righ">이미지 삽입</button>
					</div>
					<hr>
					<textarea class="w-100" style="height: 500px;" name="content" id="content"> <%=vo.getContent() %></textarea>
				</div>
			</div>

		</form>
	</div>

</body>
</html>