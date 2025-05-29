package bean;

/**
 * Servlet implementation class Score
 */
public class Score implements java.io.Serializable {
	// 生徒のID
	private String studentId;
	// 科目のID
	private String subjectId;
	// クラスのID
	private String classId;
	// 回数
	private Integer count;
	// 点数
	private Integer score;


	// ゲッター
	public String getStudentId(){
		return this.studentId;
	}
	public String getSubjectId(){
		return this.subjectId;
	}
	public String getClassId(){
		return this.classId;
	}
	public Integer getCount(){
		return this.count;
	}
	public Integer getScore(){
		return this.score;
	}


	// セッター
	public void setStudentId(String studentId){
		this.studentId = studentId;
	}
	public void setSubjectId(String subjectId){
		this.subjectId = subjectId;
	}
	public void setClassId(String classId){
		this.classId = classId;
	}
	public void setCount(Integer count){
		this.count = count;
	}
	public void setScore(Integer score){
		this.score = score;
	}
}
