<%@page import="dao.SeatPriceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ConcertDAO, vo.ConcertVO"%>

<%
	//

int price_a = Integer.parseInt(request.getParameter("price_a"));
int price_b = Integer.parseInt(request.getParameter("price_b"));
int price_c = Integer.parseInt(request.getParameter("price_c"));
int price_d = Integer.parseInt(request.getParameter("price_d"));

ConcertVO vo = new ConcertVO();
vo.setArtist(request.getParameter("artist"));
vo.setTitle(request.getParameter("title"));
vo.setContent(request.getParameter("content"));
vo.setCdate(request.getParameter("date"));
vo.setLocation(request.getParameter("location"));

ConcertDAO concertDAO = new ConcertDAO();
int result = concertDAO.insert_concert(vo, price_a, price_b, price_c, price_d);

if (result == 1) {
	response.sendRedirect("./admin_concert_list.jsp");
} else {
	//콘서트 등록 실패
}
%>
