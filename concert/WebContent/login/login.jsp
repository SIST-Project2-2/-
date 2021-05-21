<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
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
		<form>
			<table>
				<tr>
					<td>
						<label>로그인</label>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="id">
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" id="pw">
					</td>
				</tr>
				<tr>
					<td>
						<button>로그인하기</button>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" onclick="location.href='../join/join.jsp'">계정이 없으신가요? 간편하게 가입하기</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>