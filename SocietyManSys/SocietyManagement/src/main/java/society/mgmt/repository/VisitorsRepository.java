package society.mgmt.repository;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import society.mgmt.entities.Visitors;

@Repository
public interface VisitorsRepository extends JpaRepository<Visitors, Integer> {
	public List<Visitors> findByFlatNo (int FlatNo);
	public Visitors findByContactNo(String number);
	
	@Query("SELECT p FROM Visitors p WHERE p.flatNo=:key")
	public List<Visitors> getByFlatno(@Param("key") int keyword);
	
	
}
