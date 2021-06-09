<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
MemberVO member = new MemberVO();
member.setId(request.getParameter("id"));
member.setNickname(request.getParameter("nickname"));
member.setFirst_name(request.getParameter("name"));
member.setLast_name(request.getParameter("surname"));
member.setAddress(request.getParameter("address"));
member.setBirth_date(request.getParameter("birth_date"));
member.setPhone(request.getParameter("phone"));

MemberDAO memberDAO = new MemberDAO();
int result = memberDAO.edit_profile(member);
if (result == 1) {
	out.write("<script>alert('프로필 수정 성공');location.href='myprofile_info.jsp';</script>");
} else {
	out.write("<script>alert('프로필 수정 실패');location.href='javascript:history.back()';</script>");
}
%>
