package bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Class implements Serializable {
	private String id;
	private List<School> schools = new ArrayList<>();
	private String name;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<School> getSchools() {
		return schools;
	}
	public void setSchools(List<School> schools) {
		this.schools = schools;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
