<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ page import="dao.ConcertDAO, vo.ConcertVO"%>

<%
	//
ConcertVO vo = new ConcertVO();
vo.setArtist(request.getParameter("artist"));
vo.setTitle(request.getParameter("title"));
vo.setContent(request.getParameter("content"));
vo.setCdate(request.getParameter("date"));
vo.setLocation(request.getParameter("location"));
vo.setPrice(Integer.parseInt(request.getParameter("price")));

ConcertDAO concertDAO = new ConcertDAO();
int result = concertDAO.insert_concert(vo);

if (result == 1) {
	response.sendRedirect("./admin_concert_list.jsp");
} else {
	//콘서트 등록 실패
}
%>
