package entity;

/**
 * UserInfo entity. @author MyEclipse Persistence Tools
 */

public class UserInfo implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userName;
	private String pwd;
	private String insName;
	private String userDec;
	private Integer roleId;

	// Constructors

	/** default constructor */
	public UserInfo() {
	}

	/** full constructor */
	public UserInfo(String userName, String pwd, String insName,
			String userDec, Integer roleId) {
		this.userName = userName;
		this.pwd = pwd;
		this.insName = insName;
		this.userDec = userDec;
		this.roleId = roleId;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getInsName() {
		return this.insName;
	}

	public void setInsName(String insName) {
		this.insName = insName;
	}

	public String getUserDec() {
		return this.userDec;
	}

	public void setUserDec(String userDec) {
		this.userDec = userDec;
	}

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

}