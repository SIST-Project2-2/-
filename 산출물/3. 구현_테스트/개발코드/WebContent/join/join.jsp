<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	$(document).ready(function() {
		bsCustomFileInput.init();

		//아이디 버튼 클릭 시
		$("#idBtn").click(function() {
			var id = $("#id");
			if (id.val() == "") {
				$("#id").addClass("is-invalid");

				return false;
			} else {
				$(".idHide").hide();
				$(".passHide").css("display", "block");
			}
		});

		//아이디  기입 값 변경 시
		$("#id").change(function() {
			var id = $("#id");
			if (id.val().length > 1)
				$("#id").removeClass("is-invalid");
		});

		//패스워드 기입창 버튼 클릭 시
		$("#passBtn").click(function() {
			var pass = $("#pw");
			var cpass = $("#cpass");

			if (pass.val() == "" || cpass.val() == "") {
				$("#pw").addClass("is-invalid");

				return false;
			} else {
				$(".passHide").hide();
				$(".nickNameHide").css("display", "block");
			}
		});

		//패스워드 기입 값 변화 시
		$("#pw").change(function() {
			var pw = $("#pw");
			if (pw.val().length > 1)
				$("#pw").removeClass("is-invalid");
		});

		//닉네임 기입 창 버튼 클릭 시
		$("#nickBtn").click(function() {
			var nickName = $("#nickName");
			if (nickName.val() == "") {
				$("#nickName").addClass("is-invalid");

				return false;
			} else {
				$(".nickNameHide").hide();
				$(".nameHide").css("display", "block");
			}
		});

		//닉네임 기입 값 변화 시
		$("#nickName").change(function() {
			var nickName = $("#nickName");
			if (nickName.val().length > 1)
				$("#nickName").removeClass("is-invalid");
		});

		//이름 기입 창 버튼 클릭 시
		$("#nameBtn").click(function() {
			var lastName = $("#lastName");
			var firstName = $("#firstName");
			var addr = $("#addr");

			if (lastName.val() == "" || firstName.val() == "") {
				$("#lastName").addClass("is-invalid");
				return false;
			} else if (addr.val() == "") {
				$("#addr").addClass("is-invalid");
				return false;
			} else {
				$(".nameHide").hide();
				$(".hpHide").css("display", "block");
			}

		});

		//핸드폰 번호 기입 창 버튼 클릭 시
		$("#hpBtn").click(function() {
			var hp1 = $("#hp1");
			var hp2 = $("#hp2");
			var hp3 = $("#hp3");
			if (hp1.val() == "" || hp2.val() == "" || hp3.val() == "") {
				$("#hp1").addClass("is-invalid");
				return false;
			} else {
				$(".hpHide").hide();
				$(".birthHide").css("display", "block");
			}
		});

		//생년월일 기입 창 버튼 클릭 시
		$("#birthBtn").click(function() {

			var date = $("#birth_date");
			var gender = $("#gender");
			if (date.val() == null) {
				$("#birth_date").addClass("is-invalid");
				return false;
			} else if (check_count("gender") == 0) {
				$("#birth_date").addClass("is-invalid");
				return false;
			} else {
				$(".birthHide").hide();
				$(".emailHide").css("display", "block");
			}
		});

		//생년월일 값 변경 시
		$("#birth_date").change(function() {
			var date = $("#birth_date");
			if (date.val().length != null)
				$("#birth_date").removeClass("is-invalid");
		});

		//이메일 기입 창 버튼 클릭 시
		$("#emailBtn").click(function() {

			var email = $("#email");
			var img = $("#img");
			if (email.val() == "") {
				$("#email").addClass("is-invalid");
				return false;
			} else if(img.val()==""){
				$("#img").addClass("is-invalid");
				return false;
			}else{
				$(".emailHide").hide();
				alert("회원가입이 완료되었습니다.");
			}
		});

		// input 창에서 엔터키 막아놓음
		$('input[type="text"],input[type="radio"],input[type="password"]').keydown(function() {
			if (event.keyCode === 13) {
				event.preventDefault();
			}
			;
		});
		// 아이디 중복체크
		$("#id").change(function() {
			if ($("#id").val() == "") {
				return false;
			} else {
				$.ajax({
					url : "./joinIdCheckAction.jsp?id=" + $("#id").val(),
					success : function(result) {
						if (result == 1) {
							$("#idCheckResult").text("중복된 아이디가 존재합니다.").css({
								"color" : "red",
								"font-size" : "12px"
							});
							$("#idBtn").attr("disabled", true);
							return false;
						} else {
							$("#idCheckResult").text("사용 가능한 아이디 입니다.").css({
								"color" : "green",
								"font-size" : "12px"
							});
							$("#idBtn").attr("disabled", false);
							return true;
						}
					}
				})
			}
		})

		// 닉네임 중복체크
		$("#nickName").change(function() {
			if ($("#nickName").val() == "") {
				return false;
			} else {
				$.ajax({
					url : "./nickNameCheckAction.jsp?nickName=" + $("#nickName").val(),
					success : function(result) {
						if (result == 1) {
							$("#nickNameCheckResult").text("중복된 닉네임이 존재합니다.").css({
								"color" : "red",
								"font-size" : "12px"
							});
							$("#nickBtn").attr("disabled", true);
							return false;
						} else {
							$("#nickNameCheckResult").text("사용 가능한 닉네임 입니다.").css({
								"color" : "green",
								"font-size" : "12px"
							});
							$("#nickBtn").attr("disabled", false);
							return true;
						}
					}
				})
			}
		})

		// 회원가입 회원 이름 입력시 숫자, 특수문자 사용 못하게 막기
		var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
		var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
		$(document).ready(function() {
			$("#lastName,#firstName").on("focusout", function() {
				var x = $(this).val();
				if (x.length > 0) {
					if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {
						x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
					}
					$(this).val(x);
				}
			}).on("keyup", function() {
				$(this).val($(this).val().replace(replaceChar, ""));
			});
		});
	});
</script>
</head>
<body class="join">
	<jsp:include page="../header.jsp"></jsp:include>

	<form name="joinForm" action="userJoinAction.jsp" method="POST" enctype="multipart/form-data">

		<div class="idHide">
			<div class="joinID">
				<h1>가입하기</h1>
				<label for="file"></label>
				<progress id="file" value="15" max="100"> </progress>
				<div>로그인에 사용할 아이디를 입력해주세요</div>

				<input type="text" name="id" id="id" class="form-control" placeholder="아이디 입력" required>
				<div id="idCheckResult"></div>
				<div class="invalid-feedback">아이디를 입력해주세요</div>
				<div class="valid-feedback">아이디가 정상적으로 입력되었습니다.</div>
				<button type="submit" id="idBtn">다음</button>
			</div>
		</div>


		<div class="passHide" style="display: none;">
			<div class="joinID">
				<h1>가입하기</h1>
				<label for="file"></label>
				<progress id="file" value="30" max="100"></progress>
				<div>로그인에 사용할 비밀번호를 입력해주세요</div>
				<input type="password" name="pw" id="pw" placeholder="비밀번호 입력" required onblur="passCheck()">
				<input type="password" name="cpass" id="cpass" onblur="passCheck()" placeholder="비밀번호 확인" required>
				<div id="msg"></div>
				<div class="invalid-feedback">비밀번호를 입력해주세요</div>
				<button type="submit" id="passBtn">다음</button>
			</div>
		</div>


		<div class="nickNameHide" style="display: none;">
			<div class="joinID">
				<h1>가입하기</h1>
				<label for="file"></label>
				<progress id="file" value="45" max="100"> </progress>
				<div>사용할 닉네임 입력해주세요</div>
				<input type="text" name="nickName" id="nickName" class="form-control" placeholder="닉네임 입력" required>
				<div id="nickNameCheckResult"></div>
				<div class="invalid-feedback">닉네임을 입력해주세요</div>
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
					<input type="text" name="lastName" id="lastName" required placeholder="성 입력">
					<input type="text" name="firstName" id="firstName" required placeholder="이름입력">
					<input type="text" name="addr" id="addr" required placeholder="주소입력" readonly>
					<input type="text" name="daddr" id="daddr" required placeholder="상세주소입력" readonly>
					<button type="button" class="btn btn-secondary" style="width: 30%; display: inline;" onClick="goPopup();">주소검색</button>
					<div class="invalid-feedback">이름과 주소를 입력해주세요</div>
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
					<input type="text" name="hp1" id="hp1" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="번호입력" required>
					-
					<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="hp2" id="hp2" maxlength="4" required>
					-
					<input oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" name="hp3" id="hp3" maxlength="4" required>
					<div class="invalid-feedback">휴대폰 번호를 입력해주세요</div>
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
				<input type="date" name="birth_date" required id="birth_date" min="1900-01-01" max="2021-12-31">
				<label style="margin-left: 16rem;">남자</label>
				<input type="radio" name="gender" value="M" id="gender">
				<label style="margin-left: 16rem;">여자</label>
				<input type="radio" name="gender" value="F" id="gender">
				<div class="invalid-feedback" style="margin-top: 60px;">정확한 생년월일을 기입하거나 성별을 체크해주세요</div>
				<button type="submit" id="birthBtn">다음</button>
			</div>
		</div>



		<div class="emailHide" style="display: none;">
			<div class="joinID">
				<h1>가입하기</h1>
				<label for="file"></label>
				<progress id="file" value="100" max="100"></progress>
				<div>프로필 사진과 이메일을 입력해주세요</div>
				<div class="custom-file my-3" style="width: 94%;">
					<input type="file" class="custom-file-input" id="img" name="img" required>
					<label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02"></label>
				</div>
				<input type="email" name="email" id="email" placeholder="이메일 입력(abcdefg@naver.com)" required>
				<div id="msg">회원가입 후 이메일 인증을 해주셔야 합니다.</div>
				<div class="invalid-feedback">프로필 사진과 이메일을 입력해주세요</div>
				<button type="submit" id="emailBtn">다음</button>
			</div>
		</div>

	</form>
</body>
</html>