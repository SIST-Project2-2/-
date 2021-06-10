<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
// 로그아웃 처리하는 페이지
Enumeration<String> attributes = session.getAttributeNames();

while (attributes.hasMoreElements()) {
	String attr = attributes.nextElement();
	session.removeAttribute(attr);
}

response.sendRedirect("http://localhost:9000/concert/index.jsp");
%>