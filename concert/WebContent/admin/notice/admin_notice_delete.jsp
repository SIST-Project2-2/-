<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%
	PrintWriter script = response.getWriter();
	NoticeDAO dao = new NoticeDAO();
	int no = 0;

	// 잘못된 접근 감지 / if문 안에 관리자 계정으로 로그인되어 있는지 확인하는 코드 넣기
	if(request.getParameter("no") == null) {
		out.println("false");
		return;
	}
	
	no = Integer.parseInt(request.getParameter("no")); // 삭제할 게시글 번호
	
	// 이미지가 존재할 경우 삭제
	String simg = dao.getSimg(no);
	if(!"".equals(simg)) {
		String path = request.getRealPath("upload");
		File img = new File(path + "/" + simg);
		
		if(img.exists()) {
			img.delete();
		}
	}
	
	// 성공하면 true 리턴, 실패하면 false 리턴
	out.println(dao.deleteNotice(no));
	dao.close();
	return;
%>