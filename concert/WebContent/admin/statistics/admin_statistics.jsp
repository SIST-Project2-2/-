<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="dao.StatisticsDAO" %>
<%
	//response.setContentType("text/html; charset=UTF-8");
	PrintWriter script = response.getWriter();
	StatisticsDAO dao = new StatisticsDAO();
	HashMap<String, Integer> bySex = null;
	HashMap<String, Integer> byAge = null;
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
<% // js object에 꺼내온 데이터 저장
	script.println("<script>");
	script.println("var bySex = [], byAge = [];");
	for(String key : bySex.keySet()) {
		script.println("bySex.push(['" + key + "'," + bySex.get(key) + "]);");
	}
	
	for(String key : byAge.keySet()) {
		script.println("byAge.push(['" + key + "'," + byAge.get(key) + "]);");
	}
	script.println("</script>");
%>
<script>
	$(document).ready(function() {
		$("#artist_select").change(function() {
			location.href = "admin_statistics.jsp?artist=" + $(this).val();
		});
	});
	
	//Load the Visualization API and the corechart package.
	google.charts.load('current', {'packages':['corechart']});
	
	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);
	
	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {
		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', '성별');
		data.addColumn('number', '인원 수');
		data.addRows([
			['남', 3],
			['여', 2]
		]);
		
		// Set chart options
		var options = {'title':'통계 예시',
		               'width':800,
		               'height':600};
		
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
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
					<% for(String str : artists) { %>
					<option value="<%= str %>" <% if(str.equals(request.getParameter("artist"))) { %> selected <% } %>><%= str %></option>
					<% } %>
				</select>
			</div>
		</div>
		<!-- 통계 그림 -->
		<div class="row justify-content-center border rounded" id="chart_div"></div>
	</section>
</body>
</html>

