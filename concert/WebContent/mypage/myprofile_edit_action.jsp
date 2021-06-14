<%@page import="concert.Commons"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="vo.MemberVO" />
<jsp:setProperty property="*" name="member" />
<%
	//
String id = (String) session.getAttribute("id");

if (id != null) {
	member.setId(id);

	if (member.getNickname() != null) {

		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.edit_profile(member);
		if (result == 1) {
			out.write("<script>alert('프로필 수정 성공');location.href='myprofile_info.jsp';</script>");
		} else {
			out.write("<script>alert('프로필 수정 실패');location.href='javascript:history.back()';</script>");
		}
	} else {
		out.write("<script>alert('잘못된 접근입니다.');location.href='/concert/index.jsp';</script>");
	}
} else {
	out.write(Commons.getNeedLoginMsg());
}
%>
