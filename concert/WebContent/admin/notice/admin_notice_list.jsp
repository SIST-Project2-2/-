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

div {
	display: inline-block;
}

td>* {
	display: inline-block;
	text-align: center;
}

td:last-child {
	text-align: right;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>

	<section>
		<div>
			<table>
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
				<tr>
					<td>1</td>
					<td>공지사항입니다</td>
					<td>이창민</td>
					<td>10</td>
					<td>2021-05-20 19:16</td>
				</tr>
				<tr>
					<td>2</td>
					<td>공지사항입니다</td>
					<td>이창민</td>
					<td>10</td>
					<td>2021-05-20 19:16</td>
				</tr>
				<tr>
					<td>3</td>
					<td>공지사항입니다</td>
					<td>이창민</td>
					<td>10</td>
					<td>2021-05-20 19:16</td>
				</tr>
				<tr>
					<td>4</td>
					<td>공지사항입니다</td>
					<td>이창민</td>
					<td>10</td>
					<td>2021-05-20 19:16</td>
				</tr>
				<tr>
					<td>5</td>
					<td>공지사항입니다</td>
					<td>이창민</td>
					<td>10</td>
					<td>2021-05-20 19:16</td>
				</tr>
				<tr>
					<td>6</td>
					<td>공지사항입니다</td>
					<td>이창민</td>
					<td>10</td>
					<td>2021-05-20 19:16</td>
				</tr>
				<tr>
					<td>7</td>
					<td>공지사항입니다</td>
					<td>이창민</td>
					<td>10</td>
					<td>2021-05-20 19:16</td>
				</tr>
				<tr>
					<td>8</td>
					<td>공지사항입니다</td>
					<td>이창민</td>
					<td>10</td>
					<td>2021-05-20 19:16</td>
				</tr>
				<tr>
					<td>9</td>
					<td>공지사항입니다</td>
					<td>이창민</td>
					<td>10</td>
					<td>2021-05-20 19:16</td>
				</tr>
				<tr>
					<td>10</td>
					<td>공지사항입니다</td>
					<td>이창민</td>
					<td>10</td>
					<td>2021-05-20 19:16</td>
				</tr>
				<tr>
					<td colspan="5">
						<button type="button" onclick="location.href='admin_notice_add.jsp'">글 쓰기</button>
					</td>
				</tr>
			</table>
		</div>
	</section>
</body>
</html>