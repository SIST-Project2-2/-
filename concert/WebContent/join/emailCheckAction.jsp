<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="email.SHA256"%>


<%
	//사용자 요청 정보 UTF-8로 출력
request.setCharacterEncoding("UTF-8");

String code = null;
String id = null;
MemberDAO memberDAO = new MemberDAO();



/* if (session.getAttribute("code") != null) {
	
} */

/* 
if (session.getAttribute("id") != null) {
} */
code = (String) request.getParameter("code");
	id = (String) request.getParameter("id");
if (id == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 해주세요');");
	script.println("location.href='../login.jsp'");
	script.println("</script>");
	script.close();
	return;
}



//사용자 아이디에 따른 이메일 정보 가져오기
String userEmail = memberDAO.memberEmail(id);
//사용자 정보에 저장된 email Hash값과 emailSendAction에서 보내는 Hash값이 같을 경우 이메일 인증 진행
boolean check = new SHA256().getSHA256(userEmail).equals(code) ? true : false;

if (check == true) {
	//이메일 인증이 완료 되었을 경우 emailcheck값 1로 반환
	memberDAO.updateEmailCheck(id);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이메일 인증 성공');");
	script.println("location.href = '../index.jsp'");
	script.println("</script>");
	script.close();
	return;
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이메일 인증 실패');");
	script.println("location.href = '../index.jsp'");
	script.println("</script>");
	script.close();
	return;

}

 %>