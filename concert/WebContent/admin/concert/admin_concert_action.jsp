<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.ConcertDAO, vo.ConcertVO"%>

<%
	request.setCharacterEncoding("UTF-8");

ConcertVO vo = new ConcertVO();

vo.setArtist(request.getParameter("artist"));
vo.setTitle(request.getParameter("title"));
vo.setContent(request.getParameter("content"));
vo.setCdate(request.getParameter("date"));
vo.setLocation(request.getParameter("location"));

ConcertDAO dao = new ConcertDAO();
int result = dao.insert_concert(vo);

if (result == 1) {
	response.sendRedirect("./admin_concert_list.jsp");
} else {
	//콘서트 등록 실패
}
%>
