<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.post-list {
	position: relative;
	padding: 5px 0;
}

.post-list .picture {
	max-width: 400px;
	overflow: hidden;
	height: auto;
	border-radius: 6px;
}

.post-list .label {
	font-weight: normal;
}

.post-list .picture {
	max-width: 210px;
}

.post-list .picture img {
	width: 100%;
}

.post-list h4 {
	font-size: 20px;
}

.post-list h5 {
	color: #888;
}

.post-list p {
	float: left;
}

.post-list:after {
	height: 1px;
	width: 83%;
	bottom: 0;
	right: 0;
	content: "";
	display: block;
	position: absolute;
}
</style>
</head>
<body>
	<div class="container bootstrap snippets bootdey">
		<h1 class="font-weight-bold text-left">아티스트 목록</h1>
		<div class="row">
			<div class="post-list">
				<!-- 아티스트 추가 버튼  -->
				<div class="ro">
					<div class="col-sm-12">
						<a class="btn btn btn-primary" href="http://localhost:9000/concert/admin/artist/admin_artist_add.jsp">아티스트 추가</a>
					</div>
				</div>
			</div>

			<!--  장범준  -->
			<div class="post-list">
				<div class="row">
					<div class="col-sm-2">
						<div class="picture">
							<img alt="장범준" src="../../images/장범준.jpg">
						</div>
					</div>
					<div class="col-sm-6">
						<h4>
							<label class="label label-info">장범준</label>
						</h4>

						<p class="description">대한민국의 가수, 싱어송라이터. 버스커 버스커의 리더이자, 보컬을 맡고 있다. 대부분 곡의 작사, 작곡을 담당한다. 대한민국 가요계 정상급 인기를 구가하는 싱어송라이터이다.</p>
					</div>
					<div class="col-sm-4">
						<a class="btn btn btn-secondary" href="http://localhost:9000/concert/admin/artist/admin_artist_edit.jsp">
							<i class="fa fa-share"></i> 수정
						</a>
						<a class="btn btn btn-danger" href="#">
							<i class="fa fa-share"></i> 삭제
						</a>
					</div>
				</div>
			</div>

			<!-- 아이유 -->
			<div class="post-list">
				<div class="row">
					<div class="col-sm-2">
						<div class="picture">
							<img alt="iu" src="../../images/아이유.jpg">
						</div>
					</div>
					<div class="col-sm-6">
						<h4>
							<label class="label label-info">아이유</label>
						</h4>

						<p class="description">대한민국의 멀티 엔터테이너. 본명은 이지은이며, 예명 아이유(IU)는 "음악으로 너와 내가 하나가 된다."라는 뜻을 가지고 있다. 16세인 2008년에 가수로 데뷔해 2010년 잔소리와 좋은 날의 연이은 히트
							이후로 2021년 현재까지 대한민국 대중음악계에서 최정상의 위치를 점하고 있는 여성 솔로 가수이다. 매력적인 음색과 시대를 선도해 나가는 작사 · 작곡 능력을 바탕으로 2010년대를 대표하는 대한민국 가수가 되었으며, 20대 중반의 어린 나이에 가요계에서
							독보적인 입지를 구축하였다. '뮤즈'라는 표현이 가장 잘 어울리는 가수.</p>
					</div>
					<div class="col-sm-4">
						<a class="btn btn btn-secondary" href="http://localhost:9000/concert/admin/artist/admin_artist_edit.jsp">
							<i class="fa fa-share"></i> 수정
						</a>
						<a class="btn btn btn-danger" href="#">
							<i class="fa fa-share"></i> 삭제
						</a>
					</div>
				</div>
			</div>


			<!-- 십센치  -->

			<div class="post-list">
				<div class="row">
					<div class="col-sm-2">
						<div class="picture">
							<img alt="10cm" src="../../images/십센치.png">
						</div>
					</div>
					<div class="col-sm-6">
						<h4>
							<label class="label label-info">10cm</label>
						</h4>

						<p class="description">원래는 윤철종(기타&코러스)과 2인조 밴드였으나, 2017년 7월 4일 윤철종이 탈퇴하여 권정열(보컬&젬베) 1인 밴드가 되었다. 권정열은 1983년 3월 1일생이며, 전 멤버 윤철종은 1982년 4월
							23일생이다. 키는 권정열 170cm, 윤철종 180cm. 그래서 밴드이름이 십센치라고 무한도전 서해안 고속도로 가요제 당시 밝힌 바 있다. 두 멤버의 키 차이가 10cm라서 밴드명이 그렇게 됐다는 믿거나말거나성 웃픈 고백. 하지만 실제론 8cm 정도
							차이난다고 말함.</p>
					</div>
					<div class="col-sm-4">
						<a class="btn btn btn-secondary" href="http://localhost:9000/concert/admin/artist/admin_artist_edit.jsp">
							<i class="fa fa-share"></i> 수정
						</a>
						<a class="btn btn btn-danger" href="#">
							<i class="fa fa-share"></i> 삭제
						</a>
					</div>
				</div>
			</div>

			<!-- 현아 -->
			<div class="post-list">
				<div class="row">
					<div class="col-sm-2">
						<div class="picture">
							<img alt="현아" src="../../images/현아.jpg">
						</div>
					</div>
					<div class="col-sm-6">
						<h4>
							<label class="label label-info">현아</label>
						</h4>

						<p class="description">대한민국의 솔로 여가수. 2007년 걸 그룹 원더걸스로 데뷔하여 동년 탈퇴 후 2009년 데뷔한 걸 그룹 포미닛으로 2016년까지 활동하였다. 2010년 로 솔로 데뷔 후 그룹 활동을 하면서 꾸준히 솔로로 앨범
							작업을 병행하였고, 소속사 동료들과 유닛 활동(트러블 메이커, 트리플 H)을 겸하기도 하였으며 그룹, 솔로, 유닛으로 모두 1위곡을 보유하고 있다.</p>
					</div>
					<div class="col-sm-4">
						<a class="btn btn btn-secondary" href="http://localhost:9000/concert/admin/artist/admin_artist_edit.jsp">
							<i class="fa fa-share"></i> 수정
						</a>
						<a class="btn btn btn-danger" href="#">
							<i class="fa fa-share"></i> 삭제
						</a>
					</div>
				</div>
			</div>


			<!-- 잔나비  -->
			<div class="post-list">
				<div class="row">
					<div class="col-sm-2">
						<div class="picture">
							<img alt="잔나비" src="../../images/잔나비.jpg">
						</div>
					</div>
					<div class="col-sm-6">
						<h4>
							<label class="label label-info">잔나비</label>
						</h4>

						<p class="description">
							작사, 작곡, 편곡(전곡 자작곡), 다양한 커버곡(가요, 팝) 등이 가능한 밴드다. 2012년 결성 당시에는 최정훈, 김도형, 유영현 셋이 밴드를 구성해 출발하였다. 2014년 디지털 싱글
							<로켓트>로 정식 데뷔를 하였으며, 2015년 초에 베이시스트 장경준과 드러머 윤결을 영입하고 2019년 5월에 키보디스트 유영현이 탈퇴하였다. 
						</p>
					</div>
					<div class="col-sm-4">
						<a class="btn btn btn-secondary" href="http://localhost:9000/concert/admin/artist/admin_artist_edit.jsp">
							<i class="fa fa-share"></i> 수정
						</a>
						<a class="btn btn btn-danger" href="#">
							<i class="fa fa-share"></i> 삭제
						</a>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>