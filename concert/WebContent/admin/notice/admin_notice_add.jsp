<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-콘서트 등록</title>
</head>
<body>
	<div class="container ">
		<form name="admin_notice_list" method="post" action="./admin_notice_add_action.jsp" >		
			<%--top 영역--%>
			<div class="clearfix pt-3">
				<h3 class="d-inline-block float-lfet ">공지사항 등록</h3>
				<button class="btn btn-light float-right">임시저장</button>
				<button class="btn btn-light float-right" type="submit">등록하기</button>
			</div>
			
			<%--컨텐츠 영역--%>
			<div class="h-100 ">
				<input type="text" class="w-50" placeholder="태그(키워드)를 입력하세요" name="tag" id="tag">
				<input type="text" class="w-100" placeholder="제목을 입력하세요" name="title" id="title">
				<div class="h-100">
					<div class="btn-group pt-3">
						<button class="btn btn-secondary btn btn-light float-righ">Text</button>
						<button class="btn btn-secondary btn btn-light float-righ">이미지 삽입</button>
					</div>
					<hr>
					<textarea class="w-100" placeholder="내용을 입력하세요"
						style="height: 500px;" name="content" id="content"></textarea>
				</div>
			</div>

		</form>
	</div>

</body>
</html>