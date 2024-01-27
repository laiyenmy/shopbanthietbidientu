package util;

import java.security.MessageDigest;

import org.apache.tomcat.util.codec.binary.Base64;

public class EncryptPassword {
	
	public static String toSHA1(String str) {
		String result = null;
		try {
			byte[] dataBytes = str.getBytes("UTF-8");
			MessageDigest m = MessageDigest.getInstance("SHA-1");
			result = Base64.encodeBase64String(m.digest(dataBytes));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
