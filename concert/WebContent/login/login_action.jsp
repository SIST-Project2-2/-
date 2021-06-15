<%@page import="util.Cookies"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//

String id = request.getParameter("id");
String pw = request.getParameter("pw");
String id_store = request.getParameter("id_store");
String auto_login = request.getParameter("auto_login");

MemberDAO memberDAO = new MemberDAO();

MemberVO member = new MemberVO();
member.setId(id);
member.setPw(pw);

int result = memberDAO.login(member.getId(), member.getPw());
int authority = memberDAO.getAuthority(id);
if (result == 1) {
	// 로그인에 성공하면 세션에 로그인한 id를 추가함.
	session.setAttribute("id", member.getId());
	session.setAttribute("authority", String.valueOf(authority));

	Cookie[] cookies = request.getCookies(); // 연결된 클라이언트의 쿠키들을 모두 불러옴
	if (id_store != null) { // 아이디 저장을 체크 했으면 쿠키에 아이디 저장
		response.addCookie(Cookies.createCookie("storedId", id, 60 * 60 * 24 * 30, "/concert")); // 만든 쿠키를 브라우저에 전달함			
	} else { // 아이디 저장을 체크하지 않았으면 쿠키에 저장된 아이디 삭제
		response.addCookie(Cookies.createCookie("storedId", id, 0, "/concert")); // 만든 쿠키를 브라우저에 전달함			
	}

	if (auto_login != null) { // 자동로그인 설정했으면 적용
		response.addCookie(Cookies.createCookie("auto_login", pw, 60 * 60 * 24 * 30, "/concert")); // 만든 쿠키를 브라우저에 전달함			
	} else { // 자동 로그인을 해제했으면 해당 쿠키 삭제
		response.addCookie(Cookies.createCookie("auto_login", pw, 0, "/concert")); // 만든 쿠키를 브라우저에 전달함			
	}

	// 한줄로 주려면 세미콜론을 줘야함.
	out.println("<script>alert('로그인 성공');location.href='/concert/index.jsp';</script>");
} else {
	out.println("<script>alert('아이디 또는 비밀번호가 맞지 않습니다.'');history.back();</script>");
}
%>
