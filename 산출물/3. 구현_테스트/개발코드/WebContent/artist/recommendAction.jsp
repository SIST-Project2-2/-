<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.MemberDAO"%>
<%@ page import="dao.RecommendDAO"%>
<%@ page import="dao.CommentDAO"%>
<%@ page import="vo.RecommendVO"%>
<%@ page import="java.io.PrintWriter"%>




 <%!
 //사용자 ip값 구하기
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

// 추천 누른 no값 가져오기
 int no = 0;
if(request.getParameter("no")!=null){
	no = Integer.parseInt(request.getParameter("no"));
} 

//추천 누른 id값 가져오기
String id = null;
if(request.getParameter("id")!=null){
	id = request.getParameter("id");
}

CommentDAO dao = new CommentDAO();
RecommendDAO rdao = new RecommendDAO();

int result = rdao.recommend(no, id, getClientIP(request));

if(result==1){
int	countResult = dao.like(no);
	if(countResult==1){
	response.sendRedirect("artist_list.jsp");
	return;		
	}else{
		//db오류
		out.println("alert('잘못된 값이 입력 되었습니다 .');");
		response.sendRedirect("../error.jsp");
		return;
	}
}else{
	PrintWriter script = response.getWriter();
	out.println("<script>");
	out.println("alert('이미 추천한 댓글입니다.');");
	out.println("history.back()");
	out.println("</script>");
	return;
}

%>