<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/concert/css/commons.css">
<style>
* {
	border: 1px solid black;
	margin: 1px;
}

table {
	border-collapse: collapse;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<section>
		<table>
			<tr>
				<h3>탈퇴하기</h3>
			</tr>
			<tr>
				<div style="height: 1px; border-bottom: 5px solid black;"></div>
			</tr>
			<p>정말로 탈퇴하실껀가요</p>
			<tr>
				<button>네</button>
				<button>네니오</button>
			</tr>
		</table>
	</section>
</body>
</html>