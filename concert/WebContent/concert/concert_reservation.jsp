<%@page import="vo.ConcertVO"%>
<%@page import="dao.ConcertDAO"%>
<%@page import="dao.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%
	//
String concert_no = request.getParameter("concert_no");

ConcertDAO concertDAO = new ConcertDAO();
ConcertVO concertVO = concertDAO.getConcertInfo(concert_no);

 //이메일 인증
String id = (String) session.getAttribute("id");
MemberDAO dao = new MemberDAO();


int result = dao.emailCheck(id);
if(result!=0){ 

%>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘서트 예매</title>
<style type="text/css">
.seat {
	width: 35px;
	height: 35px;
}

.btn {
	padding: 0;
}
</style>
<script type="text/javascript">
	var concertNo =
<%=concert_no%>
	;
	var price =
<%=concertVO.getPrice()%>
	;

	$(document).ready(function() {
		
		$("#price").text(price);
		
		checkSeat();
		getSeatList(concertNo);
		makeTbody();

		$("input[name='seat']").on("click", function() {
			checkSeat();
		});

		$("select[name='number']").on("change", function() {
			checkSeat();
		});

		$("button#btn_submit").on("click", function() {
			submit();
		});

	});

	function makeTbody() {
		var tbody = $("#tbody");

		var html = "";
		for (var j = 'A'; j.charCodeAt(0) < 'H'.charCodeAt(0); j = String.fromCharCode(j.charCodeAt(0) + 1)) {
			html += "<tr>";
			html += "	<th >" + j + "</th>";
			for (var i = 1; i <= 12; i++) {
				var id = j + "_" + i;
				html += "<td>";
				html += "	<input type='checkbox' name='seat' class='btn btn-secondary seat' value='" + id + "' id='" + id + "'>";
				html += "</td>";
			}
			html += "</tr>";

		}
		tbody.html(html);
	}

	function getSeatList(concert_no) {
		$.ajax({ url : "concert_reservation_ajax.jsp", method : "POST", data : { "concert_no" : concert_no }, success : function(result) {
			var seatList = JSON.parse(result);
			disableReservedSeats(seatList);
			return seatList;
		} });
	}

	function disableReservedSeats(seatList) {
		for ( var i in seatList) {
			$('input#' + seatList[i].seat_no).removeAttr('name');
			$('input#' + seatList[i].seat_no).attr('disabled', 'disabled');
		}
	}

	function checkSeat() {
		// 예매할 인원 수
		var max = $("#number option:selected").val();

		// 체크된 좌석 
		var checked = $("input[name='seat']:checked");

		if (checked.length == max) { // 예매할 인원 수가 선택한 좌석 수가 같아지면 체크 비활성화
			$("input[name='seat']:not(:checked)").attr("disabled", "disabled");
		} else if (checked.length > max) {// 예매할 인원 수 보다 선택한 좌석 수가  많아지면 체크 해제
			alert("예매할 인원 수가 선택한 좌석수보다 많습니다.");
			$("input[name='seat']:checked").prop("checked", false);
			$("input[name='seat']:disabled").removeAttr("disabled");
		} else {
			$("input[name='seat']:disabled").removeAttr("disabled");
		}
		
		$("#price").text(checked.length * price);
	}

	function submit() {
		// 예매할 인원 수
		var max = $("#number option:selected").val();

		// 체크된 좌석 
		var checked = $("input[name='seat']:checked");
		if (max == checked.length) {
			form.submit();
		} else {
			alert("좌석 수를 확인해주세요");
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h1 class="font-weight-bold text-left m-3">좌석 선택</h1>
		<form name="form" action="concert_reservation_action.jsp" method="get">
			<input type="hidden" value="${param.concert_no}" name="concert_no" id="concert_no">
			<div class="row">
				<div class="col-md border rounded p-2 m-2">
					<table class="table table-borderless text-center">
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

						<tbody id="tbody">
						</tbody>
					</table>
				</div>
				<div class="col-md-3 border rounded p-2 m-2">
					<small class="d-block text-left text-dark m-2">인원수</small>
					<select class="form-control-sm m-2" name="number" id="number">
						<optgroup label="인원수">
							<option value="1" selected>1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
						</optgroup>
					</select>
					<br>
					<small class="text-danger m-2">코로나로 인해 5인 이상 예매 불가능 합니다.</small>
					<h6 class="font-weight-bold text-right"><span id="price">59000</span>
						<small>원</small>
					</h6>
					<button id="btn_submit" type="button" class="btn d-block btn-light m-2 p-2" style="width: -webkit-fill-available;">예매하기</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>


 <%
	
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이메일 인증한 회원만 사용 가능한 페이지 입니다.');");
	script.println("location.href = '../index.jsp'");
	script.println("</script>");
	script.close();
	return;
}
%> 