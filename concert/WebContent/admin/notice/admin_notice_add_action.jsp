<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO, vo.NoticeVO"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> 

<%
	request.setCharacterEncoding("UTF-8");

String savePath = request.getServletContext().getRealPath("/images/notice_uploads");
int sizeLimit = 1024 * 1024 * 15;

MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

String title = multi.getParameter("title");
String content = multi.getParameter("content");
String tag = multi.getParameter("tag");
String img = multi.getOriginalFileName("img");
String simg = multi.getFilesystemName("img");

NoticeDAO dao = new NoticeDAO();
int result = dao.updateNoticeList(new NoticeVO(title, content, tag, img, simg));

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