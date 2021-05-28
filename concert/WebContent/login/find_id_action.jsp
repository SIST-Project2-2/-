<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDAO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="vo.MemberVO" scope="page" />
<jsp:setProperty property="name" name="member" />
<jsp:setProperty property="email" name="member" />
<jsp:setProperty property="nickname" name="member" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MemberDAO memberDAO = new MemberDAO();
	PrintWriter script = response.getWriter();
	String result = memberDAO.find_id(member.getName(), member.getNickname(), member.getEmail());
	if (result == null) {
		script.println("<script>");
		script.println("alert('입력한 정보가 틀립니다');");
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