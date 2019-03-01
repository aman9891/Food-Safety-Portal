package com.fsp.utilities.classes;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.fsp.utilities.interfaces.EmailParameters;

public class EmailMainLogic implements EmailParameters {

	public static void sendEmail(String emailReceiver, String emailSubject, String  emailContent) {

		try {
			
			//Get the session object
			Properties props = new Properties();

			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator()
			{
				protected PasswordAuthentication getPasswordAuthentication()
				{
					return new PasswordAuthentication(my_email_id, my_email_password);
				}
			});

			//compose message
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(my_email_id, "Food Safety Portal"));				/* For displaying name in mailbox */
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailReceiver));
			message.setSubject(emailSubject);
			message.setContent(emailContent, "text/html");

			//send message
			Transport.send(message);
		}
		catch (MessagingException e) {
			System.out.println("MessagingException in EmailMainLogic class.");
			e.printStackTrace();
		}
		catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException in EmailMainLogic class");
			e.printStackTrace();
		}
	}
}