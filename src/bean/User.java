package bean;

/**
 * Servlet implementation class User
 */
public class User implements java.io.Serializable {
	// 利用者ID
	private String userId;
	// 学校ID
	private String schoolId;
	// 権限ID
	private String roleId;
	// 名前
	private String studentName;
	// パスワード
	private String password;


	// ゲッター
	public String getUserId(){
		return this.userId;
	}
	public String getSchoolId(){
		return this.schoolId;
	}
	public String getRoleId(){
		return this.roleId;
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
	public void setSchoolId(String schoolId){
		this.schoolId = schoolId;
	}
	public void setRoleId(String roleId){
		this.roleId = roleId;
	}
	public void setStudentName(String studentName){
		this.studentName = studentName;
	}
	public void setPassword(String password){
		this.password = password;
	}
}
