<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src=""></script> <!-- js 파일 경로 넣기! -->
</head>
<body>
	<h3>관리자 - 통계</h3>
	<section class="container-md text-center" id="content_admin_satistics">
		<!-- 통계 방법 선택 -->
		<div class="row justify-content-end">
			<div class="col-md-4 text-right">
				<small class="text-dark">sort by</small>
				<select class="form-control-sm">
					<option>전체</option>
					<option>연령</option>
					<option>성별</option>
				</select>
			</div>
		</div>
		<!-- 통계 그림 -->
		<div class="border rounded">통계 그림 들어갈 공간~~</div>
	</section>
</body>
</html>

