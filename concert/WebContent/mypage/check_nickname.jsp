<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
MemberDAO mdao = new MemberDAO();
String id = request.getParameter("id");

// 중복 체크할 아이디 받기
MemberVO member = new MemberVO();
member.setId(id);

int result = mdao.check_nickname(member);
%>
<%=result%>