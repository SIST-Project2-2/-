<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "dao.ReplyDAO,vo.ReplyVO"%>
    
    <%
    
    ReplyDAO dao = new ReplyDAO();
    ReplyVO vo = new ReplyVO();
  
  	String artist = request.getParameter("artistDivide")+("팬");
  	String id = request.getParameter("id");
  	String content = request.getParameter("content");

  	vo.setArtist(artist);
  	vo.setId(id);
  	vo.setContent(content);
  	
	int result = dao.saveReply(vo);
    
    if(result==1){
    	response.sendRedirect("artist_list.jsp");
    }
    
   
    %>
