package society.mgmt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import society.mgmt.entities.AllotmentDetails;
import society.mgmt.repository.AllotmentDetailsRepository;

@Service
public class EmailSenderService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	AllotmentDetailsService aservice;

	public void sendSimpleEmail(String toEmail)
	{
	   
		AllotmentDetails obj = aservice.getAllotmentByEmail(toEmail);

		String body="Hello, You're registered successfully your email is : "+toEmail+" and password is: "+ obj.getPassword();
		String subject="Registeration confirmation";
		
		SimpleMailMessage message = new SimpleMailMessage();

	    message.setFrom("spring.email.from@gmail.com");
	    message.setTo(toEmail);
	    message.setText(body);
	    message.setSubject(subject);

	    mailSender.send(message);
	    System.out.println("Mail Send...");
	
}}
