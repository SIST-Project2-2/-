<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO"%>


<%
String id = request.getParameter("id");
MemberDAO dao = new MemberDAO();
int result = dao.idCheck(id);
out.write(String.valueOf(result));
%>
    