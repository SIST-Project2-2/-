<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.MemberDAO"%>
<%@ page import="dao.RecommendDAO"%>
<%@ page import="dao.CommentDAO"%>
<%@ page import="vo.RecommendVO"%>
<%@ page import="java.io.PrintWriter.*"%>


<%



String userId = null;
if(session.getAttribute("id")!= null){
	userId = (String) session.getAttribute("id");
}

if(userId==null){
	out.println("<script>");
	out.println("alert('로그인을 해주세요');");
	out.println("location.href='../error.jsp'");
	out.println("</scirpt>");
	out.close();	
}



 int no = 0;
if(request.getParameter("no")!=null){
	no = Integer.parseInt(request.getParameter("no"));
} 

CommentDAO dao = new CommentDAO();

//내가 작성한 댓글일시
if(userId.equals(dao.getUserId(no))){
	int delete = dao.delete(no);
	response.sendRedirect("artist_list.jsp?userId=");
}else{
	//내가 작성한 댓글이 아닐 시
	out.println("alert('로그인을 해주세요');");
	response.sendRedirect("../error.jsp");
} 

%>
