<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<script src="../../js/jquery.cookies.js"></script>
<script src="../../js/notice_edit.js"></script>
</head>
<body class="admin_notice_add">
	<div class="container">
		<form name="admin_notice_add_form" id="admin_notice_add_form">
			<%--top 영역--%>
			<div class="clearfix pt-3">
				<h3 class="d-inline-block float-lfet ">공지사항 등록</h3>
				<button type="button" class="btn btn-light float-right" id="btn_set_temp">임시저장</button>
				<button type="button" class="btn btn-light float-right" id="btn_add">등록하기</button>
			</div>

			<%--컨텐츠 영역--%>
			<div class="h-100 ">
				<input type="text" class="form-control form-control-sm w-50 mb-1" placeholder="태그(키워드)를 입력하세요" name="tag" id="tag">
				<input type="text" class="form-control form-control-sm w-100" placeholder="제목을 입력하세요" name="title" id="title">
				<div class="h-100">
					<hr>
					<div class="container-md">
						<div class="row mb-2 justify-content-end">
							<label class="my-auto pr-1" style="font-size: 15px">이미지 선택:</label>
							<input type="file" name="img" id="img" class="w-80 rounded" style="border: 1px solid #ced4da; padding: 2px; font-size: 12px;">
						</div>
					</div>
					<div class="container-md px-0" style="border: 1px solid #ced4da; font-size: 10px">
						<div class="row m-0 p-0 bg-light" style="border-bottom: 1px solid #ced4da">
							<button type="button" class="btn px-1 py-0" id="btn_bold" style="font-weight: bold">가</button>
							<button type="button" class="btn px-1 py-0" id="btn_italic" style="font-style: italic">가</button>
							<button type="button" class="btn px-1 py-0" id="btn_underline" style="text-decoration: underline">가</button>
							<button type="button" class="btn btn-primary px-1 py-0" id="btn_get_temp" style="font-size: 11px">임시저장 불러오기</button>
						</div>
						<div class="m-0 p-2" id="content" contenteditable="true" style="height: 400px"></div>
						<input type="hidden" name="content" id="content_hidden">
					</div>
				</div>
			</div>

		</form>
	</div>

</body>
</html>