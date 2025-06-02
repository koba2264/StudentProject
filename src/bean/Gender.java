package bean;

import java.io.Serializable;

/***
 * 性別情報を保存するBeanクラス
 * @author s_kobayashi
 *
 */
public class Gender implements Serializable {
	// 性別ID
	private String id;
	// 性別名
	private String name;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
