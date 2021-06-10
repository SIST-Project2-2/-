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
String id_store = request.getParameter("id_store");

// out.write는 버퍼에 담아서 한번에 보내지만 PrintWriter는 print할 때마다 보냄(?) -> 확인 필요
PrintWriter script = response.getWriter();
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
		boolean cookieIsCreated = false;
		for (Cookie c : cookies) { // 쿠키들을 조회해서 storedId 쿠키가 있으면 값 변경
			if (c.getName().equals("storedId")) {
				c.setValue(id);
				cookieIsCreated = true;
			}
		}
		if(!cookieIsCreated){ // 쿠키가 없으면 쿠키 생성
			Cookie cookie = new Cookie("storedId", id); // 로그인 성공하면 쿠키 생성
			cookie.setMaxAge(60 * 60 * 24 * 30); // 로그인 아이디를 저장하는 쿠키는 30일동안 유지
			response.addCookie(cookie); // 만든 쿠키를 브라우저에 전달함			
		}
	} else { // 아이디 저장을 체크하지 않았으면 쿠키에 저장된 아이디 삭제
		for (Cookie c : cookies) {
			if (c.getName().equals("storedId")) {
				c.setMaxAge(0);
				response.addCookie(c);
			}
		}
	}


	// 한줄로 주려면 세미콜론을 줘야함.
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
