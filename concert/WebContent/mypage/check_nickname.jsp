<%@page import="concert.Commons"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
if (session.getAttribute("id") != null) {
	MemberDAO mdao = new MemberDAO();
	String nickname = request.getParameter("nickname");

	// 중복 체크할 아이디 받기
	MemberVO member = new MemberVO();
	member.setNickname(nickname);

	int result = mdao.check_nickname(member);
	out.write(String.valueOf(result));
} else {
	out.write(Commons.getNeedLoginMsg());
}
%>