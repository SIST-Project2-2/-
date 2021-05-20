<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/concert/css/commons.css">
<style>
section {
	text-align: center;
}

section>div {
	display: inline-block;
	width: 600px;
}

input {
	width: 100%;
}

th>label {
	display: inline-block;
	width: 110px;
}

td {
	width: 380px;
}

td.phone>input {
	width: 30%;
}

tr:last-child>td {
	text-align: right;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<section>
		<div>
			<table>
				<tr>
					<th>
						<label>아이디</label>
					</th>
					<td>
						<input type="text">
				</tr>
				<tr>
					<th>
						<label>비밀번호</label>
					</th>
					<td>
						<input type="password">
				</tr>
				<tr>
					<th>
						<label>비밀번호 확인</label>
					</th>
					<td>
						<input type="password">
				</tr>
				<tr>
					<th>
						<label>닉네임</label>
					</th>
					<td>
						<input type="text">
				</tr>
				<tr>
					<th>
						<label>이름</label>
					</th>
					<td>
						<input type="text">
				</tr>
				<tr>
					<th>
						<label>성별</label>
					</th>
					<td>
						<input type="text">
				</tr>
				<tr>
					<th>
						<label>생년월일</label>
					</th>
					<td>
						<input type="text">
				</tr>
				<tr>
					<th>
						<label>핸드폰</label>
					</th>
					<td class="phone">
						<input type="text">-<input type="text">-<input type="text">
				</tr>
				<tr>
					<th>
						<label>주소</label>
					</th>
					<td>
						<input type="text">
					</td>
				</tr>
				<tr>
					<th>
						<label> </label>
					</th>
					<td>
						<input type="text">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button>회원가입</button>
						<button>취소</button>
					</td>
				</tr>

			</table>
		</div>
	</section>
</body>
</html>