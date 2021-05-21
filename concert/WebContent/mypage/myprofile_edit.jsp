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
													<input type="text" value="대구 북구 서변동 4933-24번지">
												</div>
												<div>
													<p>예매날짜/Date of issue</p>
													<input type="date">
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
												<input type="text" value="무아무아루">
											</td>
										</tr>
										<tr>
											<td>
												<p>성/Surname</p>
												<input type="text" value="KANG">
											</td>
										</tr>
										<tr>
											<td>
												<p>이름/Given name</p>
												<input type="text" value="JINSEUL">
											</td>
										</tr>
										<tr>
											<td>
												<p>생년월일/Date of birth</p>
												<input type="date">
											</td>
										</tr>
										<tr>
											<td>
												<p>휴대폰 번호</p>
												<select name="phone">
													<option value="">선택</option>
													<option value="010">010</option>
													<option value="011">011</option>
												</select>-<input type="text" value="5258">-<input type="text" value="7376">
											</td>
										</tr>
										<tr>
											<td>
												<button>예매내역 확인</button>
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
				<button type="button" onclick="location.href='myprofile_info.jsp'">확인</button>
			</div>
		</form>
	</section>
</body>
</html>