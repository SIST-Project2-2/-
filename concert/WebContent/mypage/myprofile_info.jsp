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
		<div>
			<h1>마이페이지</h1>
		</div>
		<form>
			<div>
				<table>
					<tr>
						<p>대 한 민 국 REPUBLIC OF KOREA</p>
					</tr>
					<tr>
						<table>
							<tr>
								<td>
									<h1>여권 PASSPORT</h1>
								</td>
								<td>
									<h3>여권번호/Passport number</h3>
								</td>
							</tr>
							<tr>
								<td>
									<img alt="" src="../images/장범준.jpg" width="150px">
								</td>
								<td>
									<table>
										<tr>
											<td></td>
											<td rowspan="7">
												<div>
													<p>주소/Address</p>
													<p>대구 북구 서변동 4933-24번지</p>
												</div>
												<div>
													<p>예매날짜/Date of issue</p>
													<p>04 MAY 2022</p>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<p>ID</p>
												<p>rkdwlstmf1</p>
											</td>
										</tr>
										<tr>
											<td>
												<p>닉네임</p>
												<p>무아무아루</p>
											</td>
										</tr>
										<tr>
											<td>
												<p>성/Surname</p>
												<p>KANG</p>
											</td>
										</tr>
										<tr>
											<td>
												<p>이름/Given name</p>
												<p>JINSEUL</p>
											</td>
										</tr>
										<tr>
											<td>
												<p>생년월일/Date of birth</p>
												<p>11 AUG 1997</p>
											</td>
										</tr>
										<tr>
											<td>
												<p>휴대폰 번호</p>
												<p>010-5258-7376</p>
											</td>
										</tr>
										<tr>
											<td>
												<button type="button" onclick="location.href='myticketlist.jsp'">예매내역 확인</button>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</tr>
					<tr></tr>
				</table>
			</div>
			<div>
				<button type="button" onclick="location.href='myprofile_edit.jsp'">수정하기</button>
				<button type="button" onclick="location.href='accountdelete.jsp'">탈퇴하기</button>
			</div>
		</form>
	</section>
</body>
</html>