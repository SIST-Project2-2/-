<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body class="page-404">
	<div class="outer">
		<div class="middle">
			<div class="inner">
				<a href="http://localhost:9000/concert/index.jsp">
					<div class="inner-circle">
						<i class="fa fa-home"></i><span class="error">Error</span>
					</div>
				</a>
				<span class="inner-status">에러페이지</span> <span class="inner-detail"> 페이지에 오류가 발생했습니다. 다시 시작해주세요 </span>
				<a href="./index.jsp" class="btn btn-info mtl" id="btn">
					<i class="fa fa-home"></i>&nbsp; 홈으로
				</a>
			</div>
		</div>
	</div>
</body>
</html>