<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
String id = (String) session.getAttribute("id");

MemberDAO memberDAO = new MemberDAO();
int result = memberDAO.cancelWithdrawal(id);

if (result == 1) {
	out.write("<script>alert('회원 탈퇴 취소 성공');location.href='myprofile_info.jsp';</script>");
}
%>