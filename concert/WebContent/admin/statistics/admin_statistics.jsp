<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="dao.StatisticsDAO" %>
<%@ page import="dao.MemberDAO" %>
<%
	MemberDAO mDao = new MemberDAO();
	
	//로그인한 유저가 관리자나 테스터가 아닌 경우 에러 페이지 이동
	if(mDao.getAuthority((String)session.getAttribute("id")) != 1 && mDao.getAuthority((String)session.getAttribute("id")) != 2) {
		response.sendRedirect("../../error.jsp");
	}
	mDao.close();

	PrintWriter script = response.getWriter();
	StatisticsDAO dao = new StatisticsDAO();
	LinkedHashMap<String, Integer> bySex = null;
	LinkedHashMap<String, Integer> byAge = null;
	String[] artists = {"전체", "10cm", "IU", "잔나비", "장범준", "현아"};

	// 입력받은 파라미터가 없을 경우 전체 통계를 불러오고, 아티스트를 입력받았으면 해당 아티스트 통계를 불러온다.
	if(request.getParameter("artist") == null || "전체".equals(request.getParameter("artist"))) {
		bySex = dao.getDataBySex();
		byAge = dao.getDataByAge();
	}else {
		bySex = dao.getDataBySex(request.getParameter("artist"));
		byAge = dao.getDataByAge(request.getParameter("artist"));
	}
	dao.close();
%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- js 구글 통계 라이브러리 --> 
<% // js 배열에 꺼내온 데이터 저장
	script.println("<script>");
	script.println("var bySex = [], byAge = [];");
	
	for(String key : bySex.keySet()) {
		script.println("bySex.push(['" + key + "'," + bySex.get(key) + "]);");
	}
	
	for(String key : byAge.keySet()) {
		script.println("byAge.push(['" + key + "대'," + byAge.get(key) + "]);");
	}
	script.println("</script>");
%>
<script>
	$(document).ready(function() {
		$("#artist_select").change(function() {
			location.href = "admin_statistics.jsp?artist=" + $(this).val();
		});
	});
	
	// 구글 차트 기능 로드
	google.charts.load('current', {'packages':['corechart']});
	
	// 구글 차트 로딩 완료 시 해당 함수 실행
	google.charts.setOnLoadCallback(drawChartBySex);
	google.charts.setOnLoadCallback(drawChartByAge);
	
	// 성별 통계 차트 그리기
	function drawChartBySex() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '성별');
		data.addColumn('number', '인원 수');
		data.addRows(bySex);
		
		var options = {'title':'성별 통계',
		               'width':500,
		               'height':450};
		
		var chart = new google.visualization.PieChart(document.getElementById('chart_by_sex'));
		chart.draw(data, options);
	};
	
	// 연령별 통계 차트 그리기
	function drawChartByAge() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', '연령별');
		data.addColumn('number', '인원 수');
		data.addRows(byAge);
		
		var options = {'title':'연령별 통계',
		               'width':500,
		               'height':450};
		
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_by_age'));
		chart.draw(data, options);
	};
</script>
</head>
<body>
	<section class="container-md text-center" id="content_admin_satistics">
		<h1 class="font-weight-bold text-left">통계</h1>
		<!-- 통계 방법 선택 -->
		<div class="row justify-content-end">
			<div class="col-md-4 text-right mb-3">
				<small class="text-dark">아티스트:</small>
				<select class="form-control-sm" id="artist_select">
					<% for(String str : artists) { // 아티스트별 셀렉트박스 생성 %>
					<option value="<%= str %>" <% if(str.equals(request.getParameter("artist"))) { %> selected <% } %>><%= str %></option>
					<% } %>
				</select>
			</div>
		</div>
		<!-- 통계 그림 -->
		<div class="row justify-content-center border rounded" id="chart_div">
			<div class="d-inline-block" id ="chart_by_sex"></div>
			<div class="d-inline-block" id ="chart_by_age"></div>
		</div>
	</section>
</body>
</html>

