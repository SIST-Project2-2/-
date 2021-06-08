<%@page import="vo.MemberVO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDAO"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//

String id = request.getParameter("id");
String pw = request.getParameter("pw");

PrintWriter script = response.getWriter();
MemberDAO memberDAO = new MemberDAO();

MemberVO member = new MemberVO();
member.setId(id);
member.setPw(pw);

int result = memberDAO.login(member.getId(), member.getPw());
if (result == 1) {
	// 한줄로 주려면 세미콜론을 줘야함.
	session.setAttribute("id", member.getId());
	script.println("<script>alert('로그인 성공');location.href='../index.jsp';</script>");
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
