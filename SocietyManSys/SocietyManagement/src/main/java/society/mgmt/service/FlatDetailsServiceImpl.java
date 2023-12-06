package society.mgmt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import society.mgmt.entities.AllotmentDetails;
import society.mgmt.entities.FlatDetails;
import society.mgmt.repository.FlatDetailsRepository;

@Service
public class FlatDetailsServiceImpl implements FlatDetailsService{
 @Autowired
 FlatDetailsRepository repo;
	
	@Override
	public List<FlatDetails> getAllFlats() {
		return this.repo.findAll();
		
}

	@Override
	public FlatDetails getFlatByFlatNo(int flatNo) {
		
		return this.repo.findByFlatNo(flatNo);
	}

	@Override
	public void saveFlat(FlatDetails flat) {
		this.repo.save(flat);
		
	}

	@Override
	public void deleteFlat(FlatDetails flat) {
		this.repo.delete(flat);
		
	}
	
}
