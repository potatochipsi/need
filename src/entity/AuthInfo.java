package entity;

/**
 * AuthInfo entity. @author MyEclipse Persistence Tools
 */

public class AuthInfo implements java.io.Serializable {

	// Fields

	private Integer authId;
	private String authName;
	private Integer parentId;
	private String authDec;
	private String authState;
	private String authIcon;

	// Constructors

	/** default constructor */
	public AuthInfo() {
	}

	/** full constructor */
	public AuthInfo(String authName, Integer parentId, String authDec,
			String authState, String authIcon) {
		this.authName = authName;
		this.parentId = parentId;
		this.authDec = authDec;
		this.authState = authState;
		this.authIcon = authIcon;
	}

	// Property accessors

	public Integer getAuthId() {
		return this.authId;
	}

	public void setAuthId(Integer authId) {
		this.authId = authId;
	}

	public String getAuthName() {
		return this.authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getAuthDec() {
		return this.authDec;
	}

	public void setAuthDec(String authDec) {
		this.authDec = authDec;
	}

	public String getAuthState() {
		return this.authState;
	}

	public void setAuthState(String authState) {
		this.authState = authState;
	}

	public String getAuthIcon() {
		return this.authIcon;
	}

	public void setAuthIcon(String authIcon) {
		this.authIcon = authIcon;
	}

}