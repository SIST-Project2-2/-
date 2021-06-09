<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
MemberDAO memberDAO = new MemberDAO();
String id = (String) session.getAttribute("id");
int result = memberDAO.requestWithdrawal(id);
if (result == 1) {
	// 한줄로 주려면 세미콜론을 줘야함.
	out.write("<script>alert('회원탈퇴 요청 성공');location.href='../login/logout.jsp';</script>");
} else {
	out.write("<script>alert('회원탈퇴 요청 실패');location.href='javascript:history.back()';</script>");
}
%>
