<%@page import="util.Cookies"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String id_store = request.getParameter("id_store");
String auto_login = request.getParameter("auto_login");

MemberDAO memberDAO = new MemberDAO();
int result = memberDAO.login(id, pw);

int authority = memberDAO.getAuthority(id);
if (result == 1) {
	// 로그인에 성공하면 세션에 로그인한 id를 추가함.
	session.setAttribute("id", id);
	session.setAttribute("authority", String.valueOf(authority));

	Cookie[] cookies = request.getCookies(); // 연결된 클라이언트의 쿠키들을 모두 불러옴
	if ("on".equals(id_store)) { // 아이디 저장을 체크 했으면 쿠키에 아이디 저장
		response.addCookie(Cookies.createCookie("storedId", id, 60 * 60 * 24 * 30, "/concert")); // 만든 쿠키를 브라우저에 전달함			
	} else { // 아이디 저장을 체크하지 않았으면 쿠키에 저장된 아이디 삭제
		response.addCookie(Cookies.createCookie("storedId", id, 0, "/concert")); // 만든 쿠키를 브라우저에 전달함			
	}

	if ("on".equals(auto_login)) { // 자동로그인 설정했으면 적용
		response.addCookie(Cookies.createCookie("auto_login", pw, 60 * 60 * 24 * 30, "/concert")); // 만든 쿠키를 브라우저에 전달함			
	} else { // 자동 로그인을 해제했으면 해당 쿠키 삭제
		response.addCookie(Cookies.createCookie("auto_login", pw, 0, "/concert")); // 만든 쿠키를 브라우저에 전달함			
	}
} else {
	result = 0;
}
out.write(String.valueOf(result));
%>