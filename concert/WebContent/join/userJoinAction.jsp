<%@page import="concert.Commons"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="vo.MemberVO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="email.SHA256"%>

<%
	//
MultipartRequest multi = Commons.getMultipartRequest(request);

MemberVO member = new MemberVO();
member.setId(multi.getParameter("id"));
member.setPw(multi.getParameter("pw"));
member.setNickname(multi.getParameter("nickName"));
member.setFirst_name(multi.getParameter("firstName"));
member.setLast_name(multi.getParameter("lastName"));
member.setAddress(multi.getParameter("addr"));
member.setPhone(multi.getParameter("hp1") + "-" + multi.getParameter("hp2") + "-" + multi.getParameter("hp3"));
member.setBirth_date(multi.getParameter("birth_date"));
member.setSex(multi.getParameter("gender"));
member.setEmail(multi.getParameter("email"));
member.setEmailHash(SHA256.getSHA256(member.getEmail()));
member.setImg(multi.getOriginalFileName("img"));
member.setSimg(multi.getFilesystemName("img"));

MemberDAO memberDAO = new MemberDAO();
//dao 통해서 db에  데이터 넣기
int result = memberDAO.join(member);
if (result == 1) {
	out.println("<script>");
	out.println("alert('회원가입 성공');");
	out.println("location.href = 'emailSendAction.jsp?id=" + member.getId() + "'");
	out.println("</script>");
} else {
	PrintWriter script = response.getWriter();
	out.println("<script>");
	out.println("alert('이미 존재하는 아이디입니다');");
	out.println("history.back()");
	out.println("</script>");
}
%>
