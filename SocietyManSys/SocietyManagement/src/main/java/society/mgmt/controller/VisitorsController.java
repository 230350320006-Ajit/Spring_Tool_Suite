package society.mgmt.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import society.mgmt.entities.Visitors;
import society.mgmt.repository.VisitorsRepository;
import society.mgmt.service.VisitorsService;

@Controller
public class VisitorsController {

	@Autowired
	VisitorsService visitorsService;
	@Autowired
	VisitorsRepository vrepo;
	
	private String getPathOfUser() throws IOException {
		return "C:\\Users\\.Paas\\Downloads\\SocietyManagement\\src\\main\\resources\\static\\image";
	}

	@GetMapping("/visitorlist")
	public String visitorList(HttpServletRequest req) {
		HttpSession session= req.getSession();
		if(session.getAttribute("email")==null) {
			session.invalidate();
			return "login.jsp";
		}
		int flatNo=(int) session.getAttribute("flatNo");
		System.out.print("Inside controller Flatno :"+flatNo);
		session.setAttribute("visitorlist",  this.visitorsService.getVisitorByFlat(flatNo));
		//model.addAttribute("visitorlist", this.visitorsService.getVisitorByFlat(flatNo) );
		return "visitor-list.jsp";	
	}
	
	@GetMapping("/addvisitor")
	public String addVisitor(HttpServletRequest req,Model model) {
		HttpSession session= req.getSession();
		System.out.print("Inside controller addvisitor Flatno :"+ session.getAttribute("flatNo"));
		model.addAttribute("flatNo",session.getAttribute("flatNo"));
		return "addnewvisitor.jsp";
	}
	
	@PostMapping("/savevisitor")
	public String saveVisitor(@RequestParam("name") String name, @RequestParam("contactNo") String contactNo,
			@RequestParam("relation") String relation, @RequestParam("flatNo") String flatno,
			@RequestParam("photoid") MultipartFile photoid, Model model) {
		
		Visitors vis = visitorsService.FindByContactNo(name);
		
		
		try {
			String imgdirectory = getPathOfUser();
			Visitors visitor = new Visitors();
			visitor.setVisitorName(name);
			visitor.setContactNo(contactNo);
			visitor.setRelation(relation);
			visitor.setFlatNo(Integer.parseInt(flatno));
			Path filepath = Paths.get(imgdirectory, photoid.getOriginalFilename());

			Files.copy(photoid.getInputStream(),
					Paths.get(imgdirectory + File.separator + photoid.getOriginalFilename()),
					StandardCopyOption.REPLACE_EXISTING);
			visitor.setPhotoid("http://localhost:9090/image/" + photoid.getOriginalFilename());
			if (vis == null) {
			visitorsService.saveVisitor(visitor);
			}
			
		
		} catch (IOException e) {

			e.printStackTrace();
		}
	
		return "redirect:/visitorlist";
	}
	
	@GetMapping("/deleteVisitor")
	public String deleteVisitor(@RequestParam("id") String value ) {
		int id= Integer.parseInt(value);
		System.out.print("Inside controller :"+ id);
		this.visitorsService.deleteVisitorById(id);
		return "redirect:/visitorlist";
	}
	
	@GetMapping("/viewvisitors")
	public String viewVisitors(Model model) {
		List<Visitors> vlist = visitorsService.getAllVisitor();
//		 vlist.forEach(visit->{
//				visit.setPhotoid("image/" +visit.getPhotoid());
//		
//			});
		model.addAttribute("vlist", vlist);
		return "viewvisitors.jsp";
	}
	
	@PostMapping("/searchvis")
	public String getvisit(Model model, @RequestParam("keyword") String keyword) {
		List<Visitors>  visilist=vrepo.getByFlatno(Integer.parseInt(keyword));
//		visilist.forEach(visit->{
//			visit.setPhotoid("image/" +visit.getPhotoid());
//	
//		});
		model.addAttribute("vlist", visilist);
		return "viewvisitors.jsp";
		
	}
	
	@PostMapping("/searchall")
	public String visitor(Model model){
		List<Visitors>  visilist=visitorsService.getAllVisitor();
		model.addAttribute("vlist", visilist);
		return "viewvisitors.jsp";
	}
	
}
