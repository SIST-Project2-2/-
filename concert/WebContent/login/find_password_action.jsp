<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDAO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="vo.MemberVO" scope="page" />
<jsp:setProperty property="id" name="member" />
<jsp:setProperty property="name" name="member" />
<jsp:setProperty property="birth_date" name="member" />
<jsp:setProperty property="phone" name="member" />
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
	String result = memberDAO.find_password(member.getId(), member.getName(), member.getBirth_date(), member.getPhone());
	PrintWriter script = response.getWriter();
	if (result == null) {
		script.println("<script>");
		script.println("alert('입력한 정보가 틀립니다');");
		script.println("history.back();");
		script.println("</script>");
	} else {
		script.println("<script>");
		script.println("alert('비밀번호:" + result + "');");
		script.println("history.back();");
		script.println("</script>");
	}
	%>
</body>
</html>