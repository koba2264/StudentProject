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
	private String studentId;
	// 生徒の名前
	private String studentName;
	// 性別
	private Gender gender;
	// 入学年度
	private String enrollmentYear;
	// クラス情報
	private Class myClass;
	//	在学フラグ
	private boolean isAttend;
	//	得点情報<key: subjectId, value: 得点情報>
	private Map<String, Score> scores = new HashMap<>();

	//ゲッター
	public String getStudentId(){
		return this.studentId;
	}
	public String getStudentName(){
		return this.studentName;
	}
	public Gender getGender(){
		return this.gender;
	}
	public String getEnrollmentYear(){
		return this.enrollmentYear;
	}
	public Class getMyClass() {
		return myClass;
	}


	// セッター
	public void setStudentId(String studentId){
		this.studentId = studentId;
	}
	public void setStudentName(String studentName){
		this.studentName = studentName;
	}
	public void setGender(Gender gender){
		this.gender = gender;
	}
	public void setEnrollmentYear(String enrollmentYear){
		this.enrollmentYear = enrollmentYear;
	}
	public boolean isAttend() {
		return isAttend;
	}
	public void setAttend(boolean isAttend) {
		this.isAttend = isAttend;
	}
	public Map<String, Score> getScores() {
		return scores;
	}
	public void setScores(Score score) {
		this.scores.put(score.getSubject().getId(), score);
	}
	public void setMyClass(Class myClass) {
		this.myClass = myClass;
	}
}
