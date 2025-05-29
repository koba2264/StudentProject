package bean;

/**
 * Servlet implementation class Subject
 */
public class Subject implements java.io.Serializable {
	// クラスID
	private String classId;
	// 科目名
	private String subjectName;
	// 学籍番号
	private String studentId;


	// ゲッター
	public String getClassId(){
		return this.classId;
	}
	public String getSubjectName(){
		return this.subjectName;
	}
	public String getStudentId(){
		return this.studentId;
	}


	// セッター
	public void setClassId(String classId){
		this.classId = classId;
	}
	public void setSubjectName(String subjectName){
		this.subjectName = subjectName;
	}
	public void setStudentId(String studentId){
		this.studentId = studentId;
	}
}
