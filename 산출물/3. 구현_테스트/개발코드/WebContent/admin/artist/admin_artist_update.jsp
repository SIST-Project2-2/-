<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ArtistDAO, vo.ArtistVO, java.util.*"%>
<%
	//
request.setCharacterEncoding("utf-8");
ArtistDAO dao = new ArtistDAO();
String name = request.getParameter("name");
ArtistVO vo = dao.getContent(name);
%>
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아티스트 수정</title>
<script src="../../js/jquery.cookies.js"></script>
<script>
$(document).ready(function() {
	// 임시저장 버튼 클릭
	$("#btn_set_temp").click(function() { // 30일간 저장되는 쿠키 생성
		$.cookie("admin_artist_update_content_text_temp", $("#content_text").val(), { expires: 30 });
		
		alert("임시 저장이 완료되었습니다.");
	});

	// 임시저장 불러오기 버튼 클릭
	$("#btn_get_temp").click(function() { // 쿠키에 저장된 임시저장 데이터를 불러옴
		if (confirm("정말로 불러오시겠습니까?")) {
			$("#content_text").val($.cookie("admin_artist_update_content_text_temp"));
		}
	});
});
</script>
</head>
<body class="admin_artist_update">
	<!-- header -->
	<div class="body">
		<form name="admin_artist_update_form" action="admin_artist_update_process.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="name" value="<%=vo.getName()%>">
			<input type="hidden" name="simg_old" value="<%=vo.getSimg()%>">
			<div class="top">
				<label id="add">아티스트 수정</label>
				<span id="button">
					<button type="button" class="btn btn-secondary" id="btn_set_temp">임시저장</button>
					<button type="button" class="btn btn-secondary" id="btn_get_temp">불러오기</button>
					<button type="button" class="btn btn-secondary" id="btn_update" onclick="artistUpdateFormCheck()">등록하기</button>
				</span>
			</div>
			<div>
				<label>가수명</label>
			</div>
			<div class="artist_name" id="artist_name"><%=vo.getName()%></div>
			<div id="content">
				<div>
					<div id="pofile_picture" style="background-image: url('http://localhost:9000/concert/images/<%=vo.getSimg()%>'); background-size: 100%; background-repeat:no-repeat;"></div>
					<textarea id="content_text" name="content_text" placeholder="내용을 입력하세요"><%=vo.getContent()%></textarea>
				</div>
				<%
					if (vo.getImg() != null) {
					out.print("<input type='file' name='img' value='" + vo.getSimg() + "'> <span id='fname'>" + "</span>");
				} else {
					out.print("<input type='file' name='img' value='" + vo.getSimg() + "'> <span id='fname'>선택된 파일 없음</span>");
				}
				%>
			</div>
		</form>
	</div>
</body>
</html>