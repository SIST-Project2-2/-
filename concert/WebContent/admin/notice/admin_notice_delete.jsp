<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.NoticeDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	PrintWriter script = response.getWriter();

	// 관리자 계정으로 로그인되어 있는지 확인하는 코드 넣기~	

	// 잘못된 접근 감지
	if(request.getParameter("no") == null) {
		script.write("<script>");
		script.write("location.href();"); // 오류 페이지로 이동
		script.write("</script>");
	}

	NoticeDAO dao = new NoticeDAO();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>