<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- js 구글 통계 라이브러리 --> 
<script>
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
	}
</script>
</head>
<body>
	<h3>관리자 - 통계</h3>
	<section class="container-md text-center" id="content_admin_satistics">
		<!-- 통계 방법 선택 -->
		<div class="row justify-content-end">
			<div class="col-md-4 text-right">
				<small class="text-dark">sort by</small>
				<select class="form-control-sm">
					<option>전체</option>
					<option>연령</option>
					<option>성별</option>
				</select>
			</div>
		</div>
		<!-- 통계 그림 -->
		<div class="row justify-content-center border rounded" id="chart_div"></div>
	</section>
</body>
</html>

