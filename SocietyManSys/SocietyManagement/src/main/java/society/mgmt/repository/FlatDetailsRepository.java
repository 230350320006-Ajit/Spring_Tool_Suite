package society.mgmt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import society.mgmt.entities.FlatDetails;

@Repository
public interface FlatDetailsRepository extends JpaRepository<FlatDetails, Integer> {
   public FlatDetails findByFlatNo(int flatNo);
	
}
