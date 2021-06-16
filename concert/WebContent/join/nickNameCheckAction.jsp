<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="dao.MemberDAO"%>


<%
	String nickName = request.getParameter("nickName");
MemberDAO dao = new MemberDAO();
int result = dao.idCheck(nickName);
out.write(String.valueOf(result));
%>
