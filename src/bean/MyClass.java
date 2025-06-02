package bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/***
 * クラス情報を保存するBean
 * @author s_kobayashi
 *
 */
public class MyClass implements Serializable {
	// クラスID
	private String id;
	// 学校情報
	private School school;
	// クラス名
	private String name;
	// 受講科目
	private List<Subject> subjects = new ArrayList<>();

	// ゲッター
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public School getSchool() {
		return school;
	}
	public List<Subject> getSubjects() {
		return subjects;
	}

	// セッター
	public void setId(String id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setSchool(School school) {
		this.school = school;
	}
	public void setSubjects(Subject subject) {
		this.subjects.add(subject);
	}
}
