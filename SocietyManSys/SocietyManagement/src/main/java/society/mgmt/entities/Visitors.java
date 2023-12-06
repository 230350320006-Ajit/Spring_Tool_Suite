package society.mgmt.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Visitors {
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;
	private int flatNo;
	private String visitorName;
	private String contactNo;
	private String relation;
	private String photoid;
	

	public Visitors(int flatNo, String visitorName, String contactNo, String relation, String photoid) {
		super();
		this.flatNo = flatNo;
		this.visitorName = visitorName;
		this.contactNo = contactNo;
		this.relation = relation;
		this.photoid = photoid;
	}
	public Visitors(int id, int flatNo, String visitorName, String contactNo, String relation, String photoid) {
		super();
		this.id = id;
		this.flatNo = flatNo;
		this.visitorName = visitorName;
		this.contactNo = contactNo;
		this.relation = relation;
		this.photoid = photoid;
	}
	public int getFlatNo() {
		return flatNo;
	}
	public void setFlatNo(int flatNo) {
		this.flatNo = flatNo;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getVisitorName() {
		return visitorName;
	}
	public void setVisitorName(String visitorName) {
		this.visitorName = visitorName;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}
	
	public Visitors() {
		super();
		
	}
	public String getPhotoid() {
		return photoid;
	}
	public void setPhotoid(String photoid) {
		this.photoid = photoid;
	}
	
}
