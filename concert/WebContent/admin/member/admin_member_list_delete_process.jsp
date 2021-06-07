<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO, vo.MemberVO, java.util.*" %>
<%
	String id = request.getParameter("id");

	MemberDAO dao = new MemberDAO();
	boolean result = dao.getDeleteResult(id);
	
	if(result){
		response.sendRedirect("admin_member_list.jsp");
	}
%>
