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
	script.println("location.href='login.jsp'");
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
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
	script.close();
	return;
}

//보내는 host 주소
String host = "http://localhost:9000/concert/login/";
//보내는 관리자 이메일 계쩡
String from = "sayskpays@gmail.com";
String to = dao.memberEmail(id);
//보내는 이메일 제목
String subject = "콘서트 여행 사이트에 오신 것을 환영합니다";
//보내는 이메일 내용
String content = "다음 링크에 접속하여 이메일 인증을 진행해주세요"+
	"<a href='"+ host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) +"'>이메일 인증하기</a>";
	
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
