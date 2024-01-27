package com.ayo;

import java.util.*;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;


public class SendMail {

	public void send(String toEmail, String otp, String fname)
	{
		
		final String fromEmail = "adityaudata@gmail.com"; 
		final String password = "pxdpqemdjlcmfruw";
//		final String toEmail = "adityaudata17092001@gmail.com";

		System.out.println("TLSEmail Start");
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", "587"); 
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true"); 

		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};
		Session session = Session.getInstance(props, auth);
		System.out.println(toEmail+", "+otp);
		MailUtil.sendEmail(session, toEmail, "OTP", "Hello Mr."+fname+" Your OTP is "+otp);
	}

}