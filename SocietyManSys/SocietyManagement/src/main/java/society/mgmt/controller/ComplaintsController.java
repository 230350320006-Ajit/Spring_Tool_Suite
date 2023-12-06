package society.mgmt.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import society.mgmt.entities.Complaints;
import society.mgmt.service.ComplaintsService;

@Controller
public class ComplaintsController {

@Autowired
private ComplaintsService complaintService;	

@PostMapping("/addcomplaint")
public String addComplaint(@RequestParam("type") String type,@RequestParam("desc") String desc,@RequestParam("flatNo") String flatNoo) {
    int flatNo= Integer.parseUnsignedInt(flatNoo);
	Date date = new Date();
	String strDateFormat = "yyyy-MM-dd";
	DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
	String formattedDate = dateFormat.format(date);
	
	Complaints comp = new Complaints(type,desc,"Registered","NoUpdateYet !",formattedDate,"....",flatNo);
	complaintService.saveComplaint(comp);
	
	return "redirect:/complaintlist";
	
}

@GetMapping("/instantiatecomplaint")
public String comp() {
	return "addcomplaint.jsp";
}

@GetMapping("/complaintlist")
public String complaintList(HttpServletRequest req) {
	HttpSession session= req.getSession();
	if(session.getAttribute("email")==null) {
		session.invalidate();
		return "login.jsp";
	}
	int flatNo=(int) session.getAttribute("flatNo");
	System.out.print("Inside controller Flatno :"+flatNo);
	session.setAttribute("complaintlist",  this.complaintService.getComplaintByFlatNo(flatNo));
	return "viewcomplaintsUser.jsp";	
}

@GetMapping("/deleteComplaint")
public String deleteComplaint(@RequestParam("id") String value ) {
	int id= Integer.parseInt(value);
	this.complaintService.deleteComplaintById(id);
	return "redirect:/complaintlist";
}

@PostMapping("/Updatecomplaint") //userEnd
public String UpdateComplaint(@RequestParam("id") String id,@RequestParam("flatNo") String flatNo,@RequestParam("type") String type,@RequestParam("desc") String desc) {
	
	int cid= Integer.parseInt(id);
	int FlatNo= Integer.parseInt(flatNo);
	Complaints c= complaintService.getComplaintById(cid);
	c.setDescription(desc);
	c.setType(type);
	this.complaintService.saveComplaint(c);
	System.out.print("Inside controller updateComplaint :"+ c);
	return "redirect:/complaintlist";
}

@GetMapping("/makeUpdate")
public String UpdateComp(@RequestParam("id") String value,Model model) {
	int id= Integer.parseInt(value);
	model.addAttribute("comp", complaintService.getComplaintById(id));
	System.out.print("Inside controller complaint :"+ complaintService.getComplaintById(id) );
	
	return "updateComplaintUser.jsp";
}

@GetMapping("/viewcomplaint")
public String getlists(Model model) {
	List<Complaints> complist = complaintService.getAllComplaint();
	model.addAttribute("clist", complist);
	return "viewcomplaint.jsp";
}

@PostMapping("/compdetails")
public String getComplaints(@RequestParam("compid") String id,  Model model) 
{
	Complaints comp = complaintService.getComplaintById(Integer.parseInt(id));
	model.addAttribute("complaint", comp);
	return "complaintstatus.jsp";
}

@PostMapping("/removecomplaint")
public String removeComplaint(@RequestParam("compid") String compid, Model model) {
	Complaints comp = complaintService.getComplaintById(Integer.parseInt(compid));
	complaintService.deleteComplaint(comp);
	List<Complaints> clist = complaintService.getAllComplaint();
	model.addAttribute("clist", clist);
	return "viewcomplaint.jsp";
}

@PostMapping("/updatecomplaint") //AdminEnd
public String updateComplaint(@RequestParam("compid") String id, 
		@RequestParam("adminremark") String adminremark, 
		@RequestParam("compstatus") String compstatus, 
		Model model) {
	Complaints comp = complaintService.getComplaintById(Integer.parseInt(id));
	comp.setStatus(null);
	comp.setRemark(adminremark);
	comp.setStatus(compstatus);
	Date date = new Date();
	String strDateFormat = "yyyy-MM-dd";
	DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
	String formattedDate = dateFormat.format(date);
	comp.setResolvedate(formattedDate);
	List<Complaints> complist = complaintService.getAllComplaint();
	complaintService.saveComplaint(comp);
	model.addAttribute("clist", complist);
	return "viewcomplaint.jsp";
}

}

