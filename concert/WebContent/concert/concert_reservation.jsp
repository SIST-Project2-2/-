<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.seat {
	width: 50px;
	height: 50px;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="font-weight-bold text-left">좌석 선택</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th></th>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>6</th>
					<th>7</th>
					<th>8</th>
					<th>9</th>
					<th>10</th>
					<th>11</th>
					<th>12</th>
				</tr>
			</thead>
			<tbody>
				<%
					// 좌석 배치를 테이블로 구현
				String tbody = "";
				for (int j = (int) 'A'; j <= (int) 'H'; j++) {
					tbody += "<tr>";
					tbody += "	<th>" + (char) j + "</th>";
					for (int i = 1; i <= 12; i++) {
						String id = Character.toString((char) j) + i;
						tbody += "<td>";
						tbody += "	<button type='button' class='btn btn-secondary seat' id='" + id + "'>" + id + "</button>";
						tbody += "</td>";
					}
					tbody += "</tr>";
				}

				out.write(tbody);
				%>
			</tbody>
		</table>
	</div>
</body>
</html>