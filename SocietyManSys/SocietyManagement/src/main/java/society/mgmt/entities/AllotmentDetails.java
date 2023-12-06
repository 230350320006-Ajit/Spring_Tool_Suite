package society.mgmt.entities;

import javax.annotation.Generated;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class AllotmentDetails {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String mobNo;
	private String email;
	private String password;
	private int flatNo; 
	private int members;
	private String date;
	private int roleId ;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobNo() {
		return mobNo;
	}
	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getFlatNo() {
		return flatNo;
	}
	public void setFlatNo(int flatNo) {
		this.flatNo = flatNo;
	}
	
	public int getMembers() {
		return members;
	}
	public void setMembers(int members) {
		this.members = members;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	@Override
	public String toString() {
		return "AllotmentDetails [id=" + id + ", name=" + name + ", mobNo=" + mobNo + ", email=" + email + ", password="
				+ password + ", flatNo=" + flatNo + ", members=" + members + ", date=" + date
				+ ", roleId=" + roleId + ", getId()=" + getId() + ", getName()=" + getName() + ", getMobNo()="
				+ getMobNo() + ", getEmail()=" + getEmail() + ", getPassword()=" + getPassword() + ", getFlatNo()="
				+ getFlatNo() + ", getMembers()=" + getMembers() + ", getDate()="
				+ getDate() + ", getRoleId()=" + getRoleId() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	public AllotmentDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AllotmentDetails(int id, String name, String mobNo, String email, String password, int flatNo,
			 int members, String date, int roleId) {
		super();
		this.id = id;
		this.name = name;
		this.mobNo = mobNo;
		this.email = email;
		this.password = password;
		this.flatNo = flatNo;
		this.members = members;
		this.date = date;
		this.roleId = roleId;
	}
	public AllotmentDetails(String name, String mobNo, String email, String password, int flatNo, int members,
			String date, int roleId) {
		super();
		this.name = name;
		this.mobNo = mobNo;
		this.email = email;
		this.password = password;
		this.flatNo = flatNo;
		this.members = members;
		this.date = date;
		this.roleId = roleId;
	}
	
	
	
}
