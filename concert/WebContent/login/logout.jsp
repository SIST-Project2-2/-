<%@page import="util.Cookies"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
// 로그아웃 처리하는 페이지

// 세션 종료
session.invalidate();

// 자동 로그인 쿠키 삭제
response.addCookie(Cookies.createCookie("auto_login", null, 0));

// 메인화면으로 이동
response.sendRedirect("http://localhost:9000/concert/index.jsp");
%>