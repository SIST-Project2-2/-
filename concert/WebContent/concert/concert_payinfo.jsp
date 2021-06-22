<%@page import="concert.Commons"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.PayInfoDAO"%>
<%@ page import="dao.MemberDAO"%>
<%@ page import="vo.PayInfoVO"%>
<%
	//
PrintWriter script = response.getWriter();
PayInfoDAO dao = new PayInfoDAO();
PayInfoVO vo = null;
int no = 0;

if (request.getParameter("no") == null) { // 입력받은 주문 번호가 없을 경우 에러 페이지 이동
	out.print(Commons.getErrorRedirect());
} else {
	no = Integer.parseInt(request.getParameter("no"));
	// 해당 주문 정보의 id와 로그인한 id가 일치하지 않은 경우 에러 페이지 이동
	if (!dao.isCorrectUser(no, (String) session.getAttribute("id"))) {
		out.print(Commons.getErrorRedirect());
	}
	vo = dao.getPayInfo(no);
	dao.close();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 영수증</title>
<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<section class="container-md" id="content_concert_payinfo">
		<h1 class="font-weight-bold text-left mb-3">콘서트 결제영수증</h1>
		<div class="row justify-content-center">
			<div class="col-md-7 bg-dark">
				<div class="bg-white my-3 p-3 rounded font-weight-bold">
					<small class="text-left font-weight-bold">예매번호</small>
					<h2 class="text-center my-3"><%=vo.getOrderNo()%></h2>
					<div class="row justify-content-center">
						<div class="col-md-10 my-4" style="border-top: 2px dashed gray;"></div>
					</div>
					<div class="text-left mt-3">
						<small class="font-weight-bold">예매자</small>
						<h3 class="ml-3"><%=vo.getFirstName() + " " + vo.getLastName()%></h3>
					</div>
					<div class="text-left mt-3">
						<small class="font-weight-bold">연락처</small>
						<h3 class="ml-3"><%=vo.getHp()%></h3>
					</div>
					<div class="text-left my-3">
						<small class="font-weight-bold">콘서트 정보</small>
						<div class="container-md ml-1" style="border-left: 2px solid lightgray">
							<div class="row pl-2">
								<small class="font-weight-bold">
									날짜_<%=vo.getDate()%></small>
							</div>
							<%
								for (String seat : vo.getSeats()) {
							%>
							<div class="row pl-2">
								<small class="font-weight-bold">
									좌석_<%=seat%></small>
							</div>
							<%
								}
							%>
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col-md-10 my-3" style="border-top: 2px solid gray;"></div>
					</div>
					<div class="row justify-content-end my-3">
						<!-- 총 가격 = 좌석 가격 * 좌석 갯수 -->
						<h3 class="mr-5">&#8361;<%=vo.getPrice() * vo.getSeats().size()%></h3>
					</div>
					<div>바코드 영역~</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>