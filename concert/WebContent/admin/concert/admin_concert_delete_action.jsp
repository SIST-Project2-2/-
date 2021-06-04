<%@page import="vo.ConcertVO"%>
<%@page import="dao.ConcertDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");

	ConcertDAO dao = new ConcertDAO();
	ConcertVO concert = new ConcertVO();
	concert.setNo(Integer.parseInt(no));
	
 	int result = dao.deleteConcert(concert);
	
	if (result == 1) {%>
		<script type="text/javascript">
			alert("삭제성공" );
			location.href="admin_concert_list.jsp";
		</script><%
	} else {%>
		<script type="text/javascript">
			alert("삭제 실패"+"에러코드: "+<%=result%> );
			history.back();
		</script><%
	}
%>