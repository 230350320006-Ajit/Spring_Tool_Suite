package society.mgmt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import society.mgmt.entities.Visitors;
import society.mgmt.repository.VisitorsRepository;

@Service
public class VisitorsServiceImpl implements VisitorsService {
    @Autowired
	VisitorsRepository repo;
	
	@Override
	public List<Visitors> getVisitorByFlat(int flatNo) {
		
		return repo.findByFlatNo(flatNo);
	}

	@Override
	public void saveVisitor(Visitors visitor) {
		
		this.repo.save(visitor);
	}

	@Override
	public void deleteVisitorById(int id) {
		this.repo.deleteById(id);
		
	}

	@Override
	public Visitors FindByContactNo(String number) {
		
		return repo.findByContactNo(number);
	}

	@Override
	public List<Visitors> getAllVisitor() {
		
		return repo.findAll();
	}
  
	}


