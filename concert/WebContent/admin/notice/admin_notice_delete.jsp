<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO" %>
<%@ page import="dao.MemberDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	MemberDAO mDao = new MemberDAO();
	
	//로그인한 유저가 관리자나 테스터가 아닌 경우 에러 페이지 이동
	if(mDao.getAuthority((String)session.getAttribute("id")) != 1 && mDao.getAuthority((String)session.getAttribute("id")) != 2) {
		response.sendRedirect("../../error.jsp");
	}
	mDao.close();

	PrintWriter script = response.getWriter();
	NoticeDAO dao = new NoticeDAO();
	int no = 0;

	// 잘못된 접근 감지 / if문 안에 관리자 계정으로 로그인되어 있는지 확인하는 코드 넣기
	if(request.getParameter("no") == null) {
		out.println("false");
		return;
	}
	
	no = Integer.parseInt(request.getParameter("no")); // 삭제할 게시글 번호
	
	// 성공하면 true 리턴, 실패하면 false 리턴
	out.println(dao.deleteNotice(no));
	dao.close();
	return;
%>