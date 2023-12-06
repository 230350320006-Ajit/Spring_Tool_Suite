package society.mgmt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import society.mgmt.entities.FlatDetails;
import society.mgmt.service.FlatDetailsService;

@Controller
public class FlatDetailsController {
    
	@Autowired
	FlatDetailsService fservice;
	
	@RequestMapping("/flats")
	public String flats() {
		return "addflat.jsp";
	}
	
	@GetMapping("/getflat")
	public String getFlat(Model model){
		List<FlatDetails> flatList =  fservice.getAllFlats();
		model.addAttribute("flatlist",flatList);
		return "viewflat.jsp";
	}
	
	@PostMapping("/addflats")
	public String addFlat(@ModelAttribute("flat") FlatDetails flat, Model model) {
		
		FlatDetails findflat = fservice.getFlatByFlatNo(flat.getFlatNo());
		
		if(findflat== null) {
			List<FlatDetails> flatList =  fservice.getAllFlats();
			model.addAttribute("flatlist",flatList);
			fservice.saveFlat(flat);
			flatList.add(flat);
			return "viewflat.jsp";
		}else {
			model.addAttribute("error", "FlatNo already exists");
			return "addflat.jsp";
		}
		
	}
	
	@PostMapping("/updateflatform")
	public String getUpdateForm(@RequestParam("flatNo") String flatno, Model model) {
		System.out.print("Inside controller :"+ Integer.parseInt(flatno));
		FlatDetails flat = fservice.getFlatByFlatNo(Integer.parseInt(flatno));
		model.addAttribute("flatlist", flat);
		return "updateflat.jsp";
	}

	
	 @PostMapping("/updateflat") 
	 public String updateFlat(@RequestParam("flatNo") String flatno, 
			 @RequestParam("floor") String floor,
			 @RequestParam("flatType") String flattype, Model model) {
		 FlatDetails flat = fservice.getFlatByFlatNo(Integer.parseInt(flatno));
		 if(flat!=null) {
			 flat.setFlatNo(Integer.parseInt(flatno));
			 flat.setFlatType(flattype);
			 flat.setFloor(floor);
			 fservice.saveFlat(flat);
			} 
		 List<FlatDetails> flist =fservice.getAllFlats();
		 model.addAttribute("flatlist", flist);
		 return "viewflat.jsp";
		}
	 
		
		@PostMapping("/deleteflat")
		public String deleteFlat(@RequestParam("flatNo") String flatno, Model model) {
			FlatDetails flat = fservice.getFlatByFlatNo(Integer.parseInt(flatno));
			fservice.deleteFlat(flat);
			List<FlatDetails> flist = fservice.getAllFlats();
			model.addAttribute("flatlist", flist);
			return "viewflat.jsp";
		}
	
}
