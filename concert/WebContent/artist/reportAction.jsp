<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.MemberDAO"%>
<%@ page import="dao.RecommendDAO"%>
<%@ page import="dao.CommentDAO"%>
<%@ page import="vo.RecommendVO"%>
<%@ page import="java.io.PrintWriter.*"%>

<%-- 
<%!
public static String getClientIP(HttpServletRequest request) {
	
String ip = request.getHeader("X-FORWARDED-FOR");
if(ip==null || ip.length()==0){
	ip = request.getHeader("Proxy-Client-IP");
}
if(ip==null || ip.length()==0){
	ip = request.getHeader("WL-Proxy-Client-IP");
}
if(ip==null || ip.length()==0){
	ip = request.getRemoteAddr();
}

return ip;
}
%>
 --%>

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

if(userId.equals(dao.getUserId(no))){
//내가 작성한 댓글일시
	out.println("alert('내가 작성한 댓글은 추천 할 수 없습니다 .');");
	response.sendRedirect("../error.jsp");
}else{
	//내가 작성한 댓글이 아닐 시
	int result = dao.report(no);
	response.sendRedirect("artist_list.jsp");
} 

%>
