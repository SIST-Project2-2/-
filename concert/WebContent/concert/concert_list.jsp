<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/concert/css/commons.css">
<style>
* {
	border: 1px solid black;
	margin: 1px;
}

table {
	border-collapse: collapse;
}
</style>
<script type="text/javascript">
	// 참고자료: https://velog.io/@eesiwoo/D23과제-달력-만들기

	window.onload = function() {
		var calendar = document.getElementById("calendar"); // html의 테이블 태그 가져오기
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth();
		var YM = year + "년" + (month + 1) + "월"; // JS는 월을 0~11로 표현하므로 1을 더해줌
		document.getElementById("YM").innerHTML = YM;
		var first_date = new Date(year, month, 1).getDate(); // 이번 달의 첫번째 날
		var last_date = new Date(year, month + 1, 0).getDate(); // 월의 마지막 날 = 다음달의 0번째 날
		var first_day = new Date(year, month, 1).getDay(); // 월의 시작요일

		makeCalendar();

		document.getElementById("btn_before_month").onclick = before_month;
		document.getElementById("btn_next_month").onclick = next_month;

		function makeCalendar() {
			var row = calendar.insertRow(); // 첫번째 주 생성
			for (i = 0; i < first_day; i++) { // 첫번째 주의 1일까지 빈칸 생성
				var cell = row.insertCell();
				cell.innerHTML = "";
			}

			for (i = 1; i <= last_date; i++) {
				if (first_day < 7) { // first_day의 범위는 0~6. 일주일은 한줄에 7개이므로 7개 이상은 찍지 않는다
					var cell = row.insertCell(); // 칸 추가
					cell.setAttribute("id", [ i ]); // 해당 칸에 id 설정
					cell.innerHTML = [ i ]; // 해당 칸에 값 입력
					first_day += 1; // 다음 날짜를 추가하기 위해 1을 더함
				} else { // first_day가 7이상이 되면 실행. 즉, 일주일을 다 찍으면 실행
					row = calendar.insertRow(); // 달력에 행 추가

					var cell = row.insertCell();
					cell.setAttribute("id", [ i ]);
					cell.innerHTML = [ i ]; // 여기까지의 3줄은 위와 동일

					first_day -= 6; // 새로 만든 행의 일요일은 이미 추가했으므로 6을 빼줌
				}
			}
			search_today();
		}
		function before_month() {
			while (calendar.rows.length > 2) {
				// 달력의 월, 요일 표시 빼고 삭제
				calendar.deleteRow(calendar.rows.length - 1); // 맨 마지막 줄부터 삭제
			}
			month -= 1; // 이전 달로 변경

			if (month === -1) {
				// 1월에서 이전으로 가는 경우 이전 연도의 12월로 변경
				year -= 1;
				month = 12;
			}

			YM = year + "년" + (month + 1) + "월";
			document.getElementById("YM").innerHTML = YM;

			first_date = new Date(year, month, 1).getDate(); // 이번 달의 첫번째 날
			last_date = new Date(year, month + 1, 0).getDate(); // 월의 마지막 날 = 다음달의 0번째 날
			first_day = new Date(year, month, 1).getDay(); // 월의 시작요일

			makeCalendar();
			search_today();
		}

		function next_month() {
			while (calendar.rows.length > 2) {
				// 달력의 월, 요일 표시 빼고 삭제
				calendar.deleteRow(calendar.rows.length - 1); // 맨 마지막 줄부터 삭제
			}
			month += 1; // 이전 달로 변경

			if (month === 12) {
				// 12월에서 다음달로 가는 경우 다음연도의 1월로 가도록 변경
				year += 1;
				month = 1;
			}

			YM = year + "년" + (month + 1) + "월";
			document.getElementById("YM").innerHTML = YM;

			first_date = new Date(year, month, 1).getDate(); // 이번 달의 첫번째 날
			last_date = new Date(year, month + 1, 0).getDate(); // 월의 마지막 날 = 다음달의 0번째 날
			first_day = new Date(year, month, 1).getDay(); // 월의 시작요일

			makeCalendar();
			search_today();
		}

		function search_today() {
			var today_date = today.getDate();
			var this_month = today.getMonth();
			var this_year = today.getFullYear();
			var this_YM = this_year + "년" + (this_month + 1) + "월";
			for (i = 1; i <= last_date; i++) {
				var set_id = document.getElementById([ i ]);

				if (today_date == set_id.getAttribute("id") && this_YM == YM) {
					// alert("today_date: " + today_date + ", set_id: "	+ set_id.getAttribute("id"));
					// alert("this_YM: " + this_YM + ", " + "YM: " + YM);
					document.getElementById([ i ]).style.backgroundColor = "red";
				}
			}
		}
	}
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<section>
		<table id="calendar">
			<thead>
				<tr>
					<td>
						<input type="button" id="btn_before_month" value="<">
					</td>
					<td colspan="5">
						<h3 id="YM">5월</h3>
					</td>
					<td>
						<input type="button" id="btn_next_month" value=">">
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
			</tbody>
		</table>
	</section>
</body>
</html>