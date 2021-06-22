<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.CommentDAO,vo.CommentVO"%>
<%@page import="java.util.ArrayList"%>

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

ArrayList<CommentVO> plist = dao.getListPage(indexNumber, endNumber);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="artist_list.css" type="text/css">

<title>아티스트 목록</title>
</head>

<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<div id="carouselSlider" class="carousel slide">

		<ol class="carousel-indicators">
			<li data-target="#carouselSlider" data-slide-to="0" class="active"></li>
			<li data-target="#carouselSlider" data-slide-to="1"></li>
			<li data-target="#carouselSlider" data-slide-to="2"></li>
			<li data-target="#carouselSlider" data-slide-to="3"></li>
			<li data-target="#carouselSlider" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<!--아이유 캐러셀-->
			<div class="carousel-item active">
				<div class="carousel-caption">
					<div class="article">
						<img src="../images/아이유.jpg" class="h-20">

						<hr>
						<div class="third">
							<audio controls="controls" class="audio">
								<source src="../song/아이유노래1.mp3" type="audio/mpeg" />
							</audio>
							<hr>
							<div class="ui-bg-cover ui-bg-overlay-container text-white">
								<div class="ui-bg-overlay bg-dark opacity-50"></div>
								<div class="container">
									<div
										class="d-flex justify-content-between align-items-center pt-4">


									</div>
								</div>

								<div class="container">
									<div class="text-center py-5">

										<img src="../images/장범준.jpg" alt=""
											class="ui-w-100 rounded-circle">

										<div class="col-md-8 col-lg-6 col-xl-5 p-0 mx-auto">
											<h4 class="font-weight-bold my-4">John Doe</h4>

											<div class="opacity-75 mb-4">Lorem ipsum dolor sit
												amet, nibh suavitate qualisque ut nam. Ad harum primis
												electram duo, porro principes ei has.</div>
										</div>

									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!--장범준 캐러셀-->
			<div class="carousel-item">

				<div class="carousel-caption">

					<div class="article">

						<img src="../images/장범준.jpg" class="h-80">

						<hr>
						<div class="third">
							<audio controls="controls">
								<source src="../song/장범준노래1.mp3" type="audio/mpeg" />
							</audio>
							<hr>
							<div class="ui-bg-cover ui-bg-overlay-container text-white">
								<div class="ui-bg-overlay bg-dark opacity-50"></div>
								<div class="container">
									<div
										class="d-flex justify-content-between align-items-center pt-4">


									</div>
								</div>

								<div class="container">
									<div class="text-center py-5">

										<img src="../images/장범준.jpg" alt=""
											class="ui-w-100 rounded-circle">

										<div class="col-md-8 col-lg-6 col-xl-5 p-0 mx-auto">
											<h4 class="font-weight-bold my-4">John Doe</h4>

											<div class="opacity-75 mb-4">Lorem ipsum dolor sit
												amet, nibh suavitate qualisque ut nam. Ad harum primis
												electram duo, porro principes ei has.</div>
										</div>

									</div>
								</div>

							</div>

						</div>
					</div>

				</div>
			</div>
			<!--잔나비 캐러셀-->
			<div class="carousel-item">

				<div class="carousel-caption">

					<div class="article">
						<img src="../images/잔나비.jpg" class="h-80">

						<hr>
						<div class="third">
							<audio controls="controls">
								<source src="../song/잔나비노래1.mp3" type="audio/mpeg" />
							</audio>
							<hr>
							<div class="ui-bg-cover ui-bg-overlay-container text-white">
								<div class="ui-bg-overlay bg-dark opacity-50"></div>
								<div class="container">
									<div
										class="d-flex justify-content-between align-items-center pt-4">


									</div>
								</div>

								<div class="container">
									<div class="text-center py-5">

										<img src="../images/장범준.jpg" alt=""
											class="ui-w-100 rounded-circle">

										<div class="col-md-8 col-lg-6 col-xl-5 p-0 mx-auto">
											<h4 class="font-weight-bold my-4">John Doe</h4>

											<div class="opacity-75 mb-4">Lorem ipsum dolor sit
												amet, nibh suavitate qualisque ut nam. Ad harum primis
												electram duo, porro principes ei has.</div>
										</div>

									</div>
								</div>

							</div>
						</div>
					</div>

				</div>
			</div>
			<!--현아 캐러셀-->
			<div class="carousel-item">
				<div class="carousel-caption">

					<div class="article">
						<img src="../images/현아.jpg" class="h-80">

						<hr>
						<div class="third">
							<audio controls="controls">

								<source src="../song/현아노래1.mp3" type="audio/mpeg" />
							</audio>
							<hr>
							<div class="ui-bg-cover ui-bg-overlay-container text-white">
								<div class="ui-bg-overlay bg-dark opacity-50"></div>
								<div class="container">
									<div
										class="d-flex justify-content-between align-items-center pt-4">


									</div>
								</div>

								<div class="container">
									<div class="text-center py-5">

										<img src="../images/장범준.jpg" alt=""
											class="ui-w-100 rounded-circle">

										<div class="col-md-8 col-lg-6 col-xl-5 p-0 mx-auto">
											<h4 class="font-weight-bold my-4">John Doe</h4>

											<div class="opacity-75 mb-4">Lorem ipsum dolor sit
												amet, nibh suavitate qualisque ut nam. Ad harum primis
												electram duo, porro principes ei has.</div>
										</div>

									</div>
								</div>

							</div>
						</div>
					</div>


				</div>
			</div>
			<!--십센치 캐러셀-->
			<div class="carousel-item">
				<div class="carousel-caption">

					<div class="article">
						<img src="../images/십센치.png" class="h-50" id="cm">

						<hr>
						<div class="third">
							<audio controls="controls">

								<source src="../song/십센치노래1.mp3" type="audio/mpeg" />
							</audio>
							<hr>
								<div class="ui-bg-cover ui-bg-overlay-container text-white">
								<div class="ui-bg-overlay bg-dark opacity-50"></div>
								<div class="container">
									<div
										class="d-flex justify-content-between align-items-center pt-4">


									</div>
								</div>

								<div class="container">
									<div class="text-center py-5">

										<img src="../images/장범준.jpg" alt=""
											class="ui-w-100 rounded-circle">

										<div class="col-md-8 col-lg-6 col-xl-5 p-0 mx-auto">
											<h4 class="font-weight-bold my-4">John Doe</h4>

											<div class="opacity-75 mb-4">Lorem ipsum dolor sit
												amet, nibh suavitate qualisque ut nam. Ad harum primis
												electram duo, porro principes ei has.</div>
										</div>

									</div>
								</div>

							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
		<!--캐러셀 prev/ next 버튼 -->
		<a class="carousel-control-prev" href="#carouselSlider" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"></span>
			<span>Previous</span>
		</a> <a class="carousel-control-next " href="#carouselSlider"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon"></span> <span>Next</span>
		</a>
	</div>

	<!--댓글-->

	<div class="comment">
		<form method="get" action="./sendReplyAction.jsp?id=<%=id%>"
			class="form-inline mt-3">
			<input type="hidden" name="id" value=<%=id%>>
			<section class="container">
				<select name="artistDivide" class="form-control mx-1 mt-2">
					<option value="공통">공통</option>
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
						<span style="color: green;"><%=vo.getRecommend()%></span> <span
							style="color: gray;"><%=vo.getDate()%></span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<p class="card-content"><%=vo.getContent()%></p>
				<div class="col-12 text-right">
					<%
						if (id.equals(vo.getId())) {
					%>
					<a onclick="return confirm('삭제하시겠습니까?')"
						href="deleteAction.jsp?id=<%=id%>&no=<%=vo.getNo()%>">삭제</a>
					<%
						} else {
					%>
					<a onclick="return confirm('추천하시겠습니까?')" href="recommendAction.jsp?id=<%=id%>&no=<%=vo.getNo()%>">추천</a>
					<%
						}
					%>
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
						<span style="color: green;"><%=vo.getRecommend()%></span> <span
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
						<a href="artist_list.jsp?pageNumber=<%=i%>"><%=i%></a>
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