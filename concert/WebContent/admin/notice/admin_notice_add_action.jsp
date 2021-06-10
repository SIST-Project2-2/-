<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO, vo.NoticeVO"%>
<%@ page import="java.io.PrintWriter"%>


<%
	request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title");
String content = request.getParameter("content");
String tag = request.getParameter("tag");

System.out.println(title);
System.out.println(content);
System.out.println(tag);

NoticeDAO dao = new NoticeDAO();
int result = dao.updateNoticeList(new NoticeVO(title, content, tag));

if (result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('공지사항 등록이 완료  되었습니다..');");
	script.println("location.href = 'admin_notice_list.jsp'");
	script.println("</script>");
	script.close();
	return;
}
%>