package com.fsp.utilities.classes;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashedPassword {

	public static String securePassword(String password) {

		StringBuffer sb = null;
		try {

			MessageDigest md  = MessageDigest.getInstance("MD5");
			md.update(password.getBytes());

			byte byteData[] = md.digest();

			//convert the byte to hex format method 1
			 sb = new StringBuffer();

			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
		}
		catch (NoSuchAlgorithmException e) {
			System.out.println("NoSuchAlgorithmException in HashedPassword class");
		}
		return(sb.toString());
	}
}