<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO" %>
<%@ page import="vo.NoticeVO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="concert.Commons" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%

request.setCharacterEncoding("UTF-8");

MultipartRequest multi = Commons.getMultipartRequest(request);

NoticeDAO dao = new NoticeDAO();

String no = multi.getParameter("no");
String tag = multi.getParameter("tag");
String title = multi.getParameter("title");
String content = multi.getParameter("content");
String img = multi.getOriginalFileName("img");
String simg = multi.getFilesystemName("img");

NoticeVO vo = new NoticeVO(title, content, tag);

// 추가한 이미지가 있을 경우
if(img != null) {
	vo.setImg(img);
	vo.setSimg(simg);
	
	// 기존 이미지가 있는 경우, 기존의 이미지는 삭제한다.
	String dSimg = dao.getSimg(Integer.parseInt(no));
	if(dSimg != null) {
		String path = request.getRealPath("upload");
		Commons.deleteFile(path, dSimg);
	}
}

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
