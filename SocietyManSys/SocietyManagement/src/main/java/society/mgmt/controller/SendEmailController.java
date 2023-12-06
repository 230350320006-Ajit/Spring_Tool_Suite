package society.mgmt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import society.mgmt.entities.AllotmentDetails;
import society.mgmt.repository.AllotmentDetailsRepository;
import society.mgmt.service.AllotmentDetailsService;

@Controller
public class SendEmailController {

	@Autowired
	AllotmentDetailsService aservice;
	@Autowired
	society.mgmt.service.EmailSenderService service;
	
	
	@GetMapping("/sendmail")
	public String triggerMail(@RequestParam("email") String email, Model model) {
		
		service.sendSimpleEmail(email);
		List<AllotmentDetails> alist = aservice.getAllAllotments();
		for(AllotmentDetails ad : alist)
			System.out.print("inside send obj: "+ ad);
		model.addAttribute("lists", alist);
		return "viewmember.jsp";	
	}
}
