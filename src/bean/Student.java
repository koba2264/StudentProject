package bean;

import java.util.HashMap;
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
	private Map<String, Score> scores = new HashMap<>();

	//ゲッター
	public String getId(){
		return this.id;
	}
	public String getName(){
		return this.name;
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
	public Map<String, Score> getScores() {
		return scores;
	}

	// セッター
	public void setId(String id){
		this.id = id;
	}
	public void setName(String name){
		this.name = name;
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
		this.scores.put(score.getSubject().getId(), score);
	}
	public void setMyClass(MyClass myClass) {
		this.myClass = myClass;
	}
}
