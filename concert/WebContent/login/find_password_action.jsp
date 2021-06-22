<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="member" class="vo.MemberVO"></jsp:useBean>
<jsp:setProperty property="*" name="member" />
<%
	// 비밀번호를 되돌려주는 메소드
MemberDAO memberDAO = new MemberDAO();
String result = memberDAO.find_password(member);
//out.write(result);
%>
