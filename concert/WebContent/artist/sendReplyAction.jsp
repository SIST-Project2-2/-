<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "dao.CommentDAO,vo.CommentVO"%>
    
    <%
    
    CommentDAO dao = new CommentDAO();
    CommentVO vo = new CommentVO();
  
  	String artist = request.getParameter("artistDivide");
  	String id = request.getParameter("id");
  	String content = request.getParameter("content");

  	vo.setArtist(artist);
  	vo.setId(id);
  	vo.setContent(content);

  	int result = dao.saveReply(vo);
    
    if(result==1){
    	response.sendRedirect("artist_list.jsp");
    }else{
    	System.out.println("오류");
    }
    
   
    %>
