<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" errorPage="/error.jsp"%>
<%
	// 비밀번호 변경 페이지
String id = (String) session.getAttribute("id");

String old_pw = request.getParameter("old_pw");
String new_pw = request.getParameter("new_pw");

System.out.printf("id:%s, old_pw: %s, new_pw: %s\n", id, old_pw, new_pw);

MemberVO member = new MemberVO();
member.setId(id);
member.setPw(old_pw);

MemberDAO memberDAO = new MemberDAO();
int result = memberDAO.changePassword(member, new_pw);
out.print(result);
%>