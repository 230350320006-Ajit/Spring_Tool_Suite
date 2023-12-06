package society.mgmt.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class FlatDetails {
	@Id
	private int flatNo;
	private String floor;
	private String flatType;
	
	
	@Override
	public String toString() {
		return "FlatDetails [flatNo=" + flatNo + ", floor=" + floor + ", flatType=" + flatType + "]";
	}
	public FlatDetails(int flatNo, String floor, String flatType) {
		super();
		this.flatNo = flatNo;
		this.floor = floor;
		this.flatType = flatType;
	}
	public FlatDetails() {
		super();
	}
	public int getFlatNo() {
		return flatNo;
	}
	public void setFlatNo(int flatNo) {
		this.flatNo = flatNo;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getFlatType() {
		return flatType;
	}
	public void setFlatType(String flatType) {
		this.flatType = flatType;
	}

}
