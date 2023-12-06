package society.mgmt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import society.mgmt.entities.AllotmentDetails;
import society.mgmt.entities.Complaints;
import society.mgmt.entities.FlatDetails;
import society.mgmt.repository.ComplaintsRepository;
import society.mgmt.service.AllotmentDetailsService;
import society.mgmt.service.ComplaintsService;
import society.mgmt.service.FlatDetailsService;

@Controller
public class Dashboard {

		
		@Autowired
		private ComplaintsService cs;
		
		@Autowired
		private AllotmentDetailsService ads;
		
		@Autowired
		private FlatDetailsService fds;
		
		@Autowired
		private ComplaintsRepository cr;
		
		@RequestMapping("/dashboard")
		public String dashboard(Model model) {
			
			List<Complaints> clist=cs.getAllComplaint();
			List<AllotmentDetails> alist=ads.getAllAllotments();
			List<FlatDetails> flist=fds.getAllFlats();
			//flist.sort();
			model.addAttribute("comlist", clist);
			model.addAttribute("member", alist.size());
			model.addAttribute("flats", flist.size());
			return "dashboard.jsp";
		
		}
		
		@PostMapping("/dashboardsearch")
		public String dashBoardSearch(@RequestParam("keyword") String keyword, Model model) {
			
			List<Complaints> clist=cr.getComp(keyword);
			List<AllotmentDetails> alist=ads.getAllAllotments();
			List<FlatDetails> flist=fds.getAllFlats();
			//flist.sort();
			model.addAttribute("comlist", clist);
			model.addAttribute("member", alist.size());
			model.addAttribute("flats", flist.size());
			
			
			
			return "dashboard.jsp";
		}

}
