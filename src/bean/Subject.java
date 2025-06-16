package bean;

import java.util.List;

/***
 * 科目情報を保存するBean
 * @author s_kobayashi
 *
 */
public class Subject implements java.io.Serializable {
	//	科目ID
	private String id;
	// 科目名
	private String name;
	// 担当教員
	private List<User> teachers;


	// ゲッター
	public String getId(){
		return this.id;
	}
	public String getName(){
		return this.name;
	}



	// セッター
	public void setId(String Id){
		this.id = Id;
	}
	public void setSubjectName(String name){
		this.name = name;
	}
	public List<User> getTeachers() {
		return teachers;
	}
	public void setTeachers(List<User> teachers) {
		this.teachers = teachers;
	}
}
