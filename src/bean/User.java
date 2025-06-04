package bean;

/**
 * Servlet implementation class User
 */
public class User implements java.io.Serializable {
	// 利用者ID
	private String userId;
	// 名前
	private String studentName;
	// パスワード
	private String password;
	// 学校ID
	private School school = new School();
	// 権限ID
	private Role role = new Role();


	// ゲッター
	public String getUserId(){
		return this.userId;
	}
	public School getSchool(){
		return this.school;
	}
	public Role getRole(){
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
	public void setSchool(School school){
		this.school = school;
	}
	public void setRole(Role role){
		this.role = role;
	}
	public void setStudentName(String studentName){
		this.studentName = studentName;
	}
	public void setPassword(String password){
		this.password = password;
	}
}
