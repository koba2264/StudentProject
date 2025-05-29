package bean;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class Student
 */
public class Student extends HttpServlet {
	// 学校ID
	private String schoolId;
	// クラスID
	private String classId;
	// 学籍番号
	private String studentId;
	// 生徒の名前
	private String studentName;
	// 性別
	private String gender;
	// 入学年度
	private String enrollmentYear;
	//	在学フラグ
	private boolean isAttend;
	//	得点情報<key: subjectId, value: 得点情報>
	private Map<String, Score> scores = new HashMap<>();

	//ゲッター
	public String getSchoolId(){
		return this.schoolId;
	}
	public String getClassId(){
		return this.classId;
	}
	public String getStudentId(){
		return this.studentId;
	}
	public String getStudentName(){
		return this.studentName;
	}
	public String getGender(){
		return this.gender;
	}
	public String getEnrollmentYear(){
		return this.enrollmentYear;
	}


	// セッター
	public void setSchoolId(String schoolId){
		this.schoolId = schoolId;
	}
	public void setClassId(String classId){
		this.classId = classId;
	}
	public void setStudentId(String studentId){
		this.studentId = studentId;
	}
	public void setStudentName(String studentName){
		this.studentName = studentName;
	}
	public void setGender(String gender){
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
		this.scores.put(score.getSubjectId(), score);
	}
}
