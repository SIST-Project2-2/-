<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
Cookies cookies = new Cookies(request);

String storedId = cookies.getValue("storedId"); // 마지막으로 로그인 성공한 아이디
String auto_login = cookies.getValue("auto_login");

// 아이디 저장 + 자동 로그인 쿠키가 존재하면 로그인 실행"
if (cookies.exists("storeId") && cookies.exists("auto_login")) {
	response.sendRedirect("login_action.jsp?id=" + storedId + "&pw=" + auto_login + "&inametore=on&auto_login=on");
}
%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div class="container" style="width: 500px;">
		<form action="login_action.jsp" method="get">
			<div class="text-center">
				<div class="form-group">
					<label class="font-weight-bold" style="font-size: 40px;">로그인</label>
					<p class="border border-dark bg-dark text-dark" style="padding: 3px;"></p>
					<input type="text" class="form-control" placeholder="아이디" id="id" name="id" required="required" value="<%=storedId == null ? "" : storedId%>">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" id="pw" name="pw" required="required">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block text-white bg-dark border-dark">로그인하기</button>
				</div>
				<div class="form-group">
					<a href="../join/join.jsp" class="btn btn-primary btn-block rounded-pill text-dark bg-white border-dark">계정이 없으신가요? 간편하게 가입하기</a>
				</div>
			</div>
			<div class="d-flex text-muted">
				<label>
					<input type="checkbox" name="id_store" id="id_store" <%="".equals(storedId) ? "" : "checked"%>>
					<small> 아이디 저장 </small>
				</label>
				<label class="ml-2">
					<input type="checkbox" name="auto_login" id="auto_login">
					<small> 자동 로그인 </small>
				</label>
				<small class="ml-auto">
					<a href="find_id.jsp" class="text-decoration-none text-muted">아이디 찾기</a>
					|
					<a href="find_password.jsp" class="text-decoration-none text-muted">비밀번호 찾기</a>
				</small>
			</div>
		</form>
	</div>
</body>
</html>