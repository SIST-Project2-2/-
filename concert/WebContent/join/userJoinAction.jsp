<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="vo.MemberVO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="email.SHA256" %>

<%
//사용자 요청 정보 UTF-8로 출력
	request.setCharacterEncoding("UTF-8");


String id = null;
String pw = null;
String nickName = null;
String firstName= null;
String lastName= null;
String name= null;
String birth_date = null;
String sex =null;
String address = null;
String phone = null;
String email = null;


//회원가입 id정보 불러오기


if (request.getParameter("id") != null) {
	id = (String) request.getParameter("id");
}
//회원가입 password 정보 불러오기
if (request.getParameter("pw") != null) {
	pw = (String) request.getParameter("pw");
}
if (request.getParameter("nickName") != null) {
	nickName = (String) request.getParameter("nickName");
}


if (request.getParameter("firstName") != null && request.getParameter("lastName") !=null) {
	firstName = (String) request.getParameter("firstName");
	lastName = (String) request.getParameter("lastName");
	
	name = lastName + firstName;
	
}
if (request.getParameter("addr") != null) {
	address = (String) request.getParameter("addr")+(String) request.getParameter("daddr");
	
}

if (request.getParameter("hp1") != null && request.getParameter("hp2") != null && request.getParameter("hp3") !=null) {
	phone = (String)request.getParameter("hp1") + (String)request.getParameter("hp2") + (String)request.getParameter("hp3");
}

if (request.getParameter("birth_date") != null) {
	birth_date = (String) request.getParameter("birth_date");
}
if (request.getParameter("gender") != null) {
	sex = (String) request.getParameter("gender");
}
if (request.getParameter("email") != null) {
	email = (String) request.getParameter("email");
}




if (id == null || pw == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안 된 사항이 있습니다');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
	return;
}



MemberDAO memberDAO = new MemberDAO();
//dao 통해서 db에  데이터 넣기
int result = memberDAO.join(new MemberVO(id,pw,nickName,firstName,lastName,birth_date,sex,address,phone,email,SHA256.getSHA256(email),0));


if (result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('회원가입 성공');");
	script.println("location.href = 'emailSendAction.jsp?id="+id+"'");
	script.println("</script>");
	script.close();
	return;
}


else if(result==-1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미존재하는 아이디입니다');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
	return;
}



%>
