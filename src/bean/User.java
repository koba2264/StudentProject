package bean;

import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class User
 */
public class User implements java.io.Serializable, Comparable<User> {
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
	// 受け持ちクラス
	private List<MyClass> classes = new ArrayList<>();
	// 受け持ち科目
	private List<Subject> subjects = new ArrayList<>();



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
	public List<MyClass> getClasses() {
		return classes;
	}
	public List<Subject> getSubjects() {
		return subjects;
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
	public void setClasses(List<MyClass> classes) {
		this.classes = classes;
	}
	public void setSubjects(List<Subject> subjects) {
		this.subjects = subjects;
	}

//	自然順序付けようのメソッド
	@Override
	public int compareTo(User o) {
		int result = this.school.getId().compareTo(o.getSchool().getId());
		if (result == 0) {
			result = this.userId.compareTo(o.getUserId());
		}
		return result;
	}
}
