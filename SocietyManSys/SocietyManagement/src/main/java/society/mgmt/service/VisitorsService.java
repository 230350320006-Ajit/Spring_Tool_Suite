package society.mgmt.service;

import java.util.List;

import society.mgmt.entities.AllotmentDetails;
import society.mgmt.entities.Visitors;

public interface VisitorsService {
	
public List<Visitors> getVisitorByFlat(int flatNo);
public void saveVisitor(Visitors visitor);
public void deleteVisitorById (int id);
public Visitors FindByContactNo(String number);
public List<Visitors> getAllVisitor();

}
