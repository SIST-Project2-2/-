<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.CommentDAO,vo.CommentVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="dao.ArtistDAO, vo.ArtistVO, java.util.*"%>


<%
	CommentDAO dao = new CommentDAO();
String id = (String) session.getAttribute("id");

//사용자가 누른 댓글 페이지
String pageNumber = request.getParameter("pageNumber");
//사용자가 누른 댓글 페이지가 없을때는 1페이지가 보이게 함
if (pageNumber == null) {
	pageNumber = "1";
}
int viewPage = Integer.parseInt(pageNumber);
int indexNumber = (viewPage - 1) * 10;

//댓글 수에 비례해서 보여지는 댓글 페이지 수 
int lastPage = (int) Math.ceil((double) dao.getCount() / 10.0);
int endNumber = indexNumber + 10;

//댓글 데이터 출력
ArrayList<CommentVO> plist = dao.getListPage(indexNumber, endNumber);

//아티스트 데이터 출력
ArtistDAO artistDAO = new ArtistDAO();
ArrayList<ArtistVO> list = artistDAO.getList();

//관리자가 등록한 아티스트 수 
int artistNumber = list.size();




%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="artist_list.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<title>아티스트 목록</title>


</head>

<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<div id="carouselSlider" class="carousel slide">

		<ol class="carousel-indicators">
			<li data-target="#carouselSlider" data-slide-to="0" class="active"></li>
			<%
				for (int i = 1; i <= artistNumber; i++) {
			%>
			<li data-target="#carouselSlider" data-slide-to="<%=i%>"></li>
			<%
				}
			%>
		</ol>
		<div class="carousel-inner">
			<!--아티스트 목록 소개 캐러셀(관리자 소개 프론트엔드쪽 관리) ***관리자와 연동되지 않은 고정캐러셀 입니다*** -->

			<div class="carousel-item active">
				<div class="carousel-caption">
					<div class="article">
						<img src="../images/콘서트소개.jpg" class="h-20"
							style="width: 100%; height: 50%">

						<hr>
						<div class="third">

							<hr>
							<div class="ui-bg-cover ui-bg-overlay-container text-black">
								<div class="ui-bg-overlay bg-white opacity-50"></div>
								<div class="container">
									<div
										class="d-flex justify-content-between align-items-center pt-4">
									</div>
								</div>

								<div class="container" id="artistContainer">
									<div class="text-center py-5">

										<img src="../images/관리자이미지.png" alt=""
											class="ui-w-100 rounded-circle">

										<div class="col-md-8 col-lg-6 col-xl-5 p-0 mx-auto">
											<h2 class="font-weight-bold my-4">콘서트 커뮤니티 공간</h2>

											<div class="opacity-75 mb-4" id="artistText">콘서트 커뮤니티
												공간입니다. 아티스트들의 노래와 프로필을 보며 자유롭게 댓글활동을 할 수 있는 공간입니다.</div>
										</div>

									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 관리자와 연동된 아티스트 캐러셀 -->
			<%
				for (ArtistVO vo : list) {
			%>


			<div class="carousel-item ">
				<div class="carousel-caption">
					<div class="article">
						<img src="../images/<%=vo.getSimg()%>" class="h-20">


						<div class="third">
							<hr>
							<div class="ui-bg-cover ui-bg-overlay-container text-black"
								id="artistPage">
								<div class="ui-bg-overlay bg-white opacity-50"></div>
								<div class="container">
									<div
										class="d-flex justify-content-between align-items-center pt-4">


									</div>
								</div>

								<div class="container" id="artistContainer">
									<div class="text-center py-5">

										<img src="../images/<%=vo.getSimg()%>" alt=""
											class="ui-w-100 rounded-circle">

										<div class="col-md-11 col-lg-6 col-xl-12 p-0 mx-auto">
											<h2 class="font-weight-bold my-4"><%=vo.getName()%></h2>

											<div class="opacity-75 mb-4" id="artistText"><%=vo.getContent()%></div>
										</div>

									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
		<!--캐러셀 prev/ next 버튼 -->
		<a class="carousel-control-prev" href="#carouselSlider" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"></span>
			<span class="pageControl">Previous</span>
		</a> <a class="carousel-control-next " href="#carouselSlider"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon"></span> <span class="pageControl">Next</span>
		</a>
	</div>

	<!--댓글-->

	<div class="comment">
		<form method="get" action="./sendReplyAction.jsp?id=<%=id%>"
			class="form-inline mt-3" style="margin-top: 0px;">
			<input type="hidden" name="id" value=<%=id%>>
			<section class="container">
				<select name="artistDivide" class="form-control mx-1 mt-2">
					<option value="IU">IU</option>
					<option value="장범준">장범준</option>
					<option value="현아">현아</option>
					<option value="잔나비">잔나비</option>
					<option value="10cm">10cm</option>
				</select>
				<%
					if (id != null) {
				%>
				<input type="text" name="content" maxlength="20"
					class="form-control mx-4 mt-2 w-50"
					placeholder="댓글 내용을 입력해주세요(20글자 이내)">
				<button type="submit" class="btn btn-primary">등록</button>
				<%
					} else {
				%>
				<input type="text" name="content" maxlength="20"
					class="form-control mx-4 mt-2 w-50"
					placeholder="댓글을 입력하기 위해서는 로그인을 해주세요" disabled>
				<%
					}
				%>
			
		</form>


		<%
			if (id != null) {
			for (CommentVO vo : plist) {
		%>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">

						<small style="border-right: 5px solid black;"><%=vo.getArtist()%></small>&nbsp;<%=vo.getId()%>
					</div>
					<div class="col-4 text-right">
						<span style="color: green;">추천 수: <%=vo.getRecommend()%></span> 
						<span style="color: gray;"><%=vo.getDate()%></span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<p class="card-content"><%=vo.getContent()%></p>
				<div class="col-12 text-right">
					<%
						if (id.equals(vo.getId())) {
					%>
					<a class="btn btn-warning" onclick="return confirm('삭제하시겠습니까?')"
						href="deleteAction.jsp?id=<%=id%>&no=<%=vo.getNo()%>">삭제</a>
					<%
						} else {
					%>
					<a class="btn btn-primary"  id="savebtn" onclick="return confirm('추천하시겠습니까?')"
						href="recommendAction.jsp?id=<%=id%>&no=<%=vo.getNo()%>">추천 </a> <a
						class="btn btn-danger" id="savebtn" onclick="return confirm('신고하시겠습니까?')"
						href="reportAction.jsp?id=<%=id%>&no=<%=vo.getNo()%>">신고 </a>
						
					<% }%>
					
					
					
				</div>
			</div>
		</div>
		<%
			}
		}
		%>
		<%
			if (id == null) {
			for (CommentVO vo : plist) {
		%>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left">

						<small style="border-right: 5px solid black;"><%=vo.getArtist()%></small>&nbsp;<%=vo.getId()%>
					</div>
					<div class="col-4 text-right">
						<span style="color: green;">추천 수 : <%=vo.getRecommend()%></span> <span
							style="color: gray;"><%=vo.getDate()%></span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<p class="card-content"><%=vo.getContent()%></p>
			</div>
		</div>
		<%
			}
		}
		%>

		<div class="card bg-light mt-3">
			<div class="card-footer bg-light">
				<div class="row">
					<div class="col-12 text-center">
						<%
						
							for (int i = 1; i <= lastPage; i++) {
						%>
						<a href="artist_list.jsp?pageNumber=<%=i%>" class="pageNumber"><%=i%></a>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
		</section>
	</div>



</body>

</html>