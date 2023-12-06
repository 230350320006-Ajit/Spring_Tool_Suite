package society.mgmt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import society.mgmt.entities.Complaints;
import society.mgmt.repository.ComplaintsRepository;
@Service
public class ComplaintsServiceImpl implements ComplaintsService {

	@Autowired
	ComplaintsRepository repo;
	
	@Override
	public List<Complaints> getComplaintByFlatNo(int flatNo) {
		
		return this.repo.findComplaintByFlatNo(flatNo);
	}

	@Override
	public void saveComplaint(Complaints complaints) {
    this.repo.save(complaints);

	}

	@Override
	public void deleteComplaintById(int id) {
		this.repo.deleteById(id);
		
	}

	@Override
	public Complaints getComplaintById(int id) {
		
		return this.repo.getById(id);
	}

	@Override
	public List<Complaints> getAllComplaint() {
		
		return this.repo.findAll();
	}

	@Override
	public void deleteComplaint(Complaints comp) {
		this.repo.delete(comp);
		
	}


}
