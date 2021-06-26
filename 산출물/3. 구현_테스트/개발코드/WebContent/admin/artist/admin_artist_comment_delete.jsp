<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.CommentDAO" %>
<%@ page import="dao.MemberDAO" %>
<%@ page import="concert.Commons" %>
<%@ page import="java.io.PrintWriter" %>
<%
	PrintWriter script = response.getWriter();

	String id = (String)session.getAttribute("id");
	MemberDAO mdao = new MemberDAO();
	
	if(mdao.getAuthority(id) != 1) { // 관리자 권한이 없을 경우 에러 페이지 이동
		script.println(Commons.getErrorRedirect());
		return;
	}
	mdao.close();

	CommentDAO dao = new CommentDAO();
	int no = 0;
	
	// 삭제할 댓글 번호가 입력되지 않은 경우 에러 페이지 이동
	if(request.getParameter("no") == null) {
		out.println("false");
		return;
	}
	
	no = Integer.parseInt(request.getParameter("no")); // 삭제할 게시글 번호
	
	// 성공하면 true 리턴, 실패하면 false 리턴
	out.println(dao.deleteComment(no));
	dao.close();
	return;
%>