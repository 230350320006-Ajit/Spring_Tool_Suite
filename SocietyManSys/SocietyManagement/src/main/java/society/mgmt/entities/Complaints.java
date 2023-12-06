package society.mgmt.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Complaints {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;
	private String type;
	private String description;
	private String status;
	private String remark;
	private String issuedate;
	private String resolvedate;
	private int flatNo;
	
	
	@Override
	public String toString() {
		return "Complaints [id=" + id + ", type=" + type + ", description=" + description + ", status=" + status
				+ ", remark=" + remark + ", issuedate=" + issuedate + ", resolvedate=" + resolvedate + ", flatNo="
				+ flatNo + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getIssuedate() {
		return issuedate;
	}
	public void setIssuedate(String issuedate) {
		this.issuedate = issuedate;
	}
	public String getResolvedate() {
		return resolvedate;
	}
	public void setResolvedate(String resolvedate) {
		this.resolvedate = resolvedate;
	}
	public int getFlatNo() {
		return flatNo;
	}
	public void setFlatNo(int flatNo) {
		this.flatNo = flatNo;
	}
	public Complaints() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Complaints(String type, String description, String status, String issuedate, int flatNo) {
		super();
		this.type = type;
		this.description = description;
		this.status = status;
		this.issuedate = issuedate;
		this.flatNo = flatNo;
	}
	public Complaints(String type, String description, String status, String remark, String issuedate,
			String resolvedate, int flatNo) {
		super();
		this.type = type;
		this.description = description;
		this.status = status;
		this.remark = remark;
		this.issuedate = issuedate;
		this.resolvedate = resolvedate;
		this.flatNo = flatNo;
	}
	public Complaints(int id, String type, String description, String status, String remark, String issuedate,
			String resolvedate, int flatNo) {
		super();
		this.id = id;
		this.type = type;
		this.description = description;
		this.status = status;
		this.remark = remark;
		this.issuedate = issuedate;
		this.resolvedate = resolvedate;
		this.flatNo = flatNo;
	}
	
	
	
}
