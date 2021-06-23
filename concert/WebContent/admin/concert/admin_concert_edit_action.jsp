<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.ConcertDAO"%>
<%@ page import="vo.ConcertVO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
ConcertVO vo = new ConcertVO();
ConcertDAO dao = new ConcertDAO();

vo.setArtist(request.getParameter("artist"));
vo.setCdate(request.getParameter("date"));
vo.setLocation(request.getParameter("location"));
vo.setTitle(request.getParameter("title"));
vo.setContent(request.getParameter("content"));

//input hidden으로 받아옴 no는 변경하면 안돼서
String no = request.getParameter("no");

//no값 못넘겨받아서 30으로 고정시켜놓음... 수정해야함 

//java.sql.SQLIntegrityConstraintViolationException: ORA-02291: integrity constraint (SCOTT.FK_CONCERTS_ARTISTS) violated - parent key not found
//어떤 값으로 바꾸면 이 오류가 뜸 select에 관련된 것 같음
boolean result = dao.edit_concert(no, vo);

if (result) {
	response.sendRedirect("admin_concert_list.jsp");
}else{
	PrintWriter script = response.getWriter();
	out.println("<script>");
	out.println("alert('콘서트 데이터 수정 오류입니다. 다시 시도해주세요');");
	out.println("history.back()");
	out.println("</script>");
}
%>