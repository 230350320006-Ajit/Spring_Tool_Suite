package society.mgmt.service;

import java.util.List;

import society.mgmt.entities.AllotmentDetails;

public interface AllotmentDetailsService {
	
	public List<AllotmentDetails> getAllAllotments();
	public int validate(String email,String password);
	void saveAllotment(AllotmentDetails allotmentDetails);
	void deleteAllotmentById(int id);
	public AllotmentDetails getAllotmentById(int id);
	public AllotmentDetails getAllotmentByFlatNo(int flatNo);
	public AllotmentDetails getAllotmentByEmail(String email);
	public boolean resetPassword(String email,String password);
	public void deleteAllotment(AllotmentDetails ad);
}
