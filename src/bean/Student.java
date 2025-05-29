package bean;

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
}
