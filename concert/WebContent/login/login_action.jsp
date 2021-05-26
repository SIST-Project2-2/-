<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDAO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="vo.MemberVO" scope="page" />
<jsp:setProperty property="id" name="member" />
<jsp:setProperty property="pw" name="member" />
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
	int result = memberDAO.login(member.getId(), member.getPw());
	PrintWriter script = response.getWriter();
	if (result == 1) {
		// 한줄로 주려면 세미콜론을 줘야함.
		script.println("<script>alert('로그인 성공');location.href='main.jsp';</script>");
	} else if (result == 0) {
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다')");
		script.println("history.back()");
		script.println("</script>");
	} else if (result == -1) {
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다')");
		script.println("history.back()");
		script.println("</script>");
	} else if (result == -2) {
		script.println("<script>");
		script.println("alert('데이터베이스 오류입니다')");
		script.println("history.back()");
		script.println("</script>");
	}
	%>
</body>
</html>