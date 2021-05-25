<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		
	}
</script>
<style type="text/css">
	form div{
		text-align:center;
		border : 1px solid blue;
	}
	form div.table, td{
		border: 1px solid black;
		border-collapse:collapse;
		text-align:center;
	}
</style>
<link rel="stylesheet" href="http://localhost:9000/concert/css/commons.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="http://localhost:9000/flower-garden-in-brain/header.jsp"></jsp:include>

	<form action="#" method="get" name="form_admin_member_list">
		<h3>회원 관리 게시판</h3>
		<div class="search_top">
			<input type="text" name="search_member">
			<button type="submit">돋보기</button>
		</div>
		<div>
			<table>
				<tr>
					<td>회원1</td>
					<td><button type="button">삭제</button></td>
				</tr>
				<tr>
					<td>회원1</td>
					<td><button type="button">삭제</button></td>
				</tr>
				<tr>
					<td>회원1</td>
					<td><button type="button">삭제</button></td>
				</tr>
				<tr>
					<td>회원1</td>
					<td><button type="button">삭제</button></td>
				</tr>
				<tr>
					<td>회원1</td>
					<td><button type="button">삭제</button></td>
				</tr>
				<tr>
					<td>회원1</td>
					<td><button type="button">삭제</button></td>
				</tr>
				<tr>
					<td>회원1</td>
					<td><button type="button">삭제</button></td>
				</tr>
				<tr>
					<td>회원1</td>
					<td><button type="button">삭제</button></td>
				</tr>
				<tr>
					<td>회원1</td>
					<td><button type="button">삭제</button></td>
				</tr>
				<tr>
					<td>회원1</td>
					<td><button type="button">삭제</button></td>
				</tr>
				<tr>
					<td>회원1</td>
					<td><button type="button">삭제</button></td>
				</tr>
				<tr>
					<td>회원1</td>
					<td><button type="button">삭제</button></td>
				</tr>
			</table>
		</div>
		<ul class="pagination">
			<li><a href="#">&laquo;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</form>
</body>
</html>