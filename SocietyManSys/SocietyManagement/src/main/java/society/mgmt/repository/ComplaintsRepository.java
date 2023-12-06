package society.mgmt.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import society.mgmt.entities.Complaints;
import society.mgmt.entities.Visitors;

@Repository
public interface ComplaintsRepository extends JpaRepository<Complaints, Integer>{

	public List<Complaints> findComplaintByFlatNo (int FlatNo);
	
	@Query("SELECT c FROM Complaints c WHERE CONCAT(c.flatNo, c.type, c.description, c.remark,c.status, c.issuedate, c.resolvedate) LIKE %:key%")
	  public List<Complaints> getComp(@Param("key") String keyword);

}
