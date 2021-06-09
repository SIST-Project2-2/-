<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO" %>
<%@ page import="vo.NoticeVO" %>
<%@ page import="java.io.PrintWriter" %>

<%

request.setCharacterEncoding("UTF-8");
String no = request.getParameter("no");

NoticeDAO dao = new NoticeDAO();
NoticeVO vo = new NoticeVO();

vo.setTag(request.getParameter("tag"));
vo.setTitle(request.getParameter("title"));
vo.setContent(request.getParameter("content"));


int result = dao.getUpdateNotice(no,vo);

if (result==1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('공지사항 수정 완료');");
	script.println("location.href = 'admin_notice_list.jsp'");
	script.println("</script>");
	script.close();
	return;
	
}else if(result==0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('공지사항 수정 실패');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
	return;
}

%>
