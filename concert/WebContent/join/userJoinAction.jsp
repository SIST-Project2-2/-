<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="vo.MemberVO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");


String id = null;
String pw = null;
String nickName = null;
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
	name = (String) request.getParameter("firstName")+(String) request.getParameter("lastName");
}
if (request.getParameter("birth_date") != null) {
	birth_date = (String) request.getParameter("birth_date");
}
if (request.getParameter("gender") != null) {
	sex = (String) request.getParameter("gender");
}
if (request.getParameter("addr") != null) {
	address = (String) request.getParameter("addr")+(String) request.getParameter("daddr");
}
if (request.getParameter("hp1") != null && request.getParameter("hp2") != null && request.getParameter("hp3") !=null) {
	phone = (String) request.getParameter("hp1") + (String) request.getParameter("hp2") + (String) request.getParameter("hp3");
}
if (request.getParameter("email") != null) {
	email = (String) request.getParameter("email");
}

/*
if (id == null || pw == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안 된 사항이 있습니다');");
	script.println("history.back()");
	script.println("</script>");
	script.close();
	return;
}*/

MemberDAO memberDAO = new MemberDAO();
//dao 통해서 db에  데이터 넣기
int result = memberDAO.join(id,pw,nickName,name,birth_date,sex,address,phone,email);

//MemberDAO set_profile 회원가입 성공하면  1반환
if (result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('회원가입 성공');");
	script.println("location.href = 'join_id.jsp';");
	script.println("</script>");
	script.close();
	return;
}
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