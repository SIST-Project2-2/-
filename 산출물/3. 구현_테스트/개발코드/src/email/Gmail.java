package email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

//인증 수행 Authenticator 클래스
public class Gmail extends Authenticator{

	protected PasswordAuthentication getPasswordAuthentication() {
		//사용자에게 보낼 관리자 이메일 계정
		return new PasswordAuthentication(구글 이메일 아이디, 구글 이메일 비밀번호);
	}
	
}
