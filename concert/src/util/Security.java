package util;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;

public class Security {

	public static String getSalt() {
		String result = null;
		try {
			byte[] bytes = new byte[32];
			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			random.nextBytes(bytes);
			result = new String(Base64.getEncoder().encode(bytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static String pwHashing(String pw, String salt) {
		String result = null;
		pw = pw + salt;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] bytes = digest.digest(pw.getBytes("UTF-8"));
			result = new String(Base64.getEncoder().encode(bytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static void main(String[] args) {
		String salt = getSalt();
		String pw = pwHashing("1234", salt);

		System.out.println(pw);
		System.out.print(salt);
	}
}
