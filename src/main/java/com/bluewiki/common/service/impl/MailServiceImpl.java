package com.bluewiki.common.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.bluewiki.common.service.MailService;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
    JavaMailSender javaMailSender;
	
	/**
	 * send auth mail
	 * @param 
	 * @return
	 */
	public String sendAuthMail(String userEmail) throws MailException{
		
		// 인증 난수 생성
		String allowed = "0123456789";
		int length = 6;
		
		Random random = new Random();
	    StringBuilder sb = new StringBuilder(length);
	    for (int i = 0; i < length; i++) {
	      sb.append(allowed.charAt(random.nextInt(allowed.length())));
	    }
	    
	    String verifyNum = sb.toString();

	    MimeMessage mimeMessage = javaMailSender.createMimeMessage();
	    MimeMessageHelper helper;
	    InternetAddress from;
	    
	    try {
	    	helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	    	from = new InternetAddress("bori77bluemix@gmail.com", "Bluetips", "UTF-8");
	    	
	    	String htmlMsg = "<h3>IBMer의 공간 블루팁스</h3><br/>"
	    				   + "<p>인증번호 : " + verifyNum + "</p>"
	    				   + "<p>인증번호를 화면에 입력해주세요!</p>";
			mimeMessage.setContent(htmlMsg, "text/html; charset=UTF-8");
			
			helper.setTo(userEmail);
		    helper.setFrom(from);
		    helper.setSubject("[블루팁스] 회원가입 인증메일 입니다.");
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    
	    javaMailSender.send(mimeMessage);
        
        return verifyNum;
	}
}
