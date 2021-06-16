<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="member" class="vo.MemberVO"></jsp:useBean>
<jsp:setProperty property="*" name="member" />
<%
	//
MemberDAO memberDAO = new MemberDAO();
String result = memberDAO.resetPassword(member);
out.print(result);
%>
