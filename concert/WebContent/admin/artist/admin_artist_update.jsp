<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ArtistDAO, vo.ArtistVO, java.util.*"%>
<%
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
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/concert/css/admin_artist_update.css">
<script type="text/javascript">
	/*게시판 - 글쓰기 폼체크*/
	function artistFormCheck() {
		var name = document.getElementById("artist_name");
		var content = document.getElementById("content_text");

		if (name.value == "") {
			alert("이름을 입력해주세요");
			name.focus();
			return false;
		} else if (content.value == "") {
			alert("내용을 입력해주세요");
			name.focus();
			return false;
		} else if (img.value == "") {
			alert("이름을 입력해주세요");
			name.focus();
			return false;
		} else if (simg.value == "") {
			alert("이름을 입력해주세요");
			name.focus();
			return false;
		} else {
			admin_artist_edit.submit();
		}

		$(document).ready(function() {
			$("input[type='file']").on("change", function() {
				if (window.FileReader) {
					var filename = $(this)[0].files[0].name;
					$("#fname").text("").text(filename);
				}
			});
		});
	}
</script>
<style>
div#profile_picture img {
	width: 200px;
}
</style>
</head>
<body>
	<!-- header -->
	<div class="body">
		<form name="admin_artist_update_form" action="admin_artist_update_process.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="name" value="<%=vo.getName()%>"> <input type="hidden" name="simg_old" value="<%=vo.getSimg()%>">
			<div class="top">
				<label id="add">아티스트 수정</label> <span id="button">
					<button type="button" class="btn btn-secondary">임시저장</button>
					<button type="submit" class="btn btn-secondary" id="btn_update">등록하기</button>
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
					out.print(
					"<input type='file' name='img' value='" + vo.getSimg() + "'> <span id='fname'>"  + "</span>");
				} else {
					out.print("<input type='file' name='img' value='" + vo.getSimg() + "'> <span id='fname'>선택된 파일 없음</span>");
				}
				%>
			</div>
		</form>
	</div>
</body>
</html>