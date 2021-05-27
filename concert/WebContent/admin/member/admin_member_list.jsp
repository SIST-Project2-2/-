<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {

	}
</script>
<style>
	form div {
		text-align: center;
	}
	
	form div.table, td {
		border-collapse: collapse;
		text-align: center;
	}
	div#member_delete{
		margin:auto;
		width:50%;
	}

</style>
</head>
<body>

	<form action="#" method="get" name="form_admin_member_list">
		<h3>회원 관리 게시판</h3>
		<div class="search_top">
			<input type="text" name="search_member">
			<button type="submit">돋보기</button>
		</div>
		<div id="member_delete">
			<table class="table">
			  <tbody>
			    <tr>
			      <td>ID 닉네임 이름 주소(미필수) 핸펀호 비밀번호 이메일</td>
			      <td><button type="button">삭제</button></td>
			    </tr>
			    <tr>
			      <td>ID 닉네임 이름 주소(미필수) 핸펀호 비밀번호 이메일</td>
			      <td><button type="button">삭제</button></td>
			    </tr>
			    <tr>
			      <td>ID 닉네임 이름 주소(미필수) 핸펀호 비밀번호 이메일</td>
			      <td><button type="button">삭제</button></td>
			    </tr>
			    <tr>
			      <td>ID 닉네임 이름 주소(미필수) 핸펀호 비밀번호 이메일</td>
			      <td><button type="button">삭제</button></td>
			    </tr>
			    <tr>
			      <td>ID 닉네임 이름 주소(미필수) 핸펀호 비밀번호 이메일</td>
			      <td><button type="button">삭제</button></td>
			    </tr>
			    <tr>
			      <td>ID 닉네임 이름 주소(미필수) 핸펀호 비밀번호 이메일</td>
			      <td><button type="button">삭제</button></td>
			    </tr>
			    <tr>
			      <td>ID 닉네임 이름 주소(미필수) 핸펀호 비밀번호 이메일</td>
			      <td><button type="button">삭제</button></td>
			    </tr>
			    <tr>
			      <td>ID 닉네임 이름 주소(미필수) 핸펀호 비밀번호 이메일</td>
			      <td><button type="button">삭제</button></td>
			    </tr>
			    <tr>
			      <td>ID 닉네임 이름 주소(미필수) 핸펀호 비밀번호 이메일</td>
			      <td><button type="button">삭제</button></td>
			    </tr>
			    <tr>
			      <td>ID 닉네임 이름 주소(미필수) 핸펀호 비밀번호 이메일</td>
			      <td><button type="button">삭제</button></td>
			    </tr>
			  </tbody>
			</table>
		</div>
		<!-- 
		<ul class="pagination">
			<li><a href="#">&lt;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&gt;</a></li>
		</ul>
		 -->
		 <div>
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		 </div>
	</form>
</body>
</html>