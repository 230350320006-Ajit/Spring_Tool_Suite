package society.mgmt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import society.mgmt.entities.AllotmentDetails;
import society.mgmt.repository.AllotmentDetailsRepository;

@Service
public class AllotmentDetailsServiceImpl implements AllotmentDetailsService {
   
	@Autowired
	AllotmentDetailsRepository allotmentDetailsRepository;

	@Override
	public List<AllotmentDetails> getAllAllotments() {
		
		return allotmentDetailsRepository.findAll();
	}

	@Override
	public int validate(String email, String password) {
		AllotmentDetails list =  allotmentDetailsRepository.findByEmail(email);
		//System.out.print("inside service");
		//System.out.print("list inside service impl :"+ list);
		//System.out.print("email :"+ list.getEmail());
		if(list!=null) {
			if(email.equals(list.getEmail()) && password.equals(list.getPassword()) && list.getRoleId() == 1) {
				return 1;
			}
				
			else if(email.equals(list.getEmail()) && password.equals(list.getPassword()) && password.equals(list.getMobNo())) {
				return 2;
			}
			    
			else if(email.equals(list.getEmail()) && password.equals(list.getPassword()) && list.getRoleId() == 2) {
				return 3;
			}
	            
	           else {
	        	   return 0;
	           }
	        	 
		}else {
			return 0;
		}
		
	}

	@Override
	public void saveAllotment(AllotmentDetails allotmentDetails) {
		
		this.allotmentDetailsRepository.save(allotmentDetails);
	}

	@Override
	public void deleteAllotmentById(int id) {
	   this.allotmentDetailsRepository.deleteById(id);
		
	}

	@Override
	public AllotmentDetails getAllotmentById(int id) {
		
		return this.allotmentDetailsRepository.getById(id);
	}

	@Override
	public boolean resetPassword(String email, String password) {
		AllotmentDetails list =  allotmentDetailsRepository.findByEmail(email);
		if(email.equals(list.getEmail()))
		{
			AllotmentDetails ad = list;
			ad.setPassword(password);
			this.allotmentDetailsRepository.save(ad);
			return true;
		}
		return false;
	}

	@Override
	public AllotmentDetails getAllotmentByEmail(String email) {
		
		return (AllotmentDetails) this.allotmentDetailsRepository.findByEmail(email);
	}

	@Override
	public AllotmentDetails getAllotmentByFlatNo(int flatNo) {
		
		return this.allotmentDetailsRepository.findByFlatNo(flatNo);
	}

	@Override
	public void deleteAllotment(AllotmentDetails ad) {
		this.allotmentDetailsRepository.delete(ad);
		
	}
	
	
	
}
