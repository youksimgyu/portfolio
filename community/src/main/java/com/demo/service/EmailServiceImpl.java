package com.demo.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.demo.dto.EmailDTO;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public void sendMail(EmailDTO dto, String message) {
		// TODO Auto-generated method stub
		// 메일구성정보를 담당하는 객체(받는사람, 보내는사람, 전자우편주소, 본문내용)
		MimeMessage msg = mailSender.createMimeMessage();
		
		try {
			// 받는사람 메일주소. 회원이 입력한 메일주소
			msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
			
			// 보내는사람(메일, 이름)
			msg.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(), dto.getSenderName())});
			
			// 메일제목
			msg.setSubject(dto.getSubject(), "utf-8");
			
			// 본문내용
			msg.setText(message, "utf-8");
			
			mailSender.send(msg); // g-mail 보안설정을 낮게 해야 한다
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

}
