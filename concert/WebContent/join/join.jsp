<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script defer src="join.js"></script>
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
	$(document)
			.ready(
					function() {

						$("#idBtn").click(function() {
							$(".idHide").hide();
							$(".passHide").css("display", "block");
						});
						$("#passBtn").click(function() {
							$(".passHide").hide();
							$(".nickNameHide").css("display", "block");
						});
						$("#nickBtn").click(function() {
							$(".nickNameHide").hide();
							$(".nameHide").css("display", "block");
						});

						$("#nameBtn").click(function() {
							$(".nameHide").hide();
							$(".hpHide").css("display", "block");
						});
						$("#hpBtn").click(function() {
							$(".hpHide").hide();
							$(".birthHide").css("display", "block");
						});
						$("#birthBtn").click(function() {
							$(".birthHide").hide();
							$(".emailHide").css("display", "block");
						});
						$("ebtn").click(function() {
							$(".emailHide").hide();
							alert("회원가입이 완료되었습니다.");
						});

						//input 창에서 엔터키 막아놓음
						$(
								'input[type="text"],input[type="radio"],input[type="password"]')
								.keydown(function() {
									if (event.keyCode === 13) {
										event.preventDefault();
									}
									;
								});

						$("#idCheck").click(
								function() {
									if ($("#id").val() == "") {
										alert("아이디를 입력해주세요");
										$("#id").focus();
										return false;
									} else {
										$.ajax({
											
											url : "./joinIdCheckAction.jsp?id="
													+ $("#id").val(),
											success : function(result) {
												if (result == 1) {

													$("#idCheckResult").text(
															"중복된 아이디가 존재합니다.");
													$("#idCheckResult")
															.focus();
													return false;
												} else {
													$("#idCheckResult").text(
															"사용가능한 아이디 입니다.");
													$("#idCheckResult")
															.focus();
													return true;
												}
											}

										})//ajax

									}//else
								})

					});
</script>
<link rel="stylesheet" href="join.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<form name="joinForm" action="./userJoinAction.jsp" method="POST">

		<div class="idHide">
			<div class="joinID">
				<h1>가입하기</h1>
				<label for="file"></label>
				<progress id="file" value="15" max="100"> </progress>
				<div>로그인에 사용할 아이디를 입력해주세요</div>
				<input type="text" name="id" id="id" class="form-control"
					placeholder="아이디 입력" required>
				<button type="button" class="btn btn-secondary" id="idCheck"
					style="width: 30%; margin-left: 180px;">중복체크</button>
				<div id="idCheckResult"></div>
				<button type="submit" id="idBtn">다음</button>
			</div>
		</div>


		<div class="passHide" style="display: none;">
			<div class="joinID">
				<h1>가입하기</h1>
				<label for="file"></label>
				<progress id="file" value="30" max="100"></progress>
				<div>로그인에 사용할 비밀번호를 입력해주세요</div>
				<input type="password" name="pw" id="pw" placeholder="비밀번호 입력"
					required> <input type="password" name="cpass" id="cpass"
					onblur="passCheck()" placeholder="비밀번호 확인" required>
				<div id="msg"></div>
				<button type="submit" id="passBtn">다음</button>
			</div>
		</div>

		<div class="nickNameHide" style="display: none;">
			<div class="joinID">
				<h1>가입하기</h1>
				<label for="file"></label>
				<progress id="file" value="45" max="100"> </progress>
				<div>사용할 닉네임 입력해주세요</div>
				<input type="text" name="nickName" id="nickName"
					class="form-control" placeholder="닉네임 입력" required>
				<button type="submit" id="nickBtn">다음</button>
			</div>
		</div>

		<div class="nameHide" style="display: none;">
			<div class="joinID">
				<h1>가입하기</h1>
				<label for="file"></label>
				<progress id="file" value="60" max="100"> 60% </progress>
				<div>
					<div>이름과 주소를 입력해주세요</div>
					<input type="text" name="lastName" id="lastName" required
						placeholder="성 입력"> <input type="text" name="firstName"
						id="firstName" required placeholder="이름입력"> <input
						type="text" name="addr" id="addr" required placeholder="주소입력">
					<input type="text" name="daddr" id="daddr" required
						placeholder="상세주소입력">
				</div>
				<button type="submit" id="nameBtn">다음</button>
			</div>
		</div>


		<div class="hpHide" style="display: none;">
			<div class="joinID">
				<h1>가입하기</h1>
				<label for="file"></label>
				<progress id="file" value="75" max="100"> 80% </progress>
				<div>휴대폰번호를 입력해주세요</div>
				<div class="hp">
					<input type="text" name="hp1" id="hp1" maxlength="3"
						placeholder="번호입력" required>- <input type="text"
						name="hp2" id="hp2" maxlength="4" required>- <input
						type="text" name="hp3" id="hp3" maxlength="4" required>
				</div>
				<button type="submit" id="hpBtn">다음</button>
			</div>
		</div>


		<div class="birthHide" style="display: none;">
			<div class="joinID">
				<h1>가입하기</h1>
				<label for="file"></label>
				<progress id="file" value="90" max="100"> 90% </progress>
				<div>생년월일과 성별을 선택해주세요</div>
				<input type="text" name="birth_date" placeholder="생년월일 입력(YYYYMMDD)"
					required> <label style="margin-left: 16rem;">남자</label><input
					type="radio" name="gender" value="M"> <label
					style="margin-left: 16rem;">여자</label><input type="radio"
					name="gender" value="F">
				<button type="submit" id="birthBtn">다음</button>
			</div>
		</div>

		<div class="emailHide" style="display: none;">
			<div class="joinID">
				<h1>가입하기</h1>
				<label for="file"></label>
				<progress id="file" value="100" max="100"></progress>
				<div>사용할 이메일을 입력해주세요</div>
				<input type="email" name="email" id="email"
					placeholder="이메일 입력(abcdefg@naver.com)" required>
				<div id="msg">회원가입 후 이메일 인증을 해주셔야 합니다.</div>
				<button type="submit" id="emailBtn">다음</button>
			</div>
		</div>





		<!--   <div class="profileHide" style="display:none;">
    <div class="joinID">
        <h1>가입하기</h1>
        <label for="file"></label>
        <progress id="profile" value="100" max="100"> 100% </progress>
        <div>프로필 사진을 등록해주세요</div>
         <input type="file" name="profile" id="profile">
         <button type="submit" onclick="home()">다음</button>
    </div>
</div>  -->

	</form>
</body>
</html>