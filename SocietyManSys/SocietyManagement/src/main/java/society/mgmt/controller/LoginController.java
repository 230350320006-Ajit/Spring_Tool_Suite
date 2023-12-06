package society.mgmt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import society.mgmt.repository.AllotmentDetailsRepository;
import society.mgmt.service.AllotmentDetailsService;

@Controller
public class LoginController {

	@Autowired
	AllotmentDetailsService allotmentDetailsService;
	
	@GetMapping("/")
	public String loginpage() {
	return "index.jsp";	
	}
	
	
	@PostMapping("/resetpassword")
	public String resetPassword(@RequestParam String email,@RequestParam String pwd,Model model,HttpServletRequest request) {
		boolean flag = this.allotmentDetailsService.resetPassword(email, pwd);
		 HttpSession session= request.getSession();
		   session.invalidate();
		if(flag)
		{
			String msg="Reset Successfully";
			model.addAttribute("msg",msg);
			return "login.jsp";
		}
		String msg="Reset Failed";
		model.addAttribute("msg",msg);
		return "login.jsp";	
		}
	
	
	@PostMapping("/validate")
	public String ValidateMember(@RequestParam String email,@RequestParam String pwd,HttpServletRequest request) {
		System.out.print("inside controller");
		int flag = this.allotmentDetailsService.validate(email, pwd);
		if(flag==0) {
			return "login.jsp";
		}
		System.out.print("inside controller flag value :"+ flag);
		int flatNo= this.allotmentDetailsService.getAllotmentByEmail(email).getFlatNo();
		String name= this.allotmentDetailsService.getAllotmentByEmail(email).getName();
		System.out.print("flat no is :"+ flatNo);
		if(flag==1) {
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("email", email);
			httpsession.setAttribute("password", pwd);
			httpsession.setAttribute("role", "admin");
			return "redirect:/dashboard" ;
		}
	
		else if(flag==2) {
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("email", email);
			
			return "resetpassword.jsp";}
		
		else if(flag==3) {
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("email", email);
			httpsession.setAttribute("password", pwd);
			httpsession.setAttribute("flatNo", flatNo);
			httpsession.setAttribute("name", name);
			httpsession.setAttribute("role", "user");
			return "userprofile.jsp";}
		else
			return "login.jsp";
	}
}
