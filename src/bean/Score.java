package bean;

/**
 * Servlet implementation class Score
 */
public class Score implements java.io.Serializable {
	// 生徒のID
	private String studentId;
	// 科目情報
	private Subject subject;
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
	public Subject getSubject(){
		return this.subject;
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
	public void setSubject(Subject subject){
		this.subject = subject;
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
