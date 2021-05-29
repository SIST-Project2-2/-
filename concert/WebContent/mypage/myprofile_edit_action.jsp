<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDAO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="vo.MemberVO" scope="page" />
<jsp:setProperty property="id" name="member" />
<jsp:setProperty property="nickname" name="member" />
<jsp:setProperty property="name" name="member" />
<jsp:setProperty property="address" name="member" />
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
		PrintWriter script = response.getWriter();
	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.edit_profile(member);
	if (result == 1) {
		script.println("<script>alert('프로필 수정 성공');location.href='myprofile_info.jsp';</script>");
	} else {
		script.println("<script>alert('프로필 수정 실패');location.href='javascript:history.back()';</script>");
	}
	%>

</body>
</html>