<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<style type="text/css">
a:hover {
	text-decoration: none;
}

}
.clearfix:before, .clearfix:after {
	display: table;
	content: ' ';
}

.clearfix:after {
	clear: both;
}

body {
	background: #f0f0f0 !important;
}

.page-404 .outer {
	position: absolute;
	top: 0;
	display: table;
	width: 100%;
	height: 100%;
}

.page-404 .outer .middle {
	display: table-cell;
	vertical-align: middle;
}

.page-404 .outer .middle .inner {
	width: 300px;
	margin-right: auto;
	margin-left: auto;
}

.page-404 .outer .middle .inner .inner-circle {
	height: 300px;
	border-radius: 100%;
	background-color: white;
	margin-top:40px;
	
}

.page-404 .outer .middle .inner .inner-circle:hover i {
	color: pink !important;
	background-color: #f5f5f5;
	box-shadow: 0 0 0 15px powderblue;
}

.page-404 .outer .middle .inner .inner-circle:hover span {
	color: powderblue;
}

.page-404 .outer .middle .inner .inner-circle i {
	font-size: 5em;
	line-height: 1em;
	float: right;
	width: 1.6em;
	height: 1.6em;
	margin-top: -.7em;
	margin-right: -.5em;
	padding: 20px;
	-webkit-transition: all .4s;
	transition: all .4s;
	text-align: center;
	color: #f5f5f5 !important;
	border-radius: 50%;
	background-color: powderblue;
	box-shadow: 0 0 0 15px #f0f0f0;
}

.page-404 .outer .middle .inner .inner-circle span {
	font-size: 7em;
	font-weight: 700;
	line-height: 1.2em;
	display: block;
	-webkit-transition: all .4s;
	transition: all .4s;
	text-align: center;
	color: gray;
	margin-left:10px;
}

.page-404 .outer .middle .inner .inner-status {
	font-size: 20px;
	display: block;
	margin-top: 20px;
	margin-bottom: 5px;
	text-align: center;
	color: #39bbdb;
}

.page-404 .outer .middle .inner .inner-detail {
	line-height: 1.4em;
	display: block;
	margin-bottom: 10px;
	text-align: center;
	color: gray;
}

.error {
	margin-right: 20px;
}
div.page-404 .outer .inner a#btn{
	display:block;
}
</style>
</head>
<body>
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
		rel="stylesheet">
	<div class="page-404">
		<div class="outer">
			<div class="middle">
				<div class="inner">

					<a href="./index.jsp">
						<div class="inner-circle">
							<i class="fa fa-home"></i><span class="error">Error</span>
						</div>
					</a> <span class="inner-status">에러페이지</span> <span class="inner-detail">
						페이지에 오류가 발생했습니다. 다시 시작해주세요 
					</span>
					<a href="./index.jsp" class="btn btn-info mtl" id="btn"><i
							class="fa fa-home" ></i>&nbsp; 홈으로 </a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>