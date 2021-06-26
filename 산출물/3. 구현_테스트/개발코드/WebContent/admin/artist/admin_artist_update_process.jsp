<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="dao.ArtistDAO, vo.ArtistVO, java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
	//파일이 저장될 서버의 경로. 되도록이면 getRealPath를 이용하자.
	String savePath = request.getServletContext().getRealPath("/images");
	//System.out.println(savePath);
	
	//파일 크기 15MB로 제한
	int sizeLimit = 1024 * 1024 * 15;
	
	//↓ request 객체,               ↓ 저장될 서버 경로,       ↓ 파일 최대 크기,    ↓ 인코딩 방식,       ↓ 같은 이름의 파일명 방지 처리
	//(HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
	//아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
	
	//파일명 확인
	//System.out.println("화면UI이름=" + multi.getOriginalFileName("img"));
	//System.out.println("폴더저장이름=" + multi.getFilesystemName("img"));
	
	//기존 파일 그대로 유지 ---> bfile:null
	//새로운 파일 선택 & 파일 수정 ---> bfile: 선택된 파일 명
	
	ArtistDAO dao = new ArtistDAO();
	ArtistVO vo = new ArtistVO();
	boolean result = false;
	vo.setName(multi.getParameter("name"));
	String content = multi.getParameter("content_text");
	content = content.replaceAll("\n", "<br>");
	vo.setContent(content);
	
	System.out.println(1);
	if (multi.getOriginalFileName("img") != null) {
	System.out.println(2);
		// 수정할 데이터 삽입
//		vo.setContent(multi.getParameter("content_text"));
		vo.setImg(multi.getOriginalFileName("img"));
		vo.setSimg(multi.getFilesystemName("img"));
		
		result = dao.getUpdateResult(vo);
	
		// 기존 파일을 upload 폴더에서 삭제하는 코드
	
		/*
			1. 수정될 데이터에 저장된 파일 명을 가져옴.
			2. 기존 파일 삭제
			3. 수정할 데이터  추가
		*/
		if (result) {
			System.out.println(savePath + "/" + multi.getOriginalFileName("simg_old"));
			File file = new File(savePath + "/" + multi.getFilesystemName("simg_old"));
			if (file.exists()) {
				file.delete();
			}
		}
	
	} else {
	System.out.println(3);
		// 기존 파일 유지
//		vo.setContent(multi.getParameter("content_text"));
		vo.setImg(multi.getOriginalFileName("img"));
		vo.setSimg(multi.getFilesystemName("img"));
		
		result = dao.getUpdateResultNofile(vo);
	}
	
	if (result) {
		response.sendRedirect("admin_artist_list.jsp");
	}else{
		out.println("<script>");
		out.println("alert('아티스트 정보를 정확히 입력해주세요');");
		out.println("history.back()");
		out.println("</script>");
	}
%>
