<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 메일 보내기 위한 라이브러리 -->
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="dao.MemberDAO"%>
<!-- 메일 보내는 사용자 속성 정의 라이브러리  -->
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="email.SHA256"%>
<%@ page import="email.Gmail"%>

<!-- 
	//참고 : https://shxrecord.tistory.com/118
	//참고  : http://www.gisdeveloper.co.kr/?p=6916
	
	이메일 보내기를 하기 위해서는
	https://myaccount.google.com/security?pmr=1
	여기로 가서 보안수준이 낮은 앱의 액세스를 사용으로 바꿔야한다.
 -->

<%
request.setCharacterEncoding("UTF-8");
	
MemberDAO dao = new MemberDAO();

String id = request.getParameter("id");

//사용자가 로그인 한 상태면 세션 유지
if(session.getAttribute("id")!=null){
	id = (String) session.getAttribute("id");
}

//사용자가 로그인 하지 않은 상태
if(id==null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인 해주세요 ');");
	script.println("location.href='/concert/login/login.jsp'");
	script.println("</script>");
	script.close();
	return;
}




//사용자가 이메일 인증이 되었는지 check
int emailChecked = dao.emailCheck(id);
//이메일 인증이 된 회원이면 index page로 이동
if(emailChecked == 1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이메일 인증이 완료된 회원입니다.');");
	script.println("location.href = '/concert/index.jsp'");
	script.println("</script>");
	script.close();
	return;
}

//보내는 host 주소
String host = "http://localhost:9000/concert/join/";
//보내는 관리자 이메일 계쩡
String from = "sayskpays@gmail.com";
String to = dao.memberEmail(id);
//보내는 이메일 제목
String subject = "콘서트 여행 사이트에 오신 것을 환영합니다";
//보내는 이메일 내용
String content = "다음 링크에 접속하여 이메일 인증을 진행해주세요"+
	"<a href='"+ host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) +"&id="+id+"'>이메일 인증하기</a>";
	
	//smtp 접속하기 위한 정보 생성 
	// SMTP : Simple Mail Transfer Protocol = googleemail 외부 smtp를 이용해 이메일을 보내준다.
	Properties p = new Properties();
	p.put("mail.smtp.user",from); //이메일을 보내는 관리자 이메일 계정
	p.put("mail.smtp.host","smtp.googlemail.com"); //이메일을 발송해줄 서버
	p.put("mail.smtp.port","465"); //이메일 전송 포드 번호 
	p.put("mail.smtp.starttls.enable","true"); //smtp 에 실린 정보를 tls(전송계층보안)을 이용해 암호화 할 것인지에 대한 여부
	p.put("mail.smtp.auth","true"); //smtp 서버의 인증을 허용
	p.put("mail.smtp.debug","true");
	p.put("mail.smtp.socketFactory.port","465");
	p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback","false");
	
	//이메일 보내기
	try{
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO,toAddr);
		msg.setContent(content,"text/html;charset=UTF8");
		Transport.send(msg);
	}catch(Exception e){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이메일전송 오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
<style type="text/css">
a:hover,a {
	text-decoration: none;
}

}
.clearfix:before, .clearfix:after {
	display: table;
	content: ' ';
}

.clearfix:after {
	clear: both;
}

body {
	background: #f0f0f0 !important;
}

.page-404 .outer {
	position: absolute;
	top: 0;
	display: table;
	width: 100%;
	height: 100%;
}

.page-404 .outer .middle {
	display: table-cell;
	vertical-align: middle;
	
}

.page-404 .outer .middle .inner {
	width: 300px;
	margin-right: auto;
	margin-left: auto;

}

.page-404 .outer .middle .inner .inner-circle {
	height: 300px;
	border-radius: 100%;
	background-color: white;
	margin-top:40px;
	
	
}

.page-404 .outer .middle .inner .inner-circle:hover i {
	color: pink !important;
	background-color: #f5f5f5;
	box-shadow: 0 0 0 15px powderblue;
}

.page-404 .outer .middle .inner .inner-circle:hover span {
	color: powderblue;
}

.page-404 .outer .middle .inner .inner-circle i {
	font-size: 4em;
	line-height: 1em;
	float: right;
	width: 1.6em;
	height: 1.6em;
	margin-top: -.7em;
	margin-right: -.5em;
	padding: 20px;
	-webkit-transition: all .4s;
	transition: all .4s;
	text-align: center;
	color: #f5f5f5 !important;
	border-radius: 50%;
	background-color: powderblue;
	box-shadow: 0 0 0 15px #f0f0f0;
}

.page-404 .outer .middle .inner .inner-circle span {
	font-size: 7em;
	font-weight: 700;
	line-height: 1.2em;
	display: block;
	-webkit-transition: all .4s;
	transition: all .4s;
	text-align: center;
	color: gray;
	margin-left:10px;
}

.page-404 .outer .middle .inner .inner-status {
	font-size: 20px;
	display: block;
	margin-top: 20px;
	margin-bottom: 5px;
	text-align: center;
	color: #39bbdb;
}

.page-404 .outer .middle .inner .inner-detail {
	line-height: 1.4em;
	display: block;
	margin-bottom: 10px;
	text-align: center;
	color: gray;
}

.error {
	margin-right: 20px;
}
div.page-404 .outer .inner a#btn{
	display:block;
}
</style>
</head>
<body>
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
		rel="stylesheet">
	<div class="page-404">
		<div class="outer">
			<div class="middle">
				<div class="inner">
					<a href="#">
						<div class="inner-circle">
							<i class="fa fa-home"></i><span class="error">Email</span>
						</div>
					</a> <span class="inner-status">이메일 인증</span> <span class="inner-detail">
						이메일 인증을 완료해 주세요
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
