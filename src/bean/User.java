package bean;

import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class User
 */
public class User implements java.io.Serializable {
	// 利用者ID
	private String userId;
	// 学校ID
	private Map<String, School> school = new HashMap<>();
	// 権限ID
	private Map<String, Role> role = new HashMap<>();
	// 名前
	private String studentName;
	// パスワード
	private String password;


	// ゲッター
	public String getUserId(){
		return this.userId;
	}
	public Map<String, School> getSchool(){
		return this.school;
	}
	public Map<String, Role> getRole(){
		return this.role;
	}
	public String getStudentName(){
		return this.studentName;
	}
	public String getPassword(){
		return this.password;
	}


	// セッター
	public void setUserId(String userId){
		this.userId = userId;
	}
	public void setSchool(Map<String, School> school){
		this.school = school;
	}
	public void setRole(Map<String, Role> role){
		this.role = role;
	}
	public void setStudentName(String studentName){
		this.studentName = studentName;
	}
	public void setPassword(String password){
		this.password = password;
	}
}
