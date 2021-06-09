<%@page import="java.util.ArrayList"%>
<%@page import="vo.SeatVO"%>
<%@page import="vo.OrderVO"%>
<%@page import="dao.SeatDAO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 좌석 선택 후 예매하기를 누르면 처리하는 페이지

int concert_no = Integer.parseInt(request.getParameter("concert_no"));
String number = request.getParameter("number");
String[] seats = request.getParameterValues("seat");
String id = (String) session.getAttribute("id");

if (Integer.parseInt(number) != seats.length) { // 예매할 좌석 수와 인원이 맞는지 확인
	response.sendRedirect("../error.jsp");
} else {
	OrderDAO orderDAO = new OrderDAO();
	int order_no = orderDAO.getNextOrderNo();

	// 예매 정보를 먼저 만들고 좌석 정보를 추가해야함.
	OrderVO orderVO = new OrderVO();
	orderVO.setId(id);
	orderVO.setConcert_no(concert_no);
	orderVO.setNo(order_no);

	// 주문 정보를 Order 테이블에 넣음
	int result_order = orderDAO.insertOrder(orderVO);

	if (result_order == 1) { // 데이터가 제대로 들어갔는지 확인
		ArrayList<SeatVO> seatList = new ArrayList<SeatVO>();
		for (String seat_no : seats) {
			SeatVO seatVO = new SeatVO();
			seatVO.setSeat_no(seat_no);
			seatVO.setConcert_no(concert_no);
			seatVO.setId(id);
			seatVO.setOrder_no(order_no);
			seatList.add(seatVO);
		}

		// SEAT 테이블에 예매된 좌석을 추가함
		SeatDAO seatDAO = new SeatDAO();
		int result_seat = seatDAO.reserveSeats(seatList);

		if (result_seat > 0) { // 성공적으로 예매하면 페이지 이동
			response.sendRedirect("http://localhost:9000/concert/concert/concert_payinfo.jsp?no=" + order_no);
		}
	}
}
%>