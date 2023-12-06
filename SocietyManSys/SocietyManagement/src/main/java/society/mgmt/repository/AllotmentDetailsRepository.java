package society.mgmt.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import society.mgmt.entities.AllotmentDetails;

@Repository
public interface AllotmentDetailsRepository extends JpaRepository<AllotmentDetails, Integer> {
     public AllotmentDetails findByEmail(String email);
     public AllotmentDetails findByFlatNo(int flatNo);
}
