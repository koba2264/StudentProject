package bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;

/***
 * 学生情報を保存するBean
 * @author s_kobayashi
 *
 */
public class Student extends HttpServlet {
	// 学籍番号
	private String id;
	// 生徒の名前
	private String name;
	// 性別
	private Gender gender;
	// 入学年度
	private int enrollmentYear;
	// クラス情報
	private MyClass myClass;
	//	在学フラグ
	private boolean isAttend;
	//	得点情報<key: subjectId, value: 得点情報>
	private Map<String, List<Score>> scores = new HashMap<>();

	//ゲッター
	public String getId(){
		return this.id;
	}

	public Gender getGender(){
		return this.gender;
	}
	public int getEnrollmentYear(){
		return this.enrollmentYear;
	}
	public MyClass getMyClass() {
		return myClass;
	}

	public boolean getIsAttend() {
		return isAttend;
	}
	public Map<String, List<Score>> getScores() {
		return scores;
	}

	// セッター
	public void setId(String id){
		this.id = id;
	}

	public void setGender(Gender gender){
		this.gender = gender;
	}
	public void setEnrollmentYear(int enrollmentYear){
		this.enrollmentYear = enrollmentYear;
	}
	public void setAttend(boolean isAttend) {
		this.isAttend = isAttend;
	}
	public void setScores(Score score) {
		List<Score> tmp = this.scores.get(score.getSubject().getId());
		if (tmp.size() < 2) {
			tmp.add(score);
			this.scores.put(score.getSubject().getId(), tmp);
		}
	}
	public void setMap(List<Subject> subjects) {
		for (Subject subject : subjects) {
			this.scores.put(subject.getId(), new ArrayList<Score>());
		}
	}
	public void setMyClass(MyClass myClass) {
		this.myClass = myClass;
		this.setMap(this.myClass.getSubjects());
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
