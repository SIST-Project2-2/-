package email;

import java.security.MessageDigest;

//이메일 값(input)에 해시값을적용해서 인증 코드를 사용하여 링크를 타고 들어와서 인증할 수 있도록 하는 기능
public class SHA256 {
	public static String getSHA256(String input) {
		StringBuffer result = new StringBuffer();
		try {
			//사용자가 입력한 값을 sha-256 해시 값으로 전환할 수 있게 함
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			//해시 함수로 전환할때 문자열을 덧 붙인다.
			byte[] salt = "Concert Project Fighting!".getBytes();
			//해시값 인스턴스를 초기화
			digest.reset();
			
			digest.update(salt);
			//해시를 적용한 값을 char 변수에다가 감아준다.
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			//문자열 형태로 변환
			for(int i=0;i<chars.length;i++) {
				//16진수 & 현재 해쉬 값 해당 인덱스 길이가 한자리수 일경우 0을 붙여서 두자리 형태의 16진수로 만든다.
				String hex = Integer.toHexString(0xff & chars[i]);
				if(hex.length()==1) result.append("0");
				//헥사값을 붙여준다.
				result.append(hex);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result.toString();
	}
}
