package querysystem.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.gmail.Gmail;
import com.google.api.services.gmail.model.Message;


import querysystem.service.GmailService;

@Service
public class GmailServiceImpl implements GmailService{

	private static final String APPLICATION_NAME = "Your App Name";
    private static final GsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();
    private static final List<String> SCOPES = Collections.singletonList("https://www.googleapis.com/auth/gmail.send");
    
	
	public Gmail getGmailService() throws Exception{
		GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(
                JSON_FACTORY, new InputStreamReader(getClass().getResourceAsStream("/credentials.json")));
        
        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                GoogleNetHttpTransport.newTrustedTransport(), JSON_FACTORY, clientSecrets, SCOPES)
                .setAccessType("offline")
                .setDataStoreFactory(new FileDataStoreFactory(new File("tokens")))
                .build();
        
        Credential credential = new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");
        return new Gmail.Builder(GoogleNetHttpTransport.newTrustedTransport(), JSON_FACTORY, credential)
                .setApplicationName(APPLICATION_NAME)
                .build();
	}

	@Override
	public void sendEmail(String recipient, String subject, String bodyText, Integer code) throws Exception{
		 Gmail service = getGmailService();
	     MimeMessage email = createEmail(recipient, subject, bodyText, code);
	     sendMessage(service, "me", email);
		
	}

	@Override
	public MimeMessage createEmail(String to, String subject, String bodyText, Integer code) throws MessagingException {
		Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);

        MimeMessage email = new MimeMessage(session);
        //email.setFrom(new InternetAddress(from));
        email.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(to));
        email.setSubject(subject);
        // 取得當前日期與時間
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = now.format(formatter);
        
        
        // 將日期與時間加入信件內容
        String fullBodyText = bodyText +String.valueOf(code)+ "\n\nSent on: " + formattedDateTime;
        email.setText(fullBodyText);
        return email;
	}

	
	public void sendMessage(Gmail service, String userId, MimeMessage email) throws MessagingException, IOException{
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        email.writeTo(buffer);
        String encodedEmail = Base64.getUrlEncoder().encodeToString(buffer.toByteArray());
        Message message = new Message();
        message.setRaw(encodedEmail);
        service.users().messages().send(userId, message).execute();		
	}

	@Override
	public void clearStoredTokens() throws Exception{
		Path tokensPath = Paths.get("tokens");
        if (Files.exists(tokensPath)) {
            Files.walk(tokensPath)
                    .map(Path::toFile)
                    .forEach(File::delete);
        }
		
	}
}
