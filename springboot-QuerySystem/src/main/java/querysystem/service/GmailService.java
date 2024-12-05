package querysystem.service;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import com.google.api.services.gmail.Gmail;

public interface GmailService {
	
	public Gmail getGmailService() throws Exception;
	
	public void sendEmail(String recipient, String subject, String bodyText, Integer code) throws Exception;
	
	public MimeMessage createEmail(String to, String subject, String bodyText, Integer code) throws MessagingException;
	
	public void sendMessage(Gmail service, String userId, MimeMessage email) throws MessagingException, IOException;
	
	public void clearStoredTokens() throws Exception;
}
