package entity;

/**
 * RoleInfo entity. @author MyEclipse Persistence Tools
 */

public class RoleInfo implements java.io.Serializable {

	// Fields

	private Integer roleId;
	private String roleName;
	private String authIds;
	private String roleDec;

	// Constructors

	/** default constructor */
	public RoleInfo() {
	}

	/** full constructor */
	public RoleInfo(String roleName, String authIds, String roleDec) {
		this.roleName = roleName;
		this.authIds = authIds;
		this.roleDec = roleDec;
	}

	// Property accessors

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getAuthIds() {
		return this.authIds;
	}

	public void setAuthIds(String authIds) {
		this.authIds = authIds;
	}

	public String getRoleDec() {
		return this.roleDec;
	}

	public void setRoleDec(String roleDec) {
		this.roleDec = roleDec;
	}

}