<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDAO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="vo.MemberVO" scope="page" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 신청</title>
</head>
<body>
	<%
		MemberDAO memberDAO = new MemberDAO();
	member.setId("test");
	int result = memberDAO.request_withdrawal(member);
	PrintWriter script = response.getWriter();
	if (result == 1) {
		// 한줄로 주려면 세미콜론을 줘야함.
		script.println("<script>alert('회원탈퇴 요청 성공');location.href='../index.jsp';</script>");
	} else {
		script.println("<script>alert('회원탈퇴 요청 실패');location.href='javascript:history.back()';</script>");
	}
	%>
</body>
</html>