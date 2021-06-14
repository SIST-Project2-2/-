<%@page import="com.google.gson.Gson"%>
<%@page import="vo.SeatVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.SeatDAO"%>
<%@page import="vo.ConcertVO"%>
<%@page import="dao.ConcertDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//
String concert_no = request.getParameter("concert_no");

if (concert_no != null) {
	ConcertDAO concertDAO = new ConcertDAO();
	ConcertVO concertVO = concertDAO.getConcertInfo(concert_no);

	SeatDAO seatDAO = new SeatDAO();
	ArrayList<SeatVO> seatList = seatDAO.getReservedSeatList(Integer.parseInt(concert_no));

	out.write(new Gson().toJson(seatList));
} else {
	out.write("null");
}
%>