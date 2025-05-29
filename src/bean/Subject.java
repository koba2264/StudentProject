package bean;

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
}
