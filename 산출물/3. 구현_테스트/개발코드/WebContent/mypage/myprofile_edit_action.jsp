<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="concert.Commons"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
String id = (String) session.getAttribute("id");

MultipartRequest multi = Commons.getMultipartRequest(request);

MemberVO member = new MemberVO();

if (id != null) {
	member.setId(id);
	member.setNickname(multi.getParameter("nickname"));
	member.setFirst_name(multi.getParameter("given_name"));
	member.setLast_name(multi.getParameter("surname"));
	member.setAddress(multi.getParameter("address"));
	member.setBirth_date(multi.getParameter("birth_date"));
	member.setPhone(multi.getParameter("phone"));
	member.setImg(multi.getOriginalFileName("img"));
	member.setSimg(multi.getFilesystemName("img"));

	System.out.println(member.getImg());
	System.out.println(member.getSimg());
	System.out.println(member.getNickname());

	if (member.getNickname() != null) {
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.edit_profile(member);
		System.out.println(result);
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
