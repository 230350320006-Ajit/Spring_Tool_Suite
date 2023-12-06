package society.mgmt.service;

import java.util.List;

import society.mgmt.entities.FlatDetails;

public interface FlatDetailsService {

	public List<FlatDetails> getAllFlats();
	public FlatDetails getFlatByFlatNo(int flatNo);
	public void saveFlat(FlatDetails flat);
	public void deleteFlat(FlatDetails flat);
}
