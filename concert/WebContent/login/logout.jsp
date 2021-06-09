<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
// 로그아웃 처리하는 페이지
session.removeAttribute("id");

response.sendRedirect("http://localhost:9000/concert/index.jsp");
%>