package society.mgmt.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import society.mgmt.entities.*;

import society.mgmt.service.AllotmentDetailsService;
import society.mgmt.service.FlatDetailsService;

@Controller
public class AllotmentDetailsController {
   
	@Autowired
	FlatDetailsService fservice;
	
	@Autowired
	AllotmentDetailsService aservice;
	
	
	@RequestMapping("/member")
	public String member(Model model) {
		List<FlatDetails> flist = fservice.getAllFlats();
		model.addAttribute("flatlist", flist);
		model.addAttribute("error", null);
		return "addmember.jsp";
	}
	
	@GetMapping("/view")
	public String getlists(Model model) {
		List<AllotmentDetails> list = aservice.getAllAllotments();
		model.addAttribute("lists", list);
		return "viewmember.jsp";

	}
	
	@PostMapping("/addmembers")
	public String addmembers(@ModelAttribute("member") AllotmentDetails ad, Model model) {
		// System.out.println(ad);
		Date date = new Date();
		String strDateFormat = "dd/MM/yyyy";
		DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
		String formattedDate = dateFormat.format(date);
		
		ad.setDate(formattedDate);
		ad.setPassword(ad.getMobNo());
		ad.setRoleId(2);
		AllotmentDetails allo= aservice.getAllotmentByFlatNo(ad.getFlatNo());
		AllotmentDetails emailverification = aservice.getAllotmentByEmail(ad.getEmail());
		List<AllotmentDetails> list =  aservice.getAllAllotments();
		list.add(ad);
		model.addAttribute("lists", list);
		if(allo==null && emailverification==null) {
		aservice.saveAllotment(ad);
		return "viewmember.jsp";
		}else {
			List<FlatDetails> flist =  fservice.getAllFlats();
			model.addAttribute("flatlist", flist);
			if(allo!=null)
			model.addAttribute("error", "Flat is Already Assigned");
			else
		    model.addAttribute("error", "Email is Already Assigned");	
			return "addmember.jsp";
		}
	}
	
	@PostMapping("/inactivemember")
	public String deleteMember(@RequestParam("mememail") String email, Model model){
		AllotmentDetails ad = aservice.getAllotmentByEmail(email);
		aservice.deleteAllotment(ad);
		List<AllotmentDetails> alist = aservice.getAllAllotments();
		model.addAttribute("lists", alist);
		return "viewmember.jsp";
	}
	
	@PostMapping("/editmemberform")
	public String getUpdateForm(@RequestParam("mememail") String email, Model model) {
		AllotmentDetails allo = aservice.getAllotmentByEmail(email);
		model.addAttribute("member", allo);
		return "updatemember.jsp";
	}
	
	@PostMapping("/updatemember")
	public String updateMember(@RequestParam("id") String id, 
			@RequestParam("name") String name, 
			@RequestParam("mobNo") String mobno, 
			@RequestParam("email") String email, 
			@RequestParam("flatNo") String flatno ,
			@RequestParam("members") String mem, Model model) {
		
		AllotmentDetails ad=aservice.getAllotmentByEmail(email);
		//System.out.print("inside update member :"+ ad);
		List<AllotmentDetails> alist = aservice.getAllAllotments(); 
		//System.out.println(ad);
		if(ad!=null) {
			
		ad.setId(Integer.parseInt(id));
		ad.setName(name);
		ad.setEmail(email);
		ad.setMobNo(mobno);
		ad.setFlatNo(Integer.parseInt(flatno));
		ad.setMembers(Integer.parseInt(mem));
		
		aservice.saveAllotment(ad);
		}
		
		model.addAttribute("lists", alist);
		return "viewmember.jsp";
	}
}
