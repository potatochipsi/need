package entity;

/**
 * IndustryInfo entity. @author MyEclipse Persistence Tools
 */

public class IndustryInfo implements java.io.Serializable {

	// Fields

	private String code;
	private String title;

	// Constructors

	/** default constructor */
	public IndustryInfo() {
	}

	/** minimal constructor */
	public IndustryInfo(String code) {
		this.code = code;
	}

	/** full constructor */
	public IndustryInfo(String code, String title) {
		this.code = code;
		this.title = title;
	}

	// Property accessors

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}