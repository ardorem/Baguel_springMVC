package com.project.baguel;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class JDBCEncryptor {

	public static void main(String[] args) {
		StandardPBEStringEncryptor enc = new StandardPBEStringEncryptor();
		enc.setPassword("baguel");
		System.out.println(enc.encrypt("oracle.jdbc.driver.OracleDriver"));
		System.out.println(enc.encrypt("jdbc:oracle:thin:@localhost:1521:xe"));
		System.out.println(enc.encrypt("scott2")); // id
		System.out.println(enc.encrypt("tiger2")); // pw
	}

}
