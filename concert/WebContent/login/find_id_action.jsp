<%@page import="vo.MemberVO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDAO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MemberVO member = new MemberVO();
	member.setFirst_name(request.getParameter("first_name"));
	member.setLast_name(request.getParameter("last_name"));
	member.setEmail(request.getParameter("email"));
	
	MemberDAO memberDAO = new MemberDAO();
	PrintWriter script = response.getWriter();
	String result = memberDAO.find_id(member);
	if (result == null) {
		script.println("<script>");
		script.println("alert('입력한 정보가 틀립니다.');");
		script.println("history.back();");
		script.println("</script>");
	} else {
		script.println("<script>");
		script.println("alert('아이디:" + result + "');");
		script.println("history.back();");
		script.println("</script>");
	}
	%>
</body>
</html>