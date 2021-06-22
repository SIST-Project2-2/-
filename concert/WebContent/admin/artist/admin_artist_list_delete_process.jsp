<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ArtistDAO, vo.ArtistVO, java.util.*"%>
<%
	//
String name = request.getParameter("name");

ArtistDAO dao = new ArtistDAO();
boolean result = dao.getDeleteResult(name);

if (result) {
	response.sendRedirect("admin_artist_list.jsp");
} else {
	response.sendRedirect("/concert/error.jsp");
}
%>