package bean;

/**
 * Servlet implementation class Role
 */
public class Role implements java.io.Serializable {
	private String Id;
	private String roleName;
	private Integer permission;


	// ゲッター
	public String getId(){
		return this.Id;
	}
	public String getRoleName(){
		return this.roleName;
	}
	public Integer getPermission(){
		return this.permission;
	}


	// セッター
	public void setId(String Id){
		this.Id = Id;
	}
	public void setRoleName(String roleName){
		this.roleName = roleName;
	}
	public void setPermission(Integer permission){
		this.permission = permission;
	}
}
