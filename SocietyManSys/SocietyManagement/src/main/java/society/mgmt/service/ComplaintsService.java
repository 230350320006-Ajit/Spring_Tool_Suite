package society.mgmt.service;

import java.util.List;

import org.springframework.stereotype.Service;

import society.mgmt.entities.Complaints;


public interface ComplaintsService {

    public List<Complaints> getComplaintByFlatNo (int flatNo);
    public List<Complaints> getAllComplaint ();
	public void deleteComplaintById(int id);
	public void deleteComplaint(Complaints comp);
	public void saveComplaint(Complaints complaints);
	public Complaints getComplaintById(int id);
	
}